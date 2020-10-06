/*1. 3. (по желанию) В учебной базе данных shop присутствует таблица catalogs. Пусть в базе данных 
sample имеется таблица cat, в которой могут присутствовать строки с такими же первичными ключами. 
Напишите запрос, который копирует данные из таблицы catalogs в таблицу cat, при этом для записей с 
конфликтующими первичными ключами в таблице cat должна производиться замена значениями из таблицы catalogs.*/

DROP TABLE IF EXISTS sample.cat;
CREATE TABLE sample.cat(
	id SERIAL PRIMARY KEY,
	name VARCHAR(255) COMMENT 'название раздела',
    UNIQUE unique_name(name(10))
) COMMENT = "каталоги базы sample";

INSERT IGNORE INTO sample.cat (name) VALUES 
('че-то'), 
('132hji'),
('qweqe'),
('e3rtet');

DELETE FROM sample.cat WHERE id = 2;

/*UPDATE IGNORE
	sample.cat, shop.catalogs
SET
	sample.cat.name = shop.catalogs.name,
    sample.cat.id = shop.catalogs.id
WHERE
	shop.catalogs.id NOT IN (SELECT * FROM (SELECT id FROM sample.cat) as t1);
 */
 
 
INSERT INTO
	sample.cat
SELECT
	* 
FROM
	shop.catalogs
WHERE
	shop.catalogs.id NOT IN (SELECT * FROM (SELECT id FROM sample.cat) as t1);
 
UPDATE IGNORE
	sample.cat, shop.catalogs
SET
	sample.cat.name = shop.catalogs.name
WHERE
	sample.cat.id = shop.catalogs.id;

/*    
INSERT INTO 
	sample.cat 
SELECT 
	*
FROM 
	shop.catalogs, sample.cat
WHERE 
	shop.catalogs.id <> sample.cat.id;
  */  
SELECT * FROM sample.cat;