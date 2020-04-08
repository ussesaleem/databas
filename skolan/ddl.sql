--
-- Create scheme for database skolan.
-- By Usama Saleem for course Database Technologies for the Web.
-- 2020-02-04
--

--
-- Create table: larare
--
DROP TABLE IF EXISTS larare;
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
);

-- --
-- -- View table
-- --
-- SHOW TABLES;

-- --
-- -- View content of the table
-- --
-- SELECT * FROM larare;
