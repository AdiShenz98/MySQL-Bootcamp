USE book_shop;

-- Q1. Evaluate the following
SELECT 1 in (5,3) || 9 BETWEEN 8 AND 10;

-- Q2. Select all books written before 1980

SELECT 
	title,
    released_year
FROM
	books
WHERE
	released_year < 1980;
    
-- Q3. Select all books written by Eggers or chabon

SELECT
	title,
    author_lname
FROM
	books
WHERE
	author_lname = 'Eggers' OR
    author_lname = 'Chabon';

-- Q4. Select all books written by Lahiri published after 2000

SELECT
	title,
    author_lname,
    released_year
FROM
	books
WHERE
	author_lname = 'Lahiri'
AND 	
	released_year > 2000;

-- Q5. Select all books where page count is between 100 and 200 pages

SELECT
	title,
    pages
FROM
	books
WHERE
	pages BETWEEN 100 AND 200;
    
-- Q6. Select all books where author_lname starts with a 'C'or as 'S'

SELECT
	author_lname
FROM
	books
WHERE
	author_lname LIKE 'C%'
OR
	author_lname LIKE 'S%';
    
-- Q7. 
    
SELECT
	title,
    author_lname,
    CASE
		WHEN title LIKE '%Stories%'
			THEN 'Short Stories'
		WHEN title = 'Just Kids' OR title = 'A Heartbreaking Work of Staggering genius'
			THEN 'Memoir'
		ELSE 'Novel'
	END AS 'TYPE'
FROM
	books;
  
-- Q8

SELECT 
	CONCAT(author_fname,' ',author_lname) AS AUTHOR,
    CASE
		WHEN COUNT(*) > 1
			THEN CONCAT(COUNT(*), ' books')
		ELSE '1 book'
	END as COUNT
FROM
	books
GROUP BY
	author_lname,
    author_fname
ORDER BY
	author_lname;