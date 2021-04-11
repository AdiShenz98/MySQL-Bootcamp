-- Logical Operators
USE book_shop;
-- NOT EQUAL(!=)

-- Select all the books that were not released in 2017

SELECT 
	title,
    released_year
FROM
	books
WHERE 
	released_year != 2017;
    
-- NOT LIKE 

SELECT
	title
FROM 
	books
WHERE 
	title NOT LIKE 'W%';
    
-- GREATER THAN (>)

-- select all books released after the year 2000

SELECT
	title,
    released_year
FROM
	books
WHERE 
	released_year > 2000
ORDER BY
	released_year;
    
-- GREATER THAN OR EQUAL TO (>=)

SELECT
	title,
    released_year
FROM
	books
WHERE 
	released_year >= 2000
ORDER BY
	released_year;

-- TO select books which are in excess in stock to be given a discount. More than OR equal to 100 copies 

SELECT
	title,
    stock_quantity
FROM 
	books
WHERE
	stock_quantity >= 100
ORDER BY
	stock_quantity;
    
-- Boolean logic 1/0

SELECT 99>1;

SELECT 'A'>'a'; -- 0
SELECT 'A'>='a'; -- 1
SELECT 'A' = 'a'; -- 1
-- because MySQL is case insensitive

-- Less Than (<)

-- select books published before 2000

SELECT 
	title,
    released_year
FROM
	books
WHERE
	released_year < 2000
ORDER BY
	released_year;

-- <=

SELECT 
	title,
    released_year
FROM
	books
WHERE
	released_year <= 2000
ORDER BY
	released_year;
    
-- AND/&&

SELECT
	title
FROM
	books
WHERE
	author_lname = 'Eggers'
AND 
	released_year > 2010;
 
 -- Even && works
 
 SELECT
	title
FROM
	books
WHERE
	author_lname = 'Eggers'
&& 
	released_year > 2010;
 
 -- there is no limit on how many and we use
 
  SELECT
	title,
    author_lname,
    released_year
FROM
	books
WHERE
	author_lname = 'Eggers'
&& 
	released_year > 2010
AND
	title LIKE '%novel%';
    
-- logical OR (||)
-- any one should be true

  SELECT
	title,
    author_lname,
    released_year
FROM
	books
WHERE
	author_lname = 'Eggers'
||
	released_year > 2010;

 
 -- BETWEEN x AND y : includes x and y
 -- select all books published between 2004 and 2015
 
 SELECT
	title,
    released_year
FROM	
	books
WHERE
	released_year BETWEEN 2004 AND 2015;
    
-- NOT BETWEEN

SELECT 
	title,
    pages
FROM
	books
WHERE
	pages NOT BETWEEN 100 AND 500
ORDER BY 
	pages;


-- CAST()
-- '2017-05-02' : string

SELECT CAST('2017-05-02' AS DATETIME);

USE datatypes_test;

SELECT
	*
FROM
	people
WHERE
	birthdate BETWEEN '1980-01-01' AND '2000-01-01';
-- the above works fine, but its better to do it

SELECT
	*
FROM
	people
WHERE
	birthdate BETWEEN CAST('1980-01-01' AS DATETIME) AND 
					  CAST('2000-01-01' AS DATETIME);

-- IN and NOT IN
-- Select all books written by 'carver' or 'lahiri' or 'smith'
USE book_shop;

SELECT
	title, 
    author_lname
FROM
	books
WHERE
	author_lname IN ('Carver', 'Lahiri', 'Smith');

SELECT
	title, 
    released_year
FROM
	books
WHERE
	released_year >= 2000
AND
	released_year NOT IN (2001,2017);

-- %
-- MODULO OPERATOR

SELECT
	title, 
    released_year
FROM
	books
WHERE
	released_year >= 2000
AND
	released_year % 2 != 0
ORDER BY
	released_year;
    
-- CASE STATEMENTS
-- conditional based columns
--  CASE
-- 		WHEN THEN
--      ELSE
-- 	END
-- setting the genre era

SELECT 
	title,
    released_year,
    CASE 
		WHEN released_year >= 2000
			THEN 'Modern Lit'
		ELSE '20th Century Lit'
	END AS GENRE
FROM
	books;
    
-- STOck as *

SELECT
	title,
    stock_quantity,
    CASE
		WHEN stock_quantity BETWEEN 0 AND 50 
			THEN '*'
		WHEN stock_quantity BETWEEN 51 AND 100
			THEN '**'
		ELSE '***'
	END AS STOCK
FROM
	books;


