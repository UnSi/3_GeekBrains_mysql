/* 1. Создайте двух пользователей которые имеют доступ к базе данных shop. Первому пользователю shop_read должны быть 
доступны только запросы на чтение данных, второму пользователю shop — любые операции в пределах базы данных shop.*/

CREATE USER shop_read IDENTIFIED WITH sha256_password BY 'pass'; 
GRANT SELECT, SHOW VIEW ON shop.* TO shop_read;

CREATE USER shop IDENTIFIED WITH sha256_password BY 'pass'; 
GRANT ALL ON shop.* TO shop;