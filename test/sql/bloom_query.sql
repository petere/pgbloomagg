SELECT bloom_query('one',   b'0110010000100110');
SELECT bloom_query('two',   b'0110010000100110');
SELECT bloom_query('three', b'0110010000100110');
SELECT bloom_query('four',  b'0110010000100110');
SELECT bloom_query('five',  b'0110010000100110');
SELECT bloom_query('six',   b'0110010000100110');
SELECT bloom_query('seven', b'0110010000100110');
SELECT bloom_query('eight', b'0110010000100110');
SELECT bloom_query('nine',  b'0110010000100110');
SELECT bloom_query('ten',   b'0110010000100110');

SELECT bloom_query('foo', b'');

SELECT 'one' << b'0110010000100110';
