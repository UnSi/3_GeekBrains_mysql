/*4. (по желанию) Пусть имеется любая таблица с календарным полем created_at. Создайте запрос, который удаляет устаревшие записи из таблицы, оставляя только 5 самых свежих записей.*/
INSERT INTO calend (created_at) VALUES ('2018-08-01'), ('2018-08-04'),('2018-08-16'), ('2018-08-17');
INSERT INTO calend (created_at) VALUES ('2018-08-01'), ('2018-08-04'),('2018-08-16'), ('2018-08-17');
INSERT INTO calend (created_at) VALUES ('2018-08-01'), ('2018-08-04'),('2018-08-16'), ('2018-08-17');


CREATE TEMPORARY TABLE IF NOT EXISTS temp LIKE calend;
TRUNCATE temp;
INSERT INTO temp 
SELECT * FROM calend ORDER BY created_at DESC LIMIT 5;
TRUNCATE calend;
INSERT INTO calend 
SELECT * FROM temp;

/*
решение преподавателя:

1) PREPARE postdel FROM 'DELETE FROM calend ORDER BY created_at LIMIT ?';
SET @total := (SELECT COUNT(*) - 5 FROM calend);
EXECUTE postdel USING @total;
COMMIT;

2) 
DELETE 
	calend 
FROM 
	calend
JOIN 
	(SELECT created_at 
	FROM 
		calend
	ORDER BY 
		created_at DESC
	LIMIT 5, 1) as delcal
ON
	calend.created_at <= delcal.created_at;
*/