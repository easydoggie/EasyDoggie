CREATE DATABASE IF NOT EXISTS testdb
	CHARACTER SET utf8mb4 

USE testdb

CREATE ROLE easydoggie;

GRANT ALL ON *.* TO easydoggie;

CREATE USER 'testuser'@'%'
	IDENTIFIED WITH mysql_native_password BY 'easydoggie'
	DEFAULT ROLE easydoggie;
	
CREATE TABLE t1 (
	c1 INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	c2 VARCHAR(100),
	c3 VARCHAR(100)
	) ENGINE=InnoDB;