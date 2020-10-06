/*2. Создайте представление, которое выводит название (name) товарной позиции из таблицы products и соответствующее название (name) каталога из таблицы catalogs.*/

CREATE OR REPLACE VIEW prod_cat (prod_name, cat_name) AS SELECT products.name, catalogs.name FROM products LEFT JOIN catalogs ON products.catalog_id = catalogs.id ORDER BY products.name;