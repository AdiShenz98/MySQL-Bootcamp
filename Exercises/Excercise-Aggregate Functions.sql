USE book_shop;

-- Q1. Prin the number of books in the database

SELECT
	COUNT(*)
FROM
	books;
    
-- Q2. How many books were released in each year

SELECT
	released_year,
    COUNT(*)
FROM 
	books
GROUP BY 
	released_year;

-- Q3. Print out the total number of books in stock

SELECT
	SUM(stock_quantity)
FROM
	books;
    
-- Q4. Average released year for each author

SELECT
	author_fname,
    author_lname,
    AVG(released_year)
FROM
	books
GROUP BY
	author_fname,
    author_lname;

-- Q5. full name of the author who wrote the longest book

SELECT
	CONCAT(author_fname,' ',author_lname) as Author,
    pages
FROM
	books
ORDER BY 	
	pages DESC
Limit 1;

-- Q6

SELECT 	
	released_year AS year,
    COUNT(*) AS '# books',
    AVG(pages) AS 'avg pages'
FROM
	books
GROUP BY
	released_year
ORDER BY
	released_year;