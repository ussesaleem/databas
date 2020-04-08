--
-- Update the values in the tables in database skolan.
-- By Usama Saleem for course Database Technologies for the Web.
-- 2020-02-04
--

--
-- Update a column value for one line
--
UPDATE larare SET lon = 30000 WHERE akronym = 'gyl';

--
-- Update for multiple lines
--
UPDATE larare
    SET
        lon = 30000
    WHERE
        akronym = 'gyl'
        OR akronym = 'ala'
;

-- or

UPDATE larare
    SET
        lon = 30000
    WHERE
        akronym IN ('gyl', 'ala')
;

-- If you want to target the larare that has NULL in lon
UPDATE larare
    SET
        lon = 30000
    WHERE
        lon IS NULL
;

-- To sum up the lon column
-- mysql -uuser -ppass skolan -e "SELECT SUM(lon) AS 'Lönesumma', SUM(kompetens) AS Kompetens FROM larare;"

--
-- To check what pays the teachers have right now
--
SELECT akronym, avdelning, fornamn, kon, lon, kompetens
FROM larare
ORDER BY lon DESC;

-- Check if the script can be ran
-- mysql -uuser -p skolan < dml_update.sql