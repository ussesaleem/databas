--
-- Combining all ddl into one file.
-- By Usama Saleem for course Database Technologies for the Web.
-- 2020-03-07
--
SET NAMES 'utf8';

DROP TABLE IF EXISTS kurstillfalle;
DROP TABLE IF EXISTS larare;
DROP TABLE IF EXISTS larare_pre;
DROP TABLE IF EXISTS kurs;

CREATE TABLE IF NOT EXISTS larare
(
    akronym     CHAR(3),
    avdelning   CHAR(4),
    fornamn     VARCHAR(20),
    efternamn   VARCHAR(20),
    kon         CHAR(1),
    lon         INT,
    fodd        DATE,

    PRIMARY KEY (akronym)
)
ENGINE INNODB
CHARSET utf8
COLLATE utf8_swedish_ci
;

ALTER TABLE larare ADD COLUMN kompetens INT;
ALTER TABLE larare DROP COLUMN kompetens;
ALTER TABLE larare ADD COLUMN kompetens INT NOT NULL
	DEFAULT 1
;

CREATE TABLE larare_pre LIKE larare;

CREATE TABLE IF NOT EXISTS kurs
(
	kod		CHAR(6) NOT NULL,
    namn	VARCHAR(40),
    poang	FLOAT,
    niva	CHAR(3),
    
    PRIMARY KEY (kod)
) 
ENGINE INNODB
CHARSET utf8
COLLATE utf8_swedish_ci
;

CREATE TABLE IF NOT EXISTS kurstillfalle
(
	id				INT AUTO_INCREMENT NOT NULL,
    kurskod			CHAR(6) NOT NULL,
    kursansvarig	CHAR(3) NOT NULL,
    lasperiod		INT NOT NULL,
    
    PRIMARY KEY (id),
    FOREIGN KEY (kurskod) REFERENCES kurs(kod),
    FOREIGN KEY (kursansvarig) REFERENCES larare(akronym)
)
ENGINE INNODB
CHARSET utf8
COLLATE utf8_swedish_ci
;

DROP VIEW IF EXISTS v_larare;

CREATE VIEW v_larare
AS
SELECT 
	*,
    TIMESTAMPDIFF(YEAR, fodd, CURDATE()) AS "Ålder"
FROM larare
;

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
