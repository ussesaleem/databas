--
-- Alter tables in database skolan.
-- By Usama Saleem for course Database Technologies for the Web.
-- 2020-02-04
--

--
-- Add column to table
--
ALTER TABLE larare ADD COLUMN kompetens INT;

-- --
-- -- Remove column from table
-- --
ALTER TABLE larare DROP COLUMN kompetens;

--
-- Add column and set default value, which can not be NULL
--
ALTER TABLE larare ADD COLUMN kompetens INT NOT NULL
	DEFAULT 1
;

SELECT akronym, fornamn, kompetens FROM larare;

--
-- To look at the structure of the table
--
-- SHOW COLUMNS FROM larare;

-- To check if the files work:
-- mysql -uuser -ppass skolan < ddl.sql
-- mysql -uuser -ppass skolan < dml_insert.sql
-- mysql -uuser -ppass skolan < ddl_migrate.sql

-- To sum up the lon column
-- mysql -uuser -ppass skolan -e "SELECT SUM(lon) AS 'Lönesumma', SUM(kompetens) AS Kompetens FROM larare;"