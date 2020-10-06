/*1. Пусть в таблице catalogs базы данных shop в строке name могут находиться пустые строки и поля, 
принимающие значение NULL. Напишите запрос, который заменяет все такие поля на строку ‘empty’. 
Помните, что на уроке мы установили уникальность на поле name. Возможно ли оставить это условие? Почему?*/
use shop; 

ALTER TABLE catalogs DROP INDEX unique_name;
INSERT INTO catalogs (name) VALUES (NULL), (NULL), ('');
UPDATE 
	catalogs
SET
	name = "empty"
WHERE
	name is NULL OR name = '' ;
	
	
-- нельзя, т.к. unique не допускает разных имен. Можно только сделать empty+id
/*
UPDATE 
	catalogs
SET
	name = concat("empty ", id)
WHERE
	name is NULL;
*/
