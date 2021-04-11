USE bootcamp;

-- Starting with a clean state by dropping and modifying the cats table

DROP TABLE cats;

CREATE TABLE cats(
	cat_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(50),
    breed VARCHAR(50),
    age INT,
    PRIMARY KEY(cat_id)
    );

DESC cats;

INSERT INTO cats(name, breed, age) 
VALUES ('Ringo', 'Tabby', 4),
       ('Cindy', 'Maine Coon', 10),
       ('Dumbledore', 'Maine Coon', 11),
       ('Egg', 'Persian', 4),
       ('Misty', 'Tabby', 13),
       ('George Michael', 'Ragdoll', 9),
       ('Jackson', 'Sphynx', 7);

-- SELECT command       
SELECT * FROM cats;

SELECT name FROM cats;

SELECT cat_id, name , age FROM cats;

SELECT * FROM cats WHERE age=4;

-- MySQL is case insensitive : Table names are stored in lowercase on disk and name comparisons are not case-sensitive.
SELECT * FROM cats WHERE name = 'Egg';
SELECT * FROM cats WHERE name = 'eGg';
SELECT * FROM cats WHERE name = 'EGG';

-- SELECT command Rapid Fire challenge exercise

SELECT name, age
FROM cats
WHERE breed = 'Tabby';

SELECT cat_id, age
FROM cats
WHERE cat_id = age;

-- Aliases
SELECT cat_id AS id,name FROM cats;
-- use ' ' if you have space in the alias name
SELECT name AS 'cat name', breed AS 'kitty breed' FROM cats;

--  UPDATE : UPDATE SET WHERE

UPDATE cats
SET breed = 'Shorthair'
WHERE breed = 'Tabby';

SELECT * FROM cats;

UPDATE cats
SET age = 14
WHERE name = 'Misty';

-- UPDATE Rapid Fire Challenge Exercise

UPDATE cats
SET name = 'Jack'
WHERE name = 'Jackson';

UPDATE cats
SET breed = 'Bristish Shorthair'
WHERE name = 'Ringo';

UPDATE cats
SET age = 12
WHERE breed = 'Maine Coon';

-- DELETE

SELECT * FROM cats
WHERE name = 'Egg';

DELETE FROM cats
WHERE name = 'egG';

SELECT * FROM cats
WHERE name = 'Egg';

-- DELETE FROM cats; -> Delete all data

-- DELETE command Rapid Fire Challenge Exercise

-- Q1. Delete all 4yr old cats
SELECT * FROM cats
WHERE age = 4;

DELETE FROM cats
WHERE age = 4;

-- Q2. DELETE cats whose name is the same as cat_id
SELECT * FROM cats 
WHERE age = cat_id;

DELETE FROM cats 
WHERE age = cat_id;

-- Q3. Delete all cats
DELETE FROM cats;

SELECT * FROM cats;






