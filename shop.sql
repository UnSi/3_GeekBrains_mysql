use shop;
DROP TABLE IF EXISTS catalogs;
CREATE TABLE catalogs(
	id SERIAL PRIMARY KEY,
	name VARCHAR(255) COMMENT 'название раздела',
    UNIQUE unique_name(name(10))
) COMMENT = 'Разделы инет магазина';

-- INSERT INTO catalogs VALUES(NULL, 'Процессоры');
-- INSERT INTO catalogs (name, id) VALUES ('Мат. платы', NULL);
-- INSERT INTO catalogs VALUES (DEFAULT 'Видеокарты');

INSERT IGNORE INTO catalogs VALUES
	(DEFAULT, 'Процессоры'),
	(DEFAULT, 'Мат. платы'),
	(DEFAULT, 'Видеокарты'),
	(DEFAULT, 'Видеокарты');
/*
UPDATE 
	catalogs
SET
	name = "Процессоры (Intel)"
WHERE
	name = "Процессоры";
*/
SELECT * from catalogs;

DROP TABLE IF EXISTS cat;
CREATE TABLE cat(
	id SERIAL PRIMARY KEY,
	name VARCHAR(255) COMMENT 'название раздела',
    UNIQUE unique_name(name(10))
) COMMENT = 'фейк Разделы инет магазина';

INSERT INTO
	cat
SELECT
	* 
FROM
	catalogs;
    
SELECT * FROM cat;

DROP TABLE IF EXISTS users;
CREATE TABLE users(
	id SERIAL PRIMARY KEY,
	name VARCHAR(255) COMMENT 'имя покупателя',
	birthday_at DATE comment 'дата рождения',
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP comment 'дата регистрации',
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Покупатели';

-- INSERT INTO users (id, name, birthday_at) VALUES(1, 'Hello', '1979-01-27');
-- INSERT INTO users (name, birthday_at) VALUES ('Александр', '1986-01-20');
-- SELECT * FROM users;


INSERT INTO users (name, birthday_at) VALUES
  ('Геннадий', '1990-10-05'),
  ('Наталья', '1984-11-12'),
  ('Александр', '1985-05-20'),
  ('Сергей', '1988-02-14'),
  ('Иван', '1998-01-12'),
  ('Мария', '1992-08-29');


DROP TABLE IF EXISTS products;
CREATE TABLE products(
	id SERIAL PRIMARY KEY,
	name VARCHAR(255) COMMENT 'название',
	description TEXT COMMENT 'описание',
	price DECIMAL(11,2) COMMENT 'цена',
	catalog_id BIGINT UNSIGNED DEFAULT NULL, 
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP comment 'дата регистрации',
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    KEY index_of_catalog_id(catalog_id)
) COMMENT = 'Товарные позицые';

ALTER TABLE products
ADD CONSTRAINT fk_catalog_id 
FOREIGN KEY (catalog_id)
REFERENCES catalogs(id)
ON DELETE CASCADE
ON UPDATE CASCADE;

INSERT INTO 
	products (name, description, price, catalog_id) 
VALUES
	('Intel Core i3-8100', 'Процессор для настольных персональных компьютеров, основанных на платформе Intel.', 7890.00, 1),
	('Intel Core i5-7400', 'Процессор для настольных персональных компьютеров, основанных на платформе Intel.', 12700.00, 1),
	('AMD FX-8320E', 'Процессор для настольных персональных компьютеров, основанных на платформе AMD.', 4780.00, 1),
	('AMD FX-8320', 'Процессор для настольных персональных компьютеров, основанных на платформе AMD.', 7120.00, 1),
 	('ASUS ROG MAXIMUS X HERO', 'Материнская плата ASUS ROG MAXIMUS X HERO, Z370, Socket 1151-V2, DDR4, ATX', 19310.00, 2),
 	('Gigabyte H310M S2H', 'Материнская плата Gigabyte H310M S2H, H310, Socket 1151-V2, DDR4, mATX', 4790.00, 2),
 	('MSI B250M GAMING PRO', 'Материнская плата MSI B250M GAMING PRO, B250, Socket 1151, DDR4, mATX', 5060.00, 2);

SELECT * FROM products;

DROP TABLE IF EXISTS orders;
CREATE TABLE orders(
	id SERIAL PRIMARY KEY,
	user_id INT UNSIGNED,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP comment 'дата регистрации',
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, 
	KEY index_of_user_id(user_id)
) COMMENT = 'Заказы';

DROP TABLE IF EXISTS orders_products;
CREATE TABLE orders_products(
	id SERIAL PRIMARY KEY,
	order_id INT UNSIGNED ,
	product_id INT UNSIGNED,
	total INT UNSIGNED DEFAULT 1 COMMENT 'кол-во заказанных товарных позиций',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP comment 'дата регистрации',
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Состав заказа';

DROP TABLE IF EXISTS discounts;
CREATE TABLE discounts(
	id SERIAL PRIMARY KEY,
	user_id INT UNSIGNED,
	product_id INT UNSIGNED,
	discount FLOAT COMMENT 'Величина скидки от 0.0 до 1.0',
    started_at DATETIME,
	finished_at DATETIME,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP comment 'дата регистрации',
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    KEY index_of_user_id(user_id),
    KEY index_of_product_id(product_id)
) COMMENT = 'Скидки';

DROP TABLE IF EXISTS storehouses;
CREATE TABLE storehouses(
	id SERIAL PRIMARY KEY,
	name VARCHAR(255) COMMENT 'название',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP comment 'дата регистрации',
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Склады';

DROP TABLE IF EXISTS storehouses_products;
CREATE TABLE storehouses_products(
	id SERIAL PRIMARY KEY,
	storehouse_id INT UNSIGNED,
	product_id INT UNSIGNED,
	value INT UNSIGNED COMMENT 'Запас товарной позиции на складе',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP comment 'дата регистрации',
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Запасы на складе';

