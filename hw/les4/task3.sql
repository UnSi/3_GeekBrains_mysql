/*3. (по желанию) Подсчитайте произведение чисел в столбце таблицы.*/

DROP TABLE IF EXISTS test;
CREATE TABLE test(
	id SERIAL PRIMARY KEY,
	value INT NOT NULL
);

INSERT INTO test (value) VALUES 
	(FLOOR(RAND()*15 + 1)),
	(FLOOR(RAND()*15 + 1)),
	(FLOOR(RAND()*15 + 1)),
	(FLOOR(RAND()*15 + 1)),
	(FLOOR(RAND()*15 + 1)),
	(FLOOR(RAND()*15 + 1)),
	(FLOOR(RAND()*15 + 1)),
	(FLOOR(RAND()*15 + 1)),
	(FLOOR(RAND()*15 + 1));

/*
 SELECT * FROM test;
+----+-------+
| id | value |
+----+-------+
|  1 |     8 |
|  2 |     5 |
|  3 |    15 |
|  4 |     2 |
|  5 |     7 |
|  6 |    14 |
|  7 |     4 |
|  8 |     7 |
|  9 |     6 |
+----+-------+
*/

-- SELECT id as old_id, value, IF(id > 1, value * (SELECT comp from test where id = old_id - 1), value) as comp FROM test;
-- психанул, нагуглил, сам бы точно не додумался
SELECT ROUND(EXP(SUM(LOG(value)))) FROM test;