--
-- Delete from database skolan.
-- By Usama Saleem for course Database Technologies for the Web.
-- 2020-02-04
--

--
-- Delete rows from table
--
DELETE FROM larare WHERE fornamn = 'Hagrid';
DELETE FROM larare WHERE avdelning = 'DIPT';
DELETE FROM larare WHERE lon IS NOT NULL
	LIMIT 2
;
DELETE FROM larare;

SELECT * FROM larare;