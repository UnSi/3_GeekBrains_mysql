/*2. (по желанию) Есть таблица (accounts), включающая в себя три столбца: id, name, password, которые содержат первичный ключ, имя пользователя и его пароль. 
Создайте представление username таблицы accounts, предоставляющее доступ к столбцам id и name. Создайте пользователя user_read, который бы не имел доступа к
 таблице accounts, однако мог извлекать записи из представления username.*/

DROP TABLE IF EXISTS accounts;
CREATE TABLE accounts(
	id SERIAL PRIMARY KEY,
	name VARCHAR(30) NOT NULL,
	password VARCHAR(255) NOT NULL
);

INSERT INTO accounts (name, password) VALUES
	('asdasda','dasdafcvbxcvbxjhfgj'),
	('1231414','zxvxcvzfgdfhcv'),
	('fsagasdfgzx123','bcvnxjjkgf'),
	('user','password');

CREATE VIEW username (id, name) AS SELECT id, name FROM accounts;

CREATE USER user_read IDENTIFIED WITH sha256_password BY 'pass';
GRANT SELECT ON shop.username TO user_read;