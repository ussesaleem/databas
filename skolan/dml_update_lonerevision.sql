--
-- Doing a pay review in the tables in database skolan.
-- By Usama Saleem for course Database Technologies for the Web.
-- 2020-02-04
--

-- Restore the database
-- mysql -uuser -ppass skolan < ddl.sql
-- mysql -uuser -ppass skolan < dml_insert.sql
-- mysql -uuser -ppass skolan < ddl_migrate.sql
-- mysql -uuser -ppass skolan < dml_update.sql

--
-- To check the content of the database
--
SELECT
    SUM(lon) AS Lönesumma,
    SUM(kompetens) AS Kompetens 
FROM larare
;

SELECT
	SUM(lon)
INTO
	@lon_before
FROM
	larare
;

--
-- To check the value of raise (6.4%)
--
SELECT
    SUM(lon)*0.064 AS Lönepott
FROM larare
;

-- 1. Albus kompetens är nu 7 och lönen har ökat till 85 000.
UPDATE larare SET lon = 85000, kompetens = 7 WHERE akronym = 'dum';

-- 2. Minervas lön har ökat med 4 000.
UPDATE larare SET lon = lon+4000 WHERE akronym = 'min';

-- 3. Argus har fått ett risktillägg om 2 000 och kompetensen är satt till 3.
UPDATE larare SET lon = lon+2000, kompetens = 3 WHERE akronym = 'fil';

-- 4. Gyllenroy och Alastor har hög frånvaro och har fått ett löneavdrag med 3 000.
UPDATE larare 
	SET 
		lon = lon-3000 
    WHERE 
		akronym IN ('gyl', 'ala')
;

-- 5. Alla lärare på avdelningen DIDD fick en extra lönebonus om 2%.
UPDATE larare 
	SET 
		lon = lon*1.02 
    WHERE 
		avdelning = 'DIDD'
;

-- 6. Alla låglönade kvinnliga lärare, de som tjänar färre än 40 000, fick en lönejustering om extra 3%.
UPDATE larare 
	SET 
		lon = lon*1.03 
    WHERE 
		kon = 'K' 
        AND lon < 40000
;

-- 7. Ge Snape, Minerva och Hagrid ett extra lönetillägg om 5 000 för extra arbete de utför åt Albus och öka deras kompetens med +1.
UPDATE larare 
	SET 
		lon = lon+5000, kompetens = kompetens+1
    WHERE 
		akronym IN ('sna', 'min', 'hag')
;

-- 8. Ge alla lärare en ökning om 2.2% men exkludera Albus, Snape, Minerva och Hagrid som redan fått tillräckligt.
UPDATE larare 
	SET 
		lon = lon*1.022
    WHERE 
		akronym NOT IN ('dum', 'sna', 'min', 'hag')
;

SELECT
    SUM(lon) AS Lönesumma
FROM larare
;

SELECT
    SUM(kompetens) AS Kompetens 
FROM larare
;

SELECT
	(SUM(lon)-305000) / 305000 * 100 AS 'Lönesumma ökning %'
FROM
	larare
;

SELECT akronym, avdelning, fornamn, kon, lon, kompetens
FROM larare
ORDER BY lon DESC
;

SELECT
    SUM(lon) AS Lönesummaa,
    SUM(kompetens) AS Kompetens 
FROM larare
;

-- To restore the database
-- mysql -uuser -ppass skolan < ddl.sql
-- mysql -uuser -ppass skolan < dml_insert.sql
-- mysql -uuser -ppass skolan < ddl_migrate.sql
-- mysql -uuser -ppass skolan < dml_update.sql
-- mysql -uuser -ppass skolan < dml_update_lonerevision.sql
-- mysql -uuser -ppass skolan -e "SELECT SUM(lon) AS Lönesumma, SUM(kompetens) AS Kompetens FROM larare;"