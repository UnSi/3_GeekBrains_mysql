/*3. В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры: 0, если товар закончился и выше нуля, если на складе имеются запасы. Необходимо отсортировать записи таким образом, чтобы они выводились в порядке увеличения значения value. Нулевые запасы должны выводиться в конце, после всех записей.*/

INSERT INTO storehouses_products (storehouse_id, product_id, `value`) VALUES 
	(FLOOR(rand()*10+1),FLOOR(rand()*100+1),FLOOR(rand()*5)),
	(FLOOR(rand()*10+1),FLOOR(rand()*100+1),FLOOR(rand()*5)),
	(FLOOR(rand()*10+1),FLOOR(rand()*100+1),FLOOR(rand()*5)),
	(FLOOR(rand()*10+1),FLOOR(rand()*100+1),FLOOR(rand()*5)),
	(FLOOR(rand()*10+1),FLOOR(rand()*100+1),FLOOR(rand()*5)),
	(FLOOR(rand()*10+1),FLOOR(rand()*100+1),FLOOR(rand()*5)),
	(FLOOR(rand()*10+1),FLOOR(rand()*100+1),FLOOR(rand()*5)),
	(FLOOR(rand()*10+1),FLOOR(rand()*100+1),FLOOR(rand()*5));
	
/*
+----+---------------+------------+-------+---------------------+---------------------+
| id | storehouse_id | product_id | value | created_at          | updated_at          |
+----+---------------+------------+-------+---------------------+---------------------+
|  1 |             5 |         34 |     1 | 2020-08-16 19:57:01 | 2020-08-16 19:57:01 |
|  2 |             4 |         14 |     2 | 2020-08-16 19:57:01 | 2020-08-16 19:57:01 |
|  3 |             1 |         82 |     4 | 2020-08-16 19:57:01 | 2020-08-16 19:57:01 |
|  4 |             2 |         89 |     0 | 2020-08-16 19:57:01 | 2020-08-16 19:57:01 |
|  5 |             7 |          5 |     1 | 2020-08-16 19:57:01 | 2020-08-16 19:57:01 |
|  6 |             4 |         95 |     3 | 2020-08-16 19:57:01 | 2020-08-16 19:57:01 |
|  7 |             2 |         16 |     0 | 2020-08-16 19:57:01 | 2020-08-16 19:57:01 |
|  8 |             6 |          1 |     2 | 2020-08-16 19:57:01 | 2020-08-16 19:57:01 |
+----+---------------+------------+-------+---------------------+---------------------+
*/

SELECT * FROM storehouses_products ORDER BY `value` = 0, value; -- нагуглил

/*
+----+---------------+------------+-------+---------------------+---------------------+
| id | storehouse_id | product_id | value | created_at          | updated_at          |
+----+---------------+------------+-------+---------------------+---------------------+
|  1 |             5 |         34 |     1 | 2020-08-16 19:57:01 | 2020-08-16 19:57:01 |
|  5 |             7 |          5 |     1 | 2020-08-16 19:57:01 | 2020-08-16 19:57:01 |
|  2 |             4 |         14 |     2 | 2020-08-16 19:57:01 | 2020-08-16 19:57:01 |
|  8 |             6 |          1 |     2 | 2020-08-16 19:57:01 | 2020-08-16 19:57:01 |
|  6 |             4 |         95 |     3 | 2020-08-16 19:57:01 | 2020-08-16 19:57:01 |
|  3 |             1 |         82 |     4 | 2020-08-16 19:57:01 | 2020-08-16 19:57:01 |
|  4 |             2 |         89 |     0 | 2020-08-16 19:57:01 | 2020-08-16 19:57:01 |
|  7 |             2 |         16 |     0 | 2020-08-16 19:57:01 | 2020-08-16 19:57:01 |
+----+---------------+------------+-------+---------------------+---------------------+
*/

-- решение преподавателя: 
-- SELECT id, value, IF (value > 0, 0, 1) as sort FROM storehouses_products order by value;
-- SELECT * FROM storehouses_products order by IF (value > 0, 0, 1), value;