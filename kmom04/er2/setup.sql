--
-- Create database eshop for KMOM04
-- By Usama Saleem for course Database Technologies for the Web.
-- 2020-03-22
-- 
-- Create database eshop
--
CREATE DATABASE IF NOT EXISTS eshop;

--
-- Create a user with password
-- 
DROP USER IF EXISTS 'user'@'%';
CREATE USER IF NOT EXISTS 'user'@'%'
	IDENTIFIED WITH mysql_native_password -- MySQL with version > 8.0.4
	BY 'pass'
;

--
-- Grant all privileges to user
--
GRANT ALL PRIVILEGES
	ON *.*
	TO 'user'@'%'
;