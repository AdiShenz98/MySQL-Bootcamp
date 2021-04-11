--  Reverse and Uppercase the following sentence
-- "Why does my cat look at me with such hatred?"

SELECT 
	REVERSE(UPPER("Why does my cat look at me with such hatred?")) as Reverse_Upper;
    
-- Q2
SELECT 
	replace
    ( CONCAT( 'I', ' ','like',' ','cats'),
    ' ',
    '-'
    ) as A2;
    
-- Q3 Replace spaces in titles with '->'

SELECT 
	REPLACE(title, ' ', '->') as Replaced_title
FROM
	books;
    
-- Q4

SELECT
	author_lname as forwards,
    REVERSE(author_lname) as backwards
FROM 
	books;

-- Q5 Fullname in caps

SELECT 
	UPPER(CONCAT(author_fname, ' ', author_lname)) as 'full name in caps'
FROM 
	books;

-- Q6 Print : 'title' was released in 'release_year'

SELECT 
	CONCAT(title, ' was released in ',released_year) as blurb
FROM
	books;
    
-- Q7 Print the book titles and the length of each title

SELECT
	title,
    CHAR_LENGTH(title) as 'character count'
FROM 
	books;
    
-- Q8

SELECT
	CONCAT(SUBSTR(title,1,10),'...') as 'short title',
    CONCAT_WS(',',author_lname,author_fname) as author,
    CONCAT(stock_quantity, ' in stock') as quantity
FROM 
	books;





