--
-- Import from Excel to Table.
-- By Usama Saleem for course Database Technologies for the Web.
-- 2020-03-08
--
--
-- Delete tables, in order, depending on
-- foreign key constraints.
--
DELETE FROM kurstillfalle;
DELETE FROM kurs;

-- --
-- -- Enable LOAD DATA LOCAL INFILE on the server.
-- --
SET GLOBAL local_infile = 1;
SHOW VARIABLES LIKE 'local_infile';

--
-- Insert into kurs.
--
LOAD DATA LOCAL INFILE 'kurs.csv'
INTO TABLE kurs
CHARSET utf8
FIELDS
    TERMINATED BY ','
    ENCLOSED BY '"'
LINES
    TERMINATED BY '\n'
IGNORE 1 LINES
;

SELECT * FROM kurs;

--
-- Insert into kurstillfalle.
--
LOAD DATA LOCAL INFILE 'kurstillfalle.csv'
INTO TABLE kurstillfalle
CHARSET utf8
FIELDS
    TERMINATED BY ','
    ENCLOSED BY '"'
LINES
    TERMINATED BY '\n'
IGNORE 1 LINES
(kurskod, kursansvarig, lasperiod)
;

SELECT * FROM kurstillfalle;
