-- Aggregate Functions
USE book_shop;

-- COUNT

-- How many databases are there in the database

SELECT 	COUNT(*)
FROM books;

-- How many unique author_fnames are there

SELECT COUNT(DISTINCT author_fname)
FROM books;

-- How many unique authors are there

SELECT
	COUNT(DISTINCT author_fname,author_lname) AS Distinct_authors
FROM
	books;
    
-- How many titles contain 'the'

SELECT
	COUNT(title) AS title_with_the
FROM
	books
WHERE
	title LIKE '%the%';
    
-- GROUP BY
-- summarizes or aggreageates identical data into single rows

SELECT
	author_lname,
    COUNT(*)
FROM
	books
GROUP BY
	author_lname
;

SELECT
	author_lname,
    COUNT(*)
FROM
	books
GROUP BY
	author_lname
ORDER BY
	2 DESC;
    
SELECT
	author_fname,
	author_lname,
    COUNT(*)
FROM
	books
GROUP BY
	author_fname,
    author_lname;
    
SELECT
	CONCAT('In ',released_year,' ', COUNT(*), ' book(s) released')
FROM
	books
GROUP BY
	released_year;
    
-- MIN and MAX

SELECT
	MIN(released_year)
FROM
	books;

SELECT
	MAX(pages)
FROM
	books;
    
-- title of the longest book
-- using subqueries

SELECT 
	title,
    pages
FROM books
WHERE pages = (SELECT MAX(pages)
				FROM books);
 
-- using subqueries takes more time
-- Alternative

SELECT
	title,
    pages
FROM
	books
ORDER BY
	pages DESC
LIMIT 
	1;
 
-- Using MIN/MAX with GROUP BY

-- find the year that each author published their first book

SELECT
	author_fname,
    author_lname,
    MIN(released_year) AS first_book_published_on
FROM
	books
GROUP BY
	author_fname,
    author_lname;
    
-- find the longest page count for each author

SELECT
	author_fname,
    author_lname,
    MAX(pages) as longest_page_count
FROM 
	books
GROUP BY
	author_fname,
    author_lname;

SELECT
  CONCAT(author_fname, ' ', author_lname) AS author,
  MAX(pages) AS 'longest book'
FROM books
GROUP BY author_lname,
         author_fname;
         
-- SUM
-- adds things together

-- sum all pages in the entire database

SELECT
	SUM(pages)
FROM
	books;
    
-- sum all pages each author has written

SELECT 
	CONCAT(author_fname,' ',author_lname) AS author,
    SUM(pages) AS Sum_of_pages
FROM
	books
GROUP BY
	author_fname,
    author_lname;
    
-- AVG function

SELECT
	AVG(pages)
FROM
	books;

-- CALCULATE the average stock quantity for books released in the same year

SELECT
	released_year,
    AVG(stock_quantity)
FROM 
	books
GROUP BY
	released_year;

-- average pages by each author

SELECT
	CONCAT(author_fname,' ',author_lname) AS author,
    AVG(pages)
FROM 
	books
GROUP BY 
	author_fname,
    author_lname;
    
    

