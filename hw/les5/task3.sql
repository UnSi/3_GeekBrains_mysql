/*3. (по желанию) Есть таблица рейсов flights (id, from, to) и таблица городов cities (label, name). Поля from, to и label содержат английские названия городов, поле name — русское. Выведите список рейсов (flights) с русскими названиями городов.*/

DROP TABLE IF EXISTS flights;
CREATE TABLE flights(
	id SERIAL PRIMARY KEY,
	`from` VARCHAR(255) NOT NULL, 
	`to` VARCHAR(255) NOT NULL
) comment = 'рейсы';


DROP TABLE IF EXISTS cities;
CREATE TABLE cities(
	id SERIAL PRIMARY KEY,
	label VARCHAR(255) NOT NULL comment 'англ. город', 
	name VARCHAR(255) NOT NULL comment 'рус. город'
) comment = 'города';

INSERT INTO flights (`from`, `to`) VALUES
	('moscow', 'omsk'),
	('novgorod', 'kazan'),
	('irkutsk','moscow'),
	('omsk','irkutsk'),
	('moscow','kazan');
	
INSERT INTO cities (label, name) VALUES
	('moscow', 'Москва'),
	('irkutsk','Иркутск'),
	('novgorod', 'Новгород'),
	('kazan','Казань'),
	('omsk','Омск');
	

/*(SELECT 
	flights.id, cities.name 
FROM 
	flights, cities 
WHERE 
	flights.`from` = cities.label) 
JOIN 
(SELECT 
	flights.id, cities.name 
FROM 
	flights, cities 
WHERE 
	flights.`to` = cities.label) 
USING flights.id;*/

SELECT 
	flights.id, from_c.name as 'из', to_c.name 'в'
FROM 
	flights, cities as from_c, cities as to_c 
WHERE 
	flights.`from` = from_c.label AND flights.`to` = to_c.label 
ORDER BY id;