--
-- Character coding - setting the charset
-- By Usama Saleem for course Database Technologies for the Web.
-- 2020-03-07
-- --
-- --
-- -- Make sure that the characters are transferred according to UTF-8
-- --
-- SET NAMES 'utf8';

-- --
-- -- Create a table with Swedish and Norwegian characters. 
-- --
-- DROP TABLE IF EXISTS person;
-- CREATE TABLE person
-- (
-- 	fornamn VARCHAR(10)
-- );

-- INSERT INTO person VALUES
-- ("Örjan"), ("Börje"), ("Bo"), ("Øjvind"),
-- ("Åke"), ("Åkesson"), ("Arne"), ("Ängla"),
-- ("Ægir")
-- ;

-- SELECT
-- 	*
-- FROM person
-- ORDER BY fornamn;

-- --
-- -- Show how the table was created.
-- --
-- SHOW CREATE TABLE person;

-- --
-- Show charset.
-- --
-- SHOW CHARSET LIKE 'utf8';

-- --
-- Show collation.
-- --
-- SHOW COLLATION WHERE Charset = 'utf8';

-- ALTER TABLE person CONVERT TO CHARSET utf8 COLLATE utf8_unicode_ci;

-- SELECT
-- 	*
-- FROM person
-- ORDER BY fornamn;