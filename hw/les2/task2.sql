/*2. Спроектируйте базу данных, которая позволяла бы организовать хранение медиафайлов, загружаемых 
пользователем (фото, аудио, видео). Сами файлы будут храниться в файловой системе, а база данных будет
содержать только пути к файлам, названия, описание ключевых слов и принадлежности пользователю.*/

-- воспринял "описание ключевых слов" как "тип файла (фото, аудио, видео)".

CREATE DATABASE IF NOT EXISTS media_files;
use media_files;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id SERIAL PRIMARY KEY,
	login VARCHAR (20),
	UNIQUE unique_user_login (login)
) COMMENT = "пользователи";

DROP TABLE IF EXISTS file_types;
CREATE TABLE file_types (
	id SERIAL PRIMARY KEY,
	file_type VARCHAR (20),
	UNIQUE unique_file_type (file_type)
) COMMENT = "типы файлов";

INSERT IGNORE INTO file_types (file_type) VALUES 
	('фото'),
	('аудио'),
	('видео');

DROP TABLE IF EXISTS files;
CREATE TABLE files (
	id SERIAL PRIMARY KEY,
	file_path VARCHAR(255) NOT NULL,
	name VARCHAR(255) NOT NULL,
	keyword JSON COMMENT 'описание ключевых слов',
	ft_id INT UNSIGNED NOT NULL comment 'тип файла',
	user_id INT UNSIGNED NOT NULL,
	KEY index_filename (file_path, name)
) COMMENT = "типы хранилище файлов";