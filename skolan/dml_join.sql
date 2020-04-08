--
-- Join both the tables in database skolan.
-- By Usama Saleem for course Database Technologies for the Web.
-- 2020-02-16
--
--
-- JOIN
--
SELECT
	l.akronym,
    l.lon,
    l.kompetens,
    p.lon AS "pre-lon",
    p.kompetens AS "pre-kompetens"
FROM larare AS l
	JOIN larare_pre AS p
		ON l.akronym = p.akronym
ORDER BY akronym
;

--
-- RAPPORT FRÅN LÖNEREVISIONEN
--
-- 1. Skapa rapporten som visar resultatet enligt nedan.
SELECT
	l.akronym AS "Akronym",
    l.fornamn AS "Förnamn",
    l.efternamn AS "Efternamn",
    p.lon AS "Lön innan",
    l.lon AS "Lön nu",
    l.lon - p.lon AS "Diff",
    (l.lon - p.lon) / p.lon * 100 AS "Löneförändring %",
    IF(((l.lon - p.lon) / p.lon * 100) > 2, "ok", "nok") AS Mini
FROM larare AS l
	JOIN larare_pre AS p
		ON l.akronym = p.akronym
ORDER BY (l.lon - p.lon) / p.lon * 100 DESC
;

SELECT
	l.akronym AS "Akronym",
    l.fornamn AS "Förnamn",
    l.efternamn AS "Efternamn",
    p.kompetens AS "Kompetens innan",
    l.kompetens AS "Kompetens nu",
    l.kompetens - p.kompetens AS Diffkomp
FROM larare AS l
	JOIN larare_pre AS p
		ON l.akronym = p.akronym
ORDER BY Diffkomp DESC
;

-- 2. Spara rapporten som en vy v_lonerevision.
DROP VIEW IF EXISTS v_lonerevision;

CREATE VIEW v_lonerevision
AS
SELECT
	l.akronym AS "Akronym",
    l.fornamn AS "Förnamn",
    l.efternamn AS "Efternamn",
    p.lon AS "Lön innan",
    l.lon AS "Lön nu",
    l.lon - p.lon AS "Diff",
    (l.lon - p.lon) / p.lon * 100 AS "Löneförändring %",
    IF(((l.lon - p.lon) / p.lon * 100) > 2, "ok", "nok") AS Mini,
    p.kompetens AS "Kompetens innan",
    l.kompetens AS "Kompetens nu",
    l.kompetens - p.kompetens AS Diffkomp
FROM larare AS l
	JOIN larare_pre AS p
		ON l.akronym = p.akronym
ORDER BY (l.lon - p.lon) / p.lon * 100 DESC
;