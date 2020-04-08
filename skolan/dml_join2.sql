--
-- Join tables and create reports.
-- By Usama Saleem for course Database Technologies for the Web.
-- 2020-03-09
--
-- --
-- --A crossjoin
-- --
-- SELECT * FROM kurs, kurstillfalle; 

--
-- Join using WHERE, use alias AS to shorten the statement
--
SELECT *
FROM kurs AS k, kurstillfalle AS kt
WHERE k.kod = kt.kurskod;

--
-- Join using JOIN..ON
--
SELECT *
FROM kurs AS k
    JOIN kurstillfalle AS kt
        ON k.kod = kt.kurskod;
        
--
-- Join three tables
--
DROP VIEW IF EXISTS v_planering;

CREATE VIEW v_planering
AS
SELECT *
FROM kurs AS k
    JOIN kurstillfalle AS kt
        ON k.kod = kt.kurskod
    JOIN larare AS l
        ON l.akronym = kt.kursansvarig;

--
-- Lärarens arbetsbelastning
--
SELECT
	akronym AS Akronym,
	CONCAT(fornamn, " ", efternamn) AS Namn,
    COUNT(kursansvarig) AS Tillfallen
FROM v_planering
GROUP BY
	kursansvarig
ORDER BY 
	Tillfallen DESC
;

--
-- Kursansvariges ålder
--
SELECT
	CONCAT(namn, " (", kod, ")") AS Namn,
    CONCAT(fornamn, " ", efternamn, " (", akronym, ")") AS Larare,
    TIMESTAMPDIFF(YEAR, fodd, CURDATE()) AS "Ålder"
FROM v_planering
ORDER BY TIMESTAMPDIFF(YEAR, fodd, CURDATE()) DESC
LIMIT 6
;