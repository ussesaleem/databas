--
-- Adding more tables
-- By Usama Saleem for course Database Technologies for the Web.
-- 2020-03-07
--
SET NAMES 'utf8';

--
-- Update table larare and larare_pre to use same charset
-- and collation.
--
ALTER TABLE larare CONVERT TO CHARSET utf8 COLLATE utf8_swedish_ci;
ALTER TABLE larare_pre CONVERT TO CHARSET utf8 COLLATE utf8_swedish_ci;

-- Drop tables in order to avoid FK constraint
DROP TABLE IF EXISTS kurstillfalle;
DROP TABLE IF EXISTS kurs;

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
	id				INT AUTO_INCREMENT,
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

-- SHOW CREATE TABLE kurs \G;
-- SHOW CREATE TABLE kurstillfalle \G;