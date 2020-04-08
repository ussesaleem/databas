--
-- Using Outer join on tables.
-- By Usama Saleem for course Database Technologies for the Web.
-- 2020-03-09
--
--
-- Teachers responsible for at least one course
--
SELECT DISTINCT
    l.akronym AS Akronym,
    CONCAT(l.fornamn, " ", l.efternamn) AS Namn,
    l.avdelning AS Avdelning,
    kt.kurskod AS Kurskod
FROM larare AS l
    LEFT OUTER JOIN kurstillfalle AS kt
        ON l.akronym = kt.kursansvarig
;

--
-- Kurser utan kurstillfälle
--
SELECT DISTINCT
    k.kod AS Kurskod,
	k.namn AS Kursnamn,
    kt.lasperiod AS "Läsperiod"
FROM kurs AS k
    LEFT OUTER JOIN kurstillfalle AS kt
        ON k.kod = kt.kurskod
ORDER BY kt.lasperiod ASC
LIMIT 2
;