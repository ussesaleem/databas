--
-- Copying tables in database skolan.
-- By Usama Saleem for course Database Technologies for the Web.
-- 2020-02-16
--
--
-- Make copy of table.
--
DROP TABLE IF EXISTS larare_pre;

CREATE TABLE larare_pre LIKE larare;
INSERT INTO larare_pre SELECT * FROM larare;

-- Check the content of the tables, for sanity check.
-- SELECT SUM(lon) AS 'Lönesumma', SUM(kompetens) AS Kompetens FROM larare;
-- SELECT SUM(lon) AS 'Lönesumma', SUM(kompetens) AS Kompetens FROM larare_pre;
