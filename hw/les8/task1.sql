/*1. Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от текущего времени суток. 
С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", с 12:00 до 18:00 функция должна возвращать фразу "Добрый день",
 с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".*/

DELIMITER //
DROP FUNCTION IF EXISTS hello//
CREATE FUNCTION hello()
RETURNS VARCHAR(255) NOT DETERMINISTIC
BEGIN
	DECLARE time_now INT;
	DECLARE result VARCHAR(255);
	
	SET time_now = DATE_FORMAT(NOW(), '%H');
	
	CASE  
	WHEN time_now < 6 THEN 
		SET result = "Доброй ночи";	
	WHEN time_now > 6 AND time_now < 12 THEN 
		SET result = "Доброе утро"; 
	WHEN time_now > 12 AND time_now < 18 THEN 
		SET result = "Добрый день";	 
	WHEN time_now > 18 THEN 
		SET result = "Добрый вечер"; 
	ELSE 
		SET result = 'error'; 
	END CASE ;
	
	RETURN result; 
END//
SET GLOBAL log_bin_trust_function_creators = 1;
