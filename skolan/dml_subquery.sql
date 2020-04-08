--
-- Using subqueries
-- By Usama Saleem for course Database Technologies for the Web.
-- 2020-03-09
--
--
-- Subqueries
--
-- Step 1
SELECT
	*
FROM larare
WHERE
	avdelning = 'DIDD'
;

-- Step 2
SELECT
	*
FROM kurstillfalle
;

-- Step 3: Put them together
SELECT
	*
FROM kurstillfalle
WHERE
	kursansvarig IN (
		SELECT
			akronym
		FROM larare
        WHERE
			avdelning = 'DIDD'
	)
;

--
-- Subqueries with UNION
--
(
	SELECT akronym, avdelning FROM larare WHERE avdelning = 'DIDD'
)
UNION
(
	SELECT akronym, avdelning FROM larare WHERE avdelning = 'DIPT'
)
;

-- -- Same as:
-- SELECT
-- 	akronym,
--     avdelning
-- FROM larare
-- WHERE
-- 	avdelning IN ('DIDD', 'DIPT')
-- ;

-- 1. Visa detaljer om den lärare som är äldst. Ta fram max ålder med en 
-- subquery och använd dess resultat i WHERE-satsen.
SELECT
	akronym,
    fornamn,
    efternamn,
    Ålder
FROM v_larare
WHERE
	Ålder = (
		SELECT
			MAX(TIMESTAMPDIFF(YEAR, fodd, CURDATE()))
		FROM v_larare
    )
;