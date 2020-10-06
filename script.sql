CREATE TABLE tbl (
	name CHAR(10) DEFAULT 'anonymous',
	description VARCHAR(255)
);

INSERT INTO tbl VALUES (DEFAULT, 'Новый пользователь');
SELECT * FROM tbl;