/*2.Таблица users была неудачно спроектирована. Записи created_at и updated_at были заданы типом VARCHAR и в них долгое время помещались значения в формате "20.10.2017 8:10". Необходимо преобразовать поля к типу DATETIME, сохранив введеные ранее значения.*/

ALTER TABLE users CHANGE created_at created_at VARCHAR(20) comment 'дата регистрации';
ALTER TABLE users CHANGE updated_at updated_at VARCHAR(20);

UPDATE 
	users 
SET
	created_at = CONCAT(FLOOR(RAND()*28 + 1), '.', FLOOR(RAND()*12 + 1), '.', FLOOR(RAND()*30 + 2000), ' ', FLOOR(RAND()*24), ':', FLOOR(RAND()*60)),
	updated_at = CONCAT(FLOOR(RAND()*28 + 1), '.', FLOOR(RAND()*12 + 1), '.', FLOOR(RAND()*30 + 2000), ' ', FLOOR(RAND()*24), ':', FLOOR(RAND()*60));
	
UPDATE
	users
SET
	created_at = STR_TO_DATE(created_at, '%d.%m.%Y %H:%i'),
	updated_at = STR_TO_DATE(updated_at, '%d.%m.%Y %H:%i');
	

ALTER TABLE users CHANGE created_at created_at DATETIME DEFAULT CURRENT_TIMESTAMP comment 'дата регистрации';
ALTER TABLE users CHANGE updated_at updated_at DATETIME DEFAULT CURRENT_TIMESTAMP;