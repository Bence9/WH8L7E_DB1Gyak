create database három;
use három;

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

alter table termekek drop column gyarto;

create table gyartas(
termek int references termek,
gyarto int references gyarto
);