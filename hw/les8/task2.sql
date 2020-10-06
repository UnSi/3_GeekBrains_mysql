/*2. В таблице products есть два текстовых поля: name с названием товара и description с его описанием. Допустимо присутствие обоих полей или одно из них. 
Ситуация, когда оба поля принимают неопределенное значение NULL неприемлема. Используя триггеры, добейтесь того, чтобы одно из этих полей или оба поля были 
заполнены. При попытке присвоить полям NULL-значение необходимо отменить операцию.*/
use shop
DELIMITER //

CREATE TRIGGER check_procut_empty_name_update BEFORE UPDATE ON products 
	FOR EACH ROW
	BEGIN
		IF (NEW.name is NULL AND NEW.description IS NULL) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "name and desc are NULL";
		END IF;
	END//
	

CREATE TRIGGER check_procut_empty_name_insert BEFORE INSERT ON products 
	FOR EACH ROW
	BEGIN
		IF (NEW.name is NULL AND NEW.description IS NULL) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'name and desc are NULL';
		END IF;
	END//
	
INSERT INTO products (name, description, price) VALUES ('fasdfa', 'afasdfaf', 1000)//
INSERT INTO products (name, description, price) VALUES ('fasd', NULL, 1000)//
INSERT INTO products (name, description, price) VALUES (NULL, 'asdfaf', 1000) //
INSERT INTO products (name, description, price) VALUES (NULL, NULL, 1000)//
	
DELETE FROM products WHERE id > 7//

UPDATE
	products 
SET 
	name = 'MSI B250M GAMING PRO', 
	description = NULL
WHERE id = 7//

UPDATE
	products 
SET 
	name = NULL, 
	description =  'B250, Socket 1151, DDR4, mATX'
WHERE id = 7//

UPDATE
	products 
SET 
	name = NULL, 
	description = NULL
WHERE id = 7//

UPDATE
	products 
SET 
	name = 'MSI B250M GAMING PRO', 
	description =  'B250, Socket 1151, DDR4, mATX'
WHERE id = 7//