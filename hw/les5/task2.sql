/*2. Выведите список товаров products и разделов catalogs, который соответствует товару.*/

SELECT 
	products.id, products.name, catalogs.name as cat_name
FROM 
	products
JOIN 
	catalogs
ON
	catalogs.id = products.catalog_id;