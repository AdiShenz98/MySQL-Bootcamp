USE datatypes_test;

-- Q2

CREATE TABLE inventory(
	item_name VARCHAR(50),
    price DECIMAL(8,2),
    quantity INT);
    
-- Q4
SELECT CURTIME();

-- Q5
SELECT CURDATE();

-- Q6 : Print the current day of the week
SELECT DATE_FORMAT(NOW(),'%W') AS DAY;

-- Q7 : Print out in the following format
-- mm/dd/yyyy

SELECT  DATE_FORMAT(NOW(),'%m/%d/%Y');

-- Q8

SELECT DATE_FORMAT(NOW(),'%M %D at %h:%i');

-- Q9 

CREATE TABLE tweets(
	content VARCHAR(100),
    username VARCHAR(40),
    created_at TIMESTAMP DEFAULT NOW() ON UPDATE CURRENT_TIMESTAMP
    );

INSERT INTO tweets (content, username) VALUES('this is my first tweet', 'coltscat');
SELECT * FROM tweets;
 
INSERT INTO tweets (content, username) VALUES('this is my second tweet', 'coltscat');
SELECT * FROM tweets;