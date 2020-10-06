/*2. (по желанию) Создайте SQL-запрос, который помещает в таблицу users миллион записей.*/

DELIMITER // 
DROP PROCEDURE IF EXISTS million_users// 
CREATE PROCEDURE million_users() 
BEGIN 
	DECLARE i INT default 0; 
	WHILE i < 1000000 DO 
		INSERT INTO users (name) VALUES (CONCAT('user_', i)); 
		SET i = i + 1; 
	END WHILE; 
END// 

-- решение преподавателя:


DROP TABLE IF EXISTS samples; 
CREATE TABLE samples( 
	id SERIAL PRIMARY KEY, 
	name VARCHAR(255) COMMENT 'имя покупателя', 
	birthday_at DATE comment 'дата рождения', 
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP comment 'дата регистрации', 
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP 
) COMMENT = 'Покупатели'; 

INSERT INTO samples (name) VALUES ('user_1'), 
									('user_2'), 
									('user_3'), 
									('user_4'), 
									('user_5'), 
									('user_6'), 
									('user_7'), 
									('user_8'), 
									('user_9'), 
									('user_10'); 

SELECT COUNT(*) FROM samples as fst, samples as snd, samples as thd, samples as fth, samples as fif, samples as sth;

INSERT INTO 
	users (name) 
SELECT 
	fst.name 
FROM 
	samples as fst, samples as snd, samples as thd, samples as fth, samples as fif, samples as sth; 