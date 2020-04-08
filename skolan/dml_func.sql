--
-- Using the built-in functions on database skolan.
-- By Usama Saleem for course Database Technologies for the Web.
-- 2020-02-16
--

--
-- STRÄNGFUNKTIONER
-- 
-- 1. Skriv en SELECT-sats som skriver ut förnamn + efternamn + avdelning i 
-- samma kolumn enligt följande struktur: förnamn efternamn (avdelning). (Tips: 
-- Att slå ihop strängar kallas att konkatenera/concatenate).
SELECT
	CONCAT(fornamn, " ", efternamn, " ", "(", avdelning, ")") AS "Namn (avd)"
FROM larare
;

-- 2. Gör om samma sak men skriv ut avdelningens namn med små bokstäver och 
-- begränsa utskriften till 3 rader.
SELECT
	CONCAT(fornamn, " ", efternamn, " ", "(", LOWER(avdelning), ")") AS "Namn (avd)"
FROM larare LIMIT 3
;

--
-- DATUM OCH TID
--
-- 1. Skriv en SELECT-sats som endast visar dagens datum.
SELECT NOW();

-- 2. Gör en SELECT-sats som visar samtliga lärare, deras födelseår samt dagens 
-- datum och klockslag.
SELECT
	fornamn AS Fornamn,
    fodd AS Fodelsedatum,
    DATE_FORMAT(NOW(), "%Y-%m-%d") AS "Dagens datum",
    DATE_FORMAT(NOW(), "%T") AS Klockslag
FROM larare
;

--
-- BERÄKNA ÅLDER
--
SELECT
	fornamn AS Fornamn,
    fodd AS Fodelsedatum,
    TIMESTAMPDIFF(YEAR, fodd, CURDATE()) AS Alder
FROM larare
ORDER BY Alder DESC
;

-- --
-- -- Show which month the teachers are born. Add WHERE to filter.
-- --
-- SELECT
-- 	   fornamn,
--     fodd,
--     MONTHNAME(fodd) AS "Månad"
-- FROM larare
-- WHERE MONTH(fodd) = 5
-- ;

-- 1. Visa de lärare som är födda på 40-talet.
SELECT
	fornamn AS Fornamn,
    fodd AS Fodd
FROM larare
WHERE YEAR(fodd) BETWEEN 1940 AND 1950
ORDER BY YEAR(fodd) ASC
;