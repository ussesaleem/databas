--
-- Create a database
--
-- CREATE DATABASE skolan;
CREATE DATABASE IF NOT EXISTS skolan;

--
-- Choose which database to use
--
USE skolan;

-- --
-- -- Delete the database
-- --
-- DROP DATABASE skolan;

-- --
-- -- Show what databases there are
-- --
-- SHOW DATABASES;

--
-- Show which databases are called something with "skolan"
--
SHOW DATABASES LIKE "%skolan%";

-- --
-- -- Create a user with password and login from any @
-- --
-- CREATE USER IF NOT EXISTS 'user'@'%'
-- 	IDENTIFIED BY 'pass'
-- ;

--
-- Create user with backwards compatible password algorithm
--
DROP USER IF EXISTS 'user'@'%';
CREATE USER IF NOT EXISTS 'user'@'%'
	IDENTIFIED WITH mysql_native_password -- MySQL with version > 8.0.4
	BY 'pass'
;

-- --
-- -- Remove a user
-- --
-- DROP USER 'user'@'%';


--
-- Grant access to user
--
GRANT ALL PRIVILEGES
	ON *.*
	TO 'user'@'%'
;

-- --
-- -- Create user with password and give full rights to database "skolan"
-- -- when user logs in from machine "localhost"
-- --
-- GRANT ALL ON skolan.* TO user@localhost IDENTIFIED BY 'pass';

--
-- View grants against the database for user
--
SHOW GRANTS FOR 'user'@'%';

-- --
-- -- Show for current user
-- --
-- SHOW GRANTS FOR CURRENT_USER;

-- -- Recreate the database in the terminal
-- -- $ mysql --table -uroot -p < setup.sql
