/*3. (по желанию) Напишите хранимую функцию для вычисления произвольного числа Фибоначчи. 
Числами Фибоначчи называется последовательность в которой число равно сумме двух предыдущих чисел. 
Вызов функции FIBONACCI(10) должен возвращать число 55.*/
/*
use shop;
DELIMITER //
DROP FUNCTION IF EXISTS fib//
CREATE FUNCTION fib(num INT)
RETURNS INT DETERMINISTIC
BEGIN
	DECLARE res INT DEFAULT 0; 
	IF num < 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'неверное значение'; 
	ELSEIF num = 0 THEN
		SET res = 0;
	ELSEIF num < 2 THEN
		SET res = 1;
	ELSE
		SET res = fib(num-1) + fib(num-2);
	END IF;
	
	RETURN res;
END//*/

use shop;
DELIMITER //
DROP FUNCTION IF EXISTS fib//
CREATE FUNCTION fib(num INT)
RETURNS INT DETERMINISTIC
BEGIN
	DECLARE res, i INT DEFAULT 1; 
	DECLARE first, second INT;
    
    SET first = 0, second = 1;
    
	IF num < 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'неверное значение'; 
	ELSEIF num = 0 THEN
		SET res = 0;
	ELSEIF num < 2 THEN
		SET res = 1;
	ELSE
		WHILE i < num DO
			SET res = first + second, 
            first = second, 
            second = res,
            i = i + 1;

		END WHILE;
	END IF;
	
	RETURN res;
END//
