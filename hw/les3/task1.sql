/* 1. Пусть в таблице users поля created_at и updated_at оказались незаполненными. Заполните их текущими датой и временем.*/

-- опустошаю
UPDATE 
	users 
SET
	created_at = NULL,
	updated_at = NULL;
	
	
-- заполняю
UPDATE 
	users 
SET
	created_at = NOW(),
	updated_at = NOW();