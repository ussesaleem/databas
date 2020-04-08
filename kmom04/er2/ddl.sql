--
-- Create tables in ER-modelling part of KMOM04
-- By Usama Saleem for course Database Technologies for the Web.
-- 2020-03-22
-- 
--
-- Use the database eshop
--
USE eshop;

--
-- Drop tables if exists
--
DROP TABLE IF EXISTS Faktura;
DROP TABLE IF EXISTS Plocklista;
DROP TABLE IF EXISTS Ordern;
DROP TABLE IF EXISTS Kundregister;
DROP TABLE IF EXISTS Lagerregister;
DROP TABLE IF EXISTS Produktregister;
DROP TABLE IF EXISTS Produkter;

--
-- 1.	Create table – Kaffe, Kaffetillbehör, Te-produkter
--
CREATE TABLE Produkter
(
    kod INT NOT NULL PRIMARY KEY AUTO_INCREMENT
);

--
-- 2.	Create table – Produktregister
--
CREATE TABLE Produktregister
(
    kod INT NOT NULL PRIMARY KEY,
    FOREIGN KEY (kod) REFERENCES Produkter(kod),
    namn CHAR(15),
    beskrivning CHAR(100),
    pris INT
);

--
-- 3.	Create table – Lagerregister
--
CREATE TABLE Lagerregister
(
    kod INT NOT NULL,
    FOREIGN KEY (kod) REFERENCES Produkter(kod),
    antal INT,
    hyllplats CHAR(6),
    PRIMARY KEY (kod, hyllplats)
);

--
-- 4.	Create table – Kundregister
--
CREATE TABLE Kundregister
(
    kundnummer INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    namn CHAR(25),
    telefonnummer INT,
    adress CHAR(40),
    epost CHAR(30)
);

--
-- 5.	Create table – Order
--
CREATE TABLE Ordern
(
    kundnummer INT NOT NULL,
    FOREIGN KEY (kundnummer) REFERENCES Kundregister(kundnummer),
    kod INT NOT NULL,
    FOREIGN KEY (kod) REFERENCES Produkter(kod),
    antal CHAR(3),
    PRIMARY KEY (kundnummer, kod)
);

--
-- 6.	Create table – Plocklista
--
CREATE TABLE Plocklista
(
    kod INT NOT NULL,
    FOREIGN KEY (kod) REFERENCES Produkter(kod),
    kundnummer INT NOT NULL PRIMARY KEY,
    FOREIGN KEY (kundnummer) REFERENCES Kundregister(kundnummer)
);

--
-- 7.	Create table – Faktura
--
CREATE TABLE Faktura
(
    kundnummer INT NOT NULL,
    FOREIGN KEY (kundnummer) REFERENCES Kundregister(kundnummer),
    kod INT NOT NULL,
    FOREIGN KEY (kod) REFERENCES Produkter(kod),
    slutsumma INT,
    PRIMARY KEY (kundnummer, kod)
);