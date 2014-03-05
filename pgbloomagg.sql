CREATE FUNCTION bloom_agg_sfunc(bloom varbit, key text, m int) RETURNS varbit
    RETURNS NULL ON NULL INPUT
    IMMUTABLE
    LANGUAGE SQL
    AS $$
select set_bit(case when bit_length(bloom) = 0
                    then repeat('0', m)::varbit  -- first iteration
                    else bloom end,
               abs(hashtext(key)) % m,
               1);
$$;

CREATE AGGREGATE bloom_agg (text, int) (
    SFUNC = bloom_agg_sfunc,
    STYPE = varbit,
    INITCOND = ''
);

CREATE FUNCTION bloom_query(key text, bloom varbit) RETURNS boolean
    RETURNS NULL ON NULL INPUT
    IMMUTABLE
    LANGUAGE SQL
    AS $$
select get_bit(bloom, abs(hashtext(key)) % bit_length(bloom)) = 1;
$$;

CREATE OPERATOR << (
    PROCEDURE = bloom_query,
    LEFTARG = text,
    RIGHTARG = varbit
);
