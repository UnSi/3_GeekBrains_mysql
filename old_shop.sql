use shop;
DROP TABLES IF EXISTS tbl;
CREATE TABLE tbl (
	name CHAR(10) DEFAULT 'anonymous',
	description VARCHAR(255)
);
INSERT INTO tbl VALUES (default, 'new user');
INSERT INTO tbl VALUES ('Igor', 'new user');
SELECT  FROM tbl;
DROP TABLES IF EXISTS catalogs;
CREATE TABLE catalogs(
	id INT UNSIGNED,
    name VARCHAR(255) comment 'название раздела'
) COMMENT = 'разделы интернет-магазина';

DROP TABLES IF EXISTS users;
CREATE TABLE users(
	id INT UNSIGNED,
    name VARCHAR(255) comment 'имя покупателя'
) COMMENT = 'покупатели';

DROP TABLES IF EXISTS products;
CREATE TABLE products(
	id INT UNSIGNED,
    name VARCHAR(255) comment 'Название',
    desctription TEXT comment 'описание',
    price DECIMAL(11,2) comment 'цена',
    catalog_id int unsigned
) COMMENT = 'товарные позиции';

DROP TABLES IF EXISTS orders;
CREATE TABLE orders(
	id INT UNSIGNED,
    user_id int unsigned
) COMMENT = 'заказы';

DROP TABLES IF EXISTS orders_products;
CREATE TABLE orders_products(
	id INT UNSIGNED,
    order_id int unsigned,
    product_id int unsigned,
    total INT UNSIGNED DEFAULT 1 COMMENT 'количество заказанных товарных позиций'
) COMMENT = 'состав заказа';

DROP TABLES IF EXISTS discounds;
CREATE TABLE discounds(
	id INT UNSIGNED,
    user_id int unsigned,
    product_id int unsigned,
    discount FLOAT UNSIGNED COMMENT 'величина скидки от 0.0 до 1.0'
) COMMENT = 'скидки';

DROP TABLES IF EXISTS storehouses;
CREATE TABLE storehouses(
	id INT UNSIGNED,
    name VARCHAR(255) COMMENT 'название'
) COMMENT = 'склады';

DROP TABLES IF EXISTS storehouses_products;
CREATE TABLE storehouses_products(
	id INT UNSIGNED,
    storehouses_id INT UNSIGNED,
    product_id INT UNSIGNED,
    `value` INT UNSIGNED COMMENT 'запас товарной позиции на складе'
) COMMENT = 'запасы на складе';

