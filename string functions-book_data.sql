DROP DATABASE IF EXISTS book_shop;

CREATE DATABASE book_shop;

USE book_shop;

CREATE TABLE books 
	(
		book_id INT NOT NULL AUTO_INCREMENT,
		title VARCHAR(100),
		author_fname VARCHAR(100),
		author_lname VARCHAR(100),
		released_year INT,
		stock_quantity INT,
		pages INT,
		PRIMARY KEY(book_id)
	);
 
INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);


DESC books;

SELECT * FROM books; 

-- CONCAT 
-- combine data fro cleaner output
-- SYNTAX : CONCAT(x,y,z)

SELECT 
	author_fname as 'first name',
    author_lname as 'last name',
    CONCAT(author_fname,' ', author_lname) as 'Full name'
FROM books;

-- CONCAT_WS
-- CONCAT with separator
-- SYNTAX : CONCAT_WS('separator',x,y,z)

SELECT
	CONCAT_WS('-', title, author_fname, author_lname)
FROM 
	books;
    
-- SUBSTRING
-- work with parts of strings
-- SYNTAX : SUBSTRING('string', start, no of characters)

SELECT SUBSTRING('HELLO WORLD',1,4);

SELECT SUBSTRING('HELLO WORLD',7); -- will output till last character

SELECT SUBSTRING('HELLO WORLD', -3);

-- First 10 characters of title
-- concat + substring
SELECT 
	CONCAT(SUBSTRING(title, 1, 10),'...') AS short_title
FROM books;

-- NOTE : SUBSTR() also works

-- REPLACE
-- replace parts of strings
-- SYNTAX : REPLACE( TEXT, 'what to remove', 'what to replace with')

SELECT REPLACE('Hello World', 'Hell', '@#$%') as replaced;

SELECT REPLACE(title, 'e', 3)
FROM books;

SELECT * FROM BOOKS;

-- Ctrl + / --> select n comment multipple lines

-- UPDATE + REPLACE

UPDATE books
SET title = REPLACE(title, 'e' ,3)
WHERE pages = 291;

SELECT *
FROM books
WHERE pages = 291;

-- REPLACE + SUBSTRING/SUBSTR
-- the first 10 char of title after replacing 'e' with '3'

SELECT
	SUBSTR(REPLACE(title, 'e', '3'),1,10) AS weird_title
FROM 
	books;


-- REVERSE
-- reverses strings
-- SYNTAX : REVERSE(text)

SELECT REVERSE(Title)
FROM books;

-- palindrome title

SELECT 
	CONCAT(title, REVERSE(title)) as PALINDROME_TITLE
FROM 
	books;
    

-- CHAR_LENGTH
-- counts characters in a string

SELECT CHAR_LENGTH('HELLO WORLD');

SELECT title, CHAR_LENGTH(title) AS Title_length
FROM books; 

-- 

SELECT 
	CONCAT(title, ' is ', CHAR_LENGTH(title), ' characters long') AS title_sentence

FROM
	books;
    
-- UPPER() AND LOWER()

SELECT UPPER('hello world');
SELECT LOWER('Hello World');

SELECT 
	CONCAT('My Favorite book is ',UPPER(title))
FROM books;



