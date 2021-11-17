create database kettő;
use kettő;

create table tanfolyam(
tkod int primary key,
ar int check(ar>0),
megnevezés varchar(50),
tipus char(1)
);

create table resztvevő(
tajszam varchar(12) primary key,
név varchar(50),
lakcím varchar(100)
);

create table befizetes(
befizetes int,
kurzus int, Foreign key(kurzus) references tanfolyam(tkod),
diak varchar(12),Foreign key(diak) references resztvevő(tajszám) 
);

SELECT tipus, AVG(ar), MAX(ar) - MIN(ar) FROM tanfolyam GROUP BY tipus;

SELECT megnevezes, CASE WHEN ar > 100000 THEN 'drága' ELSE 'olcsó'
END arkategoria FROM termek;
CREATE VIEW tdb AS SELECT MAX(t.megnevezes) nev, COUNT(*) db
FROM tanfolyam t INNER JOIN befizetes b ON b.kurzus = t.tkod GROUP BY
t.tkod;

SELECT név, case WHEN db > 10 THEN 'látogatott' ELSE 'nem látogatott' END letszam FROM tdb;