SELECT database();

SHOW DATABASES;

USE BoOtcamp;

SELECT database();

SHOW TABLES;

CREATE TABLE cats(
	name VARCHAR(20),
    age INT 
);

INSERT INTO cats(name ,age)
VALUES ('Blue',1);

INSERT INTO cats(age, name)
VALUES (9, 'Draco');

SELECT * FROM cats;

INSERT INTO cats(name,age)
VALUES ('Peanut', 2),
	   ('Butter', 4),
       ('Jelly', 7);

CREATE TABLE people (
		first_name VARCHAR(20),
        last_name VARCHAR(20),
        age INT);
        
SHOW TABLES;

DESC people;

INSERT INTO people(first_name, last_name, age)
VALUES ('Tina', 'Belcher', 13);

INSERT INTO people(age, first_name, last_name)
VALUES (42, 'Bob' ,'Belcher');

INSERT INTO people 
VALUES ('Linda', 'Belcher', 45),
	   ('Philip', 'Frond', 38),
       ('Calvin', 'Fishoeder', 70);
       
SELECT * FROM people;

INSERT INTO cats()
VALUES ();

SELECT * FROM cats;

CREATE TABLE cats2(
	name VARCHAR(25) NOT NULL,
    age INT NOT NULL
);

SHOW TABLES;

SELECT * FROM cats2;

DESC cats2;

INSERT INTO cats2(name)
VALUES ('Valentino');

SHOW WARNINGS;

SELECT * FROM cats2;

USE bootcamp;

CREATE TABLE cats3(
	name VARCHAR(30) DEFAULT 'unnamed',
    age INT DEFAULT 0
);

DESC cats3;

INSERT INTO cats3(age) VALUES (13);

SELECT * FROM cats3;

INSERT INTO cats3 VALUES ();

SELECT * FROM cats3;

CREATE TABLE cats4(
	name VARCHAR(30) NOT NULL DEFAULT 'N/A',
    age INT NOT NULL
    );
    
INSERT INTO cats4 (age)
VALUES (3);

SELECT * FROM cats4;

CREATE TABLE unique_cats(
	cat_id INT NOT NULL,
    name VARCHAR(30) DEFAULT 'N/A',
    age INT DEFAULT 0,
    PRIMARY KEY(cat_id)
    );
    
DESC unique_cats;

INSERT INTO unique_cats
VALUES (1,'Freddy',8),
	   (2,'John',3),
       (3,'Skippy',10);


CREATE TABLE unique_cats2(
	cat_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(30) DEFAULT 'N/A',
    age INT DEFAULT 0,
    PRIMARY KEY(cat_id)
    );
    
DESC unique_cats2;

INSERT INTO unique_cats2
VALUES (1,'Freddy',8);

INSERT INTO unique_cats2(name,age)
VALUES ('Freddy',8),
	   ('John',3),
       ('Skippy',10);
       
SELECT * FROM unique_cats2;
	   
