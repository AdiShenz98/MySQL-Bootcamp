CREATE database Datatypes_test;

USE Datatypes_test;

-- CHAR 
-- has a fixed length
-- if the text has less length it fills with spaces,
-- if it has more length it truncates to fixed length
-- 0-255
CREATE TABLE dogs (name CHAR(5), breed VARCHAR(10));
 
INSERT INTO dogs (name, breed) VALUES ('bob', 'beagle');
 
INSERT INTO dogs (name, breed) VALUES ('robby', 'corgi');
 
INSERT INTO dogs (name, breed) VALUES ('Princess Jane', 'Retriever');
 
INSERT INTO dogs (name, breed) VALUES ('Princess Jane', 'Retrievesadfdsafdasfsafr');
 
SELECT * FROM dogs;

	

-- DECIMAL(x,y)
-- x: total digits
-- y: digits after decimal point
-- if we put a larger number its gonna show the largest possible value for x.y
-- also rounds up to y decimal places

CREATE TABLE items(price DECIMAL(5,2));
 
INSERT INTO items(price) VALUES(7);
 
INSERT INTO items(price) VALUES(7987654); -- returns 999.99
 
INSERT INTO items(price) VALUES(34.88);
 
INSERT INTO items(price) VALUES(298.9999); -- returns 299.00
 
INSERT INTO items(price) VALUES(1.9999); -- returns 2.00
 
SELECT * FROM items;


-- FLOAT and DOUBLE
-- store larger numbers using less space, but with lesser precision
-- FLOAT: 4 bytes  ` prcision upto 7 digits
-- DOUBLE: 8 bytes ` precision upto 15 digits

CREATE TABLE thingies (price FLOAT);
 
INSERT INTO thingies(price) VALUES (88.45);
 
SELECT * FROM thingies;
 
INSERT INTO thingies(price) VALUES (8877.45);
 
SELECT * FROM thingies;
 
INSERT INTO thingies(price) VALUES (8877665544.45);
 
SELECT * FROM thingies;

-- Dates and Times
-- DATE - 'YYYY-MM-DD' : Values with a date but no time
-- TIME - 'HH:MM:SS'  : Values with time but no date
-- DATETIME - 'YYYY-MM-SS HH:MM:SS' :Values with a DATE and TIME

CREATE TABLE people(
	name VARCHAR(100),
    birthdate DATE,
    birthtime TIME,
    birthdt DATETIME);
    
INSERT INTO people
VALUES ('Padma','1983-11-11','10:07:35','1983-11-11 10:07:35');

INSERT INTO people
VALUES ('Larry','1943-12-25','04:10:42','1943-12-25 04:10:42');

SELECT * FROM people;

-- CURDATE() - current date
-- CURTIME() - current time
-- NOW() - current datetime

SELECT
	CURDATE(),
    CURTIME(),
    NOW();
    
INSERT INTO people
VALUES ('Joey',CURDATE(),CURTIME(),NOW());

-- FORMATTING DATES
-- DAY() : Extracts the day
-- DAYNAME()
-- DAYOFWEEK()
-- DAYOFYEAR()

SELECT
	name,
    birthdate,
    DAY(birthdate) as Day,
    DAYNAME(birthdate) as Name,
    DAYOFWEEK(birthdate) as DayWeek,
    DAYOFYEAR(birthdate) as Dayyear
FROM
	people;

-- HOUR()
-- MINUTE()
-- SECOND()

SELECT
	name,
    birthtime,
    HOUR(birthtime) as hour,
    MINUTE(birthtime) as minute,
    SECOND(birthtime) as seconds
FROM
	people;
    
-- DATE_FORMAT(date,format)

SELECT
	birthdt,
	DATE_FORMAT(birthdt,'%m/%d/%Y') as Formatted_date
FROM
	people;
    
SELECT
	birthdt,
	DATE_FORMAT(birthdt,'I was born on %D %M, %Y at %h%p') as dateformat
FROM
	people;
    
-- DATE MATH

-- DATEDIFF()
-- Differe ce between two dates in days

SELECT
	name,
    birthdate,
	DATEDIFF(NOW(),birthdate)
FROM
	people;
    
-- DATE_ADD(date,INTERVAL expr_unit)
-- DATE_SUB()
-- add one month

SELECT
	birthdt,
    DATE_ADD(birthdt, INTERVAL 1 MONTH)
FROM
	people;
    
SELECT
	birthdt,
    DATE_SUB(birthdt, INTERVAL 3 QUARTER)
FROM
	people;
    
-- +/- 

SELECT
	birthdate,
	birthdate + INTERVAL 1 MONTH,
    birthdate - INTERVAL 3 MONTH,
    birthdt + INTERVAL 5 MONTH + INTERVAL 10 HOUR
FROM
	people;

-- TIMESTAMPS : ranges from year 1970 to 2038
-- takes up less space than DATETIME
    
CREATE TABLE comments(
	content VARCHAR(100),
    created_at TIMESTAMP DEFAULT NOW()
    );
 
INSERT INTO comments (content) VALUES('lol what a funny article');
 
INSERT INTO comments (content) VALUES('I found this offensive');
 
INSERT INTO comments (content) VALUES('Ifasfsadfsadfsad');
 
SELECT * FROM comments ORDER BY created_at DESC;

-- ON UPDATE: 

CREATE TABLE comments2(
	content VARCHAR(100),
    changed_at TIMESTAMP DEFAULT NOW() ON UPDATE CURRENT_TIMESTAMP
    );
-- CURRENT_TIMESTAMP is same as NOW()

 INSERT INTO comments2 (content) VALUES('dasdasdasd');
 
INSERT INTO comments2 (content) VALUES('lololololo');
 
INSERT INTO comments2 (content) VALUES('I LIKE CATS AND DOGS');
 
UPDATE comments2 SET content='THIS IS NOT GIBBERISH' WHERE content='dasdasdasd';
 
SELECT * FROM comments2;
 
SELECT * FROM comments2 ORDER BY changed_at;
