/*2. Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. Следует учесть, что необходимы дни недели текущего года, а не года рождения.*/


SELECT 
	DATE_FORMAT(
		DATE(
			DATE_FORMAT(
				birthday_at, 
				CONCAT(YEAR(NOW()),'-%m-%d')
			)
		), 
		'%w'
	) as birthday,
	COUNT(*) as people,
	GROUP_CONCAT(name)
FROM 
	users
GROUP BY 
	birthday 
ORDER BY 
	birthday;

/*
	CASE
		WHEN birthday = '0' THEN 'sunday'
		WHEN birthday = '1' THEN 'monday'
		WHEN birthday = '2' THEN 'tuesday'
		WHEN birthday = '3' THEN 'wednesday'
		WHEN birthday = '4' THEN 'thursday'
		WHEN birthday = '5' THEN 'friday'
		WHEN birthday = '6' THEN 'saturday'
		ELSE 'error'
	END AS week_day
*/