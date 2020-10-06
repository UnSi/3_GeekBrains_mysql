/* 1. Подсчитайте средний возраст пользователей в таблице users.*/

SELECT ROUND(AVG(TIMESTAMPDIFF(YEAR, birthday_at, NOW())), 2) as avarage_age FROM users;