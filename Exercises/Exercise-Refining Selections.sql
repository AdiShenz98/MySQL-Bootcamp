USE book_shop;
DESC books;
-- Q1. Titles that contains 'stories'

SELECT
	title
FROM
	books
WHERE
	title LIKE '%stories%';
    
-- Q2. Title and page count of longest book

SELECT
	title,
    pages
FROM
	books
ORDER BY
	pages DESC
LIMIT 
	1;
    
-- Q3. Print a summary containing the title and year, for the 3 most recent books

SELECT
	CONCAT_WS('-',title,released_year) as  summary
FROM
	books
ORDER BY 
	released_year DESC 
LIMIT 3;

-- Q4. Find all books with an author_lname that contains a space(" ")

SELECT
	title,
    author_lname
FROM
	books
WHERE 
	author_lname LIKE '% %';

-- Q5. Find the three books with the lowest stock

SELECT
	title,
    released_year,
    stock_quantity
FROM 
	books
ORDER BY
	stock_quantity
LIMIT 3;

-- Q6. Title and author_lname, sorted first by author_lname and then by title

SELECT 
	title,
    author_lname
FROM
	books
ORDER BY
	author_lname,
    title;
    
-- Q7

SELECT
	UPPER(CONCAT('MY FAVORITE AUTHOR IS ',author_fname,' ',author_lname,'!')) AS yell
FROM
	books
ORDER BY
	author_lname;