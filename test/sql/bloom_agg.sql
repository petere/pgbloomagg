CREATE TABLE test (a int, b text);

SELECT bloom_agg(b, 16) FROM test;

INSERT INTO test VALUES (1, 'one');

SELECT bloom_agg(b, 16) FROM test;

INSERT INTO test VALUES (2, 'two');
INSERT INTO test VALUES (3, 'three');
INSERT INTO test VALUES (4, 'four');
INSERT INTO test VALUES (5, 'five');
INSERT INTO test VALUES (6, 'six');

SELECT bloom_agg(b, 16) FROM test;
