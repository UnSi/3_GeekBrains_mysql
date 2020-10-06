/*1. Создайте таблицу logs типа Archive. Пусть при каждом создании записи в таблицах users, catalogs и products в таблицу logs
 помещается время и дата создания записи, название таблицы, идентификатор первичного ключа и содержимое поля name.*/
 
DROP TABLE IF EXISTS logs;
CREATE TABLE logs( 
	table_name VARCHAR(30) NOT NULL, 
	prime_id BIGINT NOT NULL, 
	name VARCHAR(255), 
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP comment 'дата занесения' 
) engine = archive; 

delimiter //
DROP TRIGGER IF EXISTS log_users_insert//
CREATE TRIGGER log_users_insert AFTER INSERT ON users
FOR EACH ROW
BEGIN
	/*DECLARE ins_id BIGINT;
	IF (new.id <> 0) THEN
		SET ins_id = new.id;
	ELSE
		SET ins_id = LAST_INSERT_ID();
	END IF;
	INSERT INTO logs (table_name, prime_id, name) VALUES ('users', ins_id, new.name);*/
	INSERT INTO logs (table_name, prime_id, name) VALUES ('users', new.id, new.name);
END//

DROP TRIGGER IF EXISTS log_catalogs_insert//
CREATE TRIGGER log_catalogs_insert AFTER INSERT ON catalogs
FOR EACH ROW
BEGIN
	INSERT INTO logs (table_name, prime_id, name) VALUES ('catalogs', new.id, new.name);
END//

DROP TRIGGER IF EXISTS log_products_insert//
CREATE TRIGGER log_products_insert AFTER INSERT ON products
FOR EACH ROW
BEGIN
	INSERT INTO logs (table_name, prime_id, name) VALUES ('products', new.id, new.name);
END//


