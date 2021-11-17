create database négy;
use négy;

create table gyarto(
adoszam int primary key,
nev varchar(30),
telephely varchar(50)
);

create table termek(
tkod int primary key,
nev varchar(50),
ear int check(ear>0),
gyarto int,Foreign key(gyarto) references gyarto(adoszam)
);

ALTER TABLE termek ADD (kategoria VARCHAR(50));

CREATE VIEW kgy AS SELECT g.adoszam, t.kategoria FROM gyarto g LEFT
OUTER JOIN termek t ON g.adoszam = t.gyarto GROUP BY
g.adoszam, t.kategoria;
CREATE VIEW kgy2 AS SELECT kategoria, COUNT(adoszam) db FROM
kgy GROUP BY kategoria;
SELECT kategoria FROM kgy2 WHERE db = (SELECT COUNT(*) FROM
 gyarto);
