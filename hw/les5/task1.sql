/* 1. Составьте список пользователей users, которые осуществили хотя бы один заказ (orders) в интернет-магазине.*/

INSERT INTO orders (user_id) 
	select id from users ORDER BY RAND() LIMIT 1;
	
INSERT INTO orders (user_id) 
	select id from users ORDER BY RAND() LIMIT 1;

INSERT INTO orders (user_id) 
	select id from users ORDER BY RAND() LIMIT 1;

INSERT INTO orders (user_id) 
	select id from users ORDER BY RAND() LIMIT 1;
	
INSERT INTO orders (user_id) 
	select id from users ORDER BY RAND() LIMIT 1;
	
INSERT INTO orders (user_id) 
	select id from users ORDER BY RAND() LIMIT 1;
	
INSERT INTO orders (user_id) 
	select id from users ORDER BY RAND() LIMIT 1;
	
/*
+----+---------+---------------------+---------------------+
| id | user_id | created_at          | updated_at          |
+----+---------+---------------------+---------------------+
|  1 |       9 | 2020-08-25 14:02:00 | 2020-08-25 14:04:23 |
|  2 |       6 | 2020-08-25 14:08:13 | 2020-08-25 14:08:13 |
|  3 |       9 | 2020-08-25 14:08:14 | 2020-08-25 14:08:14 |
|  4 |       7 | 2020-08-25 14:08:14 | 2020-08-25 14:08:14 |
|  5 |       5 | 2020-08-25 14:08:15 | 2020-08-25 14:08:15 |
|  6 |       3 | 2020-08-25 14:08:15 | 2020-08-25 14:08:15 |
|  7 |       9 | 2020-08-25 14:08:16 | 2020-08-25 14:08:16 |
+----+---------+---------------------+---------------------+
*/

SELECT 
	users.id, name 
FROM 
	users
JOIN 
	orders
ON
	users.id = orders.user_id
GROUP BY
	users.id;