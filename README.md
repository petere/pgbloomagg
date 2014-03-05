# Bloom filter aggregate function for PostgreSQL

*This is only a proof of concept.*

This PostgreSQL extension provides an aggregate function to compute a [Bloom filter](https://en.wikipedia.org/wiki/Bloom_filter) as well as a function to query the bloom filter to test whether a value is (probably) in the set.

Example:

    SELECT bloom_agg(somecol, m) FROM sometable ...;

(where `m` is the size of the Bloom filter in bits), write down the result and

    DELETE FROM othertable WHERE NOT (somecol << $result_from_above);

The idea is that if `othertable` is some kind of normalized lookup table referenced by `sometable`, but it's in a different database (because of sharding or partitioning), then it's hard to clean up unused records efficiently.  Using a bloom filter makes this slightly easier.  (Of course, this might have concurrency issues, so don't take it as is.)
