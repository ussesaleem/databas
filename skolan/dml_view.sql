--
-- Creating views on database skolan.
-- By Usama Saleem for course Database Technologies for the Web.
-- 2020-02-16
--

-- SELECT
-- 	CONCAT(fornamn, " ", efternamn, " (", LOWER(avdelning), ")") AS Namn,
--     TIMESTAMPDIFF(YEAR, fodd, CURDATE()) AS "Ålder"
-- FROM larare
-- ;

-- --
-- -- Create view.
-- --
-- CREATE VIEW v_name_alder
-- AS
-- SELECT
-- 	CONCAT(fornamn, " ", efternamn, " (", LOWER(avdelning), ")") AS Namn,
--     TIMESTAMPDIFF(YEAR, fodd, CURDATE()) AS "Ålder"
-- FROM larare
-- ;
-- -- Use view.
-- SELECT * FROM v_name_alder
-- WHERE Namn LIKE "%di%"
-- ORDER BY Ålder DESC
-- LIMIT 3;

-- -- Delete view with DROP VIEW.
-- -- Change view with ALTER VIEW.

--
-- VY MED LÄRARE OCH ÅLDER
--
-- 1. Skapa en vy “v_larare” som innehåller samtliga kolumner från tabellen Lärare 
-- inklusive en ny kolumn med lärarens ålder.
DROP VIEW IF EXISTS v_larare;

CREATE VIEW v_larare
AS
SELECT 
	*,
    TIMESTAMPDIFF(YEAR, fodd, CURDATE()) AS "Ålder"
FROM larare
;

-- 2. Gör en SELECT-sats mot vyn som beräknar medelåldern på respektive avdelning. 
-- Visa avdelningens namn och medelålder sorterad på medelåldern.
SELECT
	avdelning AS Avdelning,
    AVG(TIMESTAMPDIFF(YEAR, fodd, CURDATE())) AS "Snittålder"
FROM v_larare
GROUP BY Avdelning
ORDER BY AVG(TIMESTAMPDIFF(YEAR, fodd, CURDATE())) DESC
;