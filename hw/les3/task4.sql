/* 4. (по желанию) Из таблицы users необходимо извлечь пользователей, родившихся в августе и мае. Месяцы заданы в виде списка английских названий ('may', 'august')*/

/*
mysql> SELECT * FROM users;
+----+-----------+-------------+---------------------+---------------------+
| id | name      | birthday_at | created_at          | updated_at          |
+----+-----------+-------------+---------------------+---------------------+
|  1 | Геннадий  | 1990-10-05  | 2002-08-28 14:42:00 | 2013-10-22 00:45:00 |
|  2 | Наталья   | 1984-11-12  | 2025-03-20 16:56:00 | 2021-04-18 14:48:00 |
|  3 | Александр | 1985-05-20  | 2025-12-08 10:42:00 | 2017-10-06 09:12:00 |
|  4 | Сергей    | 1988-02-14  | 2004-10-25 10:47:00 | 2019-12-19 11:21:00 |
|  5 | Иван      | 1998-01-12  | 2023-01-12 22:17:00 | 2021-07-20 20:08:00 |
|  6 | Мария     | 1992-08-29  | 2022-06-06 09:37:00 | 2028-03-01 04:59:00 |
+----+-----------+-------------+---------------------+---------------------+
*/

UPDATE 
	users 
SET
	birthday_at = NULL;
	
ALTER TABLE users CHANGE birthday_at birthday_at VARCHAR(255);

UPDATE users SET birthday_at = "05th october 1990" WHERE id = 1;
UPDATE users SET birthday_at = "12th november 1984" WHERE id = 2;
UPDATE users SET birthday_at = "20th may 1985" WHERE id = 3;
UPDATE users SET birthday_at = "14th february 1988" WHERE id = 4;
UPDATE users SET birthday_at = "12th january 1998" WHERE id = 5;
UPDATE users SET birthday_at = "29th august 1992" WHERE id = 6;

SELECT * FROM users WHERE birthday_at RLIKE 'may | august';