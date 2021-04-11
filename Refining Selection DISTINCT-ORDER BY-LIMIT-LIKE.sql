USE book_shop;

INSERT INTO books
    (title, author_fname, author_lname, released_year, stock_quantity, pages)
    VALUES ('10% Happier', 'Dan', 'Harris', 2014, 29, 256), 
           ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
           ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);

-- DISTINCT

SELECT 
	DISTINCT author_lname
FROM 
	books;

SELECT 
	DISTINCT CONCAT(author_fname,' ',author_lname) as Distinct_authors
FROM
	books;
 
-- Unique column combination
SELECT
	DISTINCT author_fname, author_lname
FROM 
	books;
    
-- ORDER BY
-- 	Sorting our data

SELECT 
	author_lname 
FROM 
	books
ORDER BY
	author_lname; -- by default it is ascending
    
-- Num < letter
-- DESC 

SELECT
	title
FROM 
	books
ORDER BY 
	title DESC;

SELECT
	title,
	released_year
FROM 
	books
ORDER BY 
	released_year DESC;

-- ORDER BY column_pos
SELECT
	title,
    pages,
    released_year
FROM 
	books
ORDER BY 
	2; -- here it orders by pages
    
-- ORDER BY multiple columns

SELECT 
	author_fname,
    author_lname
FROM 
	books
ORDER BY
	author_lname,
    author_fname;
    
-- Using LIMIT

SELECT 
	title
FROM 
	books
LIMIT 
	5;

-- Five most recently released books

SELECT 
	*
FROM 
	books
ORDER BY 
	released_year DESC
LIMIT 
	5;

-- LIMIT x,y
-- x:starting point ; y:how many to return from that starting point

SELECT
	title,
    released_year
FROM 
	books
ORDER BY
	released_year DESC
LIMIT 
	2,6;

-- books from 5 to the end

SELECT
	title,
    released_year
FROM 
	books
ORDER BY
	released_year DESC
LIMIT 
	5,23741924819248; -- some random large number as second parameter
    
-- LIKE 
-- _ : single character
-- % : any no of characters

-- authors name starting with da
SELECT 
	title,
    author_fname
FROM 
	books
WHERE
	author_fname LIKE 'da%';

-- books with title including 'the'

SELECT
	title,
    author_fname
FROM
	books
WHERE
	title LIKE '%the%';
    
-- stock quantity is four digit long

SELECT
	title,
    stock_quantity
FROM
	books
WHERE
	stock_quantity LIKE '____';
    
-- what if we wanna search '%'or '_'
-- then we use an escape character '\'

SELECT
	title
FROM
	books
WHERE
	title like '%\%%';

SELECT
	title
FROM
	books
WHERE
	title like '%\_%';