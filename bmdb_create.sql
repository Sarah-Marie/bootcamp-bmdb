-- Drop and Create the Database, DDL

drop database if exists bmdb_db;
create database bmdb_db;
use bmdb_db;

-- DDL - Create Tables
create table movie (
	id 				int 			primary key auto_increment,
	title 		    varchar(100) 	not null,
	year 		    int 	        not null,
	rating    	    varchar(5) 		not null,
	director		varchar(50) 	not null
    );

create table Actor (
	ID 				int 			not null primary key auto_increment,
	FirstName 		varchar(25)		not null,
	LastName 		varchar(25)		not null,
	Gender  		varchar(6) 		not null,
	BirthDate 		date 			not null,
    CONSTRAINT unq_actor unique (FirstName, LastName, Birthdate)
	);


create table credit (
	ID 				int 			not null primary key auto_increment,
	ActorID		    int 			not null,
	MovieID		    int 			not null,
	Role			varchar(25)     not null,
    Foreign Key (ActorID) references Actor(ID),
    Foreign Key (MovieID) references Movie(ID),
    CONSTRAINT act_mov unique (ActorID, MovieID)
    );
    
-- DML Insert Movie Data

insert into movie (id, title, year, rating, director) 
	values (1, 'Frozen', 2013 , 'PG', 'Chris Buck');
insert into movie (id, title, year, rating, director)
	values (2, 'Bad Moms', 2016, 'R', 'John Lucas');
insert into movie (id, title, year, rating, director)
	values (3, 'Forgetting Sarah Marshall', 2008, 'R', 'Nicholas Stoller');



-- DDL Insert Actor Data

insert into actor (id, firstName, lastName, gender, birthDate)
	values (1, 'Kristen', 'Bell', 'f', '1980-07-18');
insert into actor (id, firstName, lastName, gender, birthDate)
	values (2, 'Mila', 'Kunis', 'f', '1983-08-14');  
insert into actor (id, firstName, lastName, gender, birthDate)
	values (3, 'Russell', 'Brand','m', '1975-06-04'); 
    
-- DML Insert Credit Data

insert into credit (id, ActorID, MovieID, Role)
	values (1, 1, 1, 'Elsa');
insert into credit (id, ActorID, MovieID, Role)
	values (2, 1, 2, 'Kiki');
insert into credit (id, ActorID, MovieID, Role)
	values (3, 1, 3, 'Sarah Marshall');
insert into credit (id, ActorID, MovieID, Role)
	values (4, 2, 2, 'Amy');
insert into credit (id, ActorID, MovieID, Role)
	values (5, 2, 3, 'Rachel Jansen');
insert into credit (id, ActorID, MovieID, Role)
	values (6, 3, 3, 'Aldous Snow');

