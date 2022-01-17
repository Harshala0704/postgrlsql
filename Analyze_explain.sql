DROP TABLE IF EXISTS performance_test;
CREATE TABLE performance_test (
  id serial,
  location text
);
INSERT INTO performance_test (location)
SELECT md5(random()::text) FROM generate_series(1,10000000);


-- it thinks there will be rows=50000
EXPLAIN ANALYZE SELECT * FROM performance_test
WHERE id = 2000000;

ANALYZE performance_test;

-- it now thinks there will be rows=1
EXPLAIN ANALYZE SELECT * FROM performance_test
WHERE id = 2000000;



DROP TABLE IF EXISTS performance_test;

CREATE TABLE performance_test (
  id serial,
  location text
);


INSERT INTO performance_test (location)
SELECT md5(random()::text) FROM generate_series(1,10000000);

-- this takes forever 332
SELECT COUNT(*) FROM performance_test;

-- this takes 331 msec
SELECT * FROM performance_test
WHERE id = 2000000;

-- notice that it does a sequential scan
EXPLAIN SELECT COUNT(*) FROM performance_test;

EXPLAIN SELECT * FROM performance_test
WHERE id = 2000000;


CREATE INDEX idx_performance_test_id ON performance_test (id);


EXPLAIN SELECT * FROM performance_test
WHERE id = 2000000;


SELECT * FROM performance_test
WHERE id = 2000000;

EXPLAIN SELECT COUNT(*) FROM performance_test;


SELECT COUNT(*) FROM performance_test;

