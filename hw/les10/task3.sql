/*3. Организуйте хранение категорий и товарных позиций учебной базы данных shop в СУБД MongoDB.*/


/*
не решил
db.shop.insert({name: 'categories'})
db.shop.insert({name: 'products'})

db.shop.update({name: 'categories'}, {%set: {1: 'Процессоры', 2: 'Мат. платы'}}) 
db.shop.update({name: 'products'}, {%set: {1: 'Процессоры', 2: 'Мат. платы'}}) 
*/

use shop

db.createCollection('catalogs')
db.createCollection('products')

db.catalogs.insert({name: 'Процессоры'})
db.catalogs.insert({name: 'Мат. платы'})
db.catalogs.insert({name: 'Видеокарты'})

db.products.insert(
	{
		name: 'Проц1', 
		description: 'Описание1', 
		price: 7890.00, 
		catalog_id: new ObjectId("dfa3114235cd2...")
	}
);

db.products.insert(
	{
		name: 'Проц2', 
		description: 'Описание2', 
		price: 7000.00, 
		catalog_id: new ObjectId("dfa3114235cd2...")
	}
);

db.products.insert(
	{
		name: 'Материнка1', 
		description: 'Описание1', 
		price: 6000.00, 
		catalog_id: new ObjectId("2fa3114234235cd7...")
	}
);

db.procuts.find({catalog_id: ObjectId("dfa3114235cd2...") });