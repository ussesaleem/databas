--
-- Calculate various pays in database skolan.
-- By Usama Saleem for course Database Technologies for the Web.
-- 2020-02-16
--

--
-- See which teacher has the lowest- respective highest pay.
--
-- 1. Hur mycket är den högsta lönen som en lärare har?
SELECT MAX(lon) FROM larare;

-- 2. Hur mycket är den lägsta lönen som en lärare har?
SELECT MIN(lon) FROM larare;

-- --
-- -- Aggregating functions, work on the whole table.
-- --
-- SELECT AVG(kompetens) FROM larare;

-- --
-- -- Competence on a whole department.
-- --
-- SELECT
-- 	avdelning,
--     AVG(kompetens)
-- FROM larare
-- GROUP BY avdelning
-- ;

-- --
-- -- Grouping more columns.
-- --
-- SELECT avdelning, kompetens, SUM(lon) as Summa
-- FROM larare
-- GROUP BY avdelning, kompetens
-- ORDER BY Summa DESC
-- ;

-- 1. Hur många lärare jobbar på de respektive avdelning?
SELECT 
	avdelning AS "Avdelning",
    COUNT(akronym) AS "Antal lärare"
FROM larare
GROUP BY avdelning
ORDER BY COUNT(akronym) ASC
;

-- 2. Hur mycket betalar respektive avdelning ut i lön varje månad?
SELECT
	avdelning AS "Avdelning",
    SUM(lon) AS "Summa lön"
FROM larare
GROUP BY avdelning
ORDER BY SUM(lon) DESC
;

-- 3. Hur mycket är medellönen för de olika avdelningarna?
SELECT
	avdelning AS "Avdelning",
    AVG(lon) AS "Medellön"
FROM larare
GROUP BY avdelning
ORDER BY AVG(lon) DESC
;

-- 4. Hur mycket är medellönen för kvinnor kontra män?
SELECT
	kon AS "Kön",
    AVG(lon) AS "Medellön"
FROM larare
GROUP BY kon
ORDER BY AVG(lon) DESC
;

--

-- 1. Visa snittet på kompetensen för alla avdelningar, sortera på kompetens i 
-- sjunkande ordning och visa enbart den avdelning som har högst kompetens.
SELECT
	AVG(kompetens) AS Kompetens,
    avdelning AS Avdelning
FROM larare
GROUP BY avdelning
ORDER BY Kompetens DESC LIMIT 1
;

--

-- 1. Visa den avrundade snittlönen (ROUND()) grupperad per avdelning och per 
-- kompetens, sortera enligt avdelning och snittlön. Visa även hur många som 
-- matchar i respektive gruppering.
SELECT 
	avdelning AS Avdelning,
    kompetens AS Kompetens,
	ROUND(lon) AS Snittlon,
    COUNT(akronym) AS Antal
FROM larare
GROUP BY ROUND(lon), Avdelning, Kompetens
ORDER BY Avdelning ASC
;
    
--

--
-- Using HAVING on the aggregated values calculated by for example SUM and COUNT.
--

-- 1. Vi vill se snittlön per avdelning (och antal), men bara om snittlönen är 
-- större än 35000.
SELECT
	avdelning,
    ROUND(AVG(lon)) AS Snittlon,
    COUNT(lon) AS Antal
FROM larare
GROUP BY avdelning
HAVING Snittlon > 35000
ORDER BY Snittlon DESC
;

-- 2. Vi vill se snittlönen per avdelning (och antal), men bara om det är 3 eller fler 
-- personer på den avdelningen.
SELECT
	avdelning,
    ROUND(AVG(lon)) AS Snittlon,
    COUNT(lon) AS Antal
FROM larare
GROUP BY avdelning
HAVING Antal > 2
ORDER BY Snittlon DESC
;

-- --
-- -- Calculating the average pay depending on the competence. 
-- --
-- SELECT
-- 	avdelning,
--     ROUND(AVG(lon)) AS Snittlon,
--     COUNT(lon) AS Antal
-- FROM larare
-- WHERE kompetens = 1
-- GROUP BY avdelning
-- HAVING Snittlon < 30000
-- ORDER BY avdelning
-- ;

-- 1. Visa per avdelning hur många anställda det finns, gruppens snittlön, 
-- sortera per avdelning och snittlön.
SELECT
	avdelning AS Avdelning,
    ROUND(AVG(lon)) AS Snittlon,
    COUNT(lon) AS Antal
FROM larare
GROUP BY Avdelning
ORDER BY Snittlon DESC
;

-- 2. Visa samma sak som i 1), men visa nu även de kompetenser som finns. 
-- Du behöver gruppera på avdelning och per kompetens, sortera per avdelning och 
-- per kompetens.
SELECT
	avdelning AS Avdelning,
    kompetens AS Kompetens,
    ROUND(AVG(lon)) AS Snittlon,
    COUNT(lon) AS Antal
FROM larare
GROUP BY Avdelning, Kompetens
ORDER BY Avdelning, Kompetens ASC
;

-- 3. Visa samma sak som i 2), men ignorera de kompetenser som är större än 3.
SELECT
	avdelning AS Avdelning,
    kompetens AS Kompetens,
    ROUND(AVG(lon)) AS Snittlon,
    COUNT(lon) AS Antal
FROM larare
WHERE kompetens < 4
GROUP BY Avdelning, Kompetens
ORDER BY Avdelning, Kompetens ASC
;

-- 4. Visa samma sak som i 3), men exkludera de grupper som har fler än 1 i 
-- Antal och snittlön mellan 30 000 - 45 000. Sortera per snittlön.
SELECT
	avdelning AS Avdelning,
    kompetens AS Kompetens,
    ROUND(AVG(lon)) AS Snittlon,
    COUNT(lon) AS Antal
FROM larare
GROUP BY Avdelning, Kompetens
HAVING 
	Antal < 2
    AND Snittlon BETWEEN 30000 AND 45000
ORDER BY Snittlon DESC
;