/*3. (по желанию) Пусть имеется таблица с календарным полем created_at. В ней размещены разряженые календарные записи за август 2018 года '2018-08-01', '2016-08-04', '2018-08-16' и 2018-08-17. Составьте запрос, который выводит полный список дат за август, выставляя в соседнем поле значение 1, если дата присутствует в исходном таблице и 0, если она отсутствует.*/

DROP TABLE IF EXISTS calend;
CREATE TABLE calend (
	id SERIAL PRIMARY KEY,
	created_at DATE NOT NULL
	);
	
INSERT INTO calend (created_at) VALUES ('2018-08-01'), ('2018-08-04'),('2018-08-16'), ('2018-08-17');


-- подсмотрел в решении у преподавателя, т.к. полчаса искал как сегнерировать таблицу 1 запросом, а не вводить все даты вручную. Оказалось-таки вручную
DROP TABLE IF EXISTS days;
CREATE TEMPORARY TABLE days(
	id SERIAL PRIMARY KEY
);

INSERT INTO days (id) VALUES (NULL), (NULL), (NULL), (NULL), (NULL), (NULL), (NULL), (NULL), (NULL), (NULL), (NULL), (NULL), (NULL), (NULL), (NULL), (NULL), (NULL), (NULL), (NULL), (NULL), (NULL), (NULL), (NULL), (NULL), (NULL), (NULL), (NULL), (NULL), (NULL), (NULL), (NULL); 

SELECT DATE(CONCAT('2018-08-', days.id)) AS aug_day, IF (calend.created_at IS NOT NULL, 1, 0) AS yes FROM days LEFT JOIN calend ON DATE(CONCAT('2018-08-', days.id)) = calend.created_at ORDER BY aug_day;


