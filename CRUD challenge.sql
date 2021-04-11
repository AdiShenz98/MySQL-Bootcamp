-- Sring Cleaning : The Annual Closet inventory
CREATE DATABASE shirts_db;

USE shirts_db;

SELECT database();

CREATE TABLE shirts(
	shirt_id INT NOT NULL AUTO_INCREMENT,
    article VARCHAR(30),
    color VARCHAR(30),
    shirt_size VARCHAR(5),
    last_worn INT,
    PRIMARY KEY(shirt_id)
);


INSERT INTO shirts
(article, color, shirt_size, last_worn)
VALUES ('t-shirt', 'white', 'S', 10),
('t-shirt', 'green', 'S', 200),
('polo shirt', 'black', 'M', 10),
('tank top', 'blue', 'S', 50),
('t-shirt', 'pink', 'S', 0),
('polo shirt', 'red', 'M', 5),
('tank top', 'white', 'S', 200),
('tank top', 'blue', 'M', 15);

-- Add A New Shirt : Purple polo shirt, size M last worn 50 days ago

INSERT INTO shirts( article, color, shirt_size, last_worn) 
VALUES('polo shirt', 'purple', 'M', 50);

-- SELECT all shirts : But Only Print Out Article and Color

SELECT article, color 
FROM shirts;

-- SELECT all medium shirts : Print Out Everything But shirt_id

SELECT article, color, shirt_size, last_worn
FROM shirts
WHERE shirt_size = 'M';

-- Update all polo shirts : Change their size to L

SELECT * FROM shirts
WHERE article = 'polo shirt';

UPDATE shirts
SET shirt_size = 'L'
WHERE article = 'polo shirt';

-- Update the shirt last worn 15 days ago : Change last_worn to 0

SELECT *
FROM shirts 
WHERE last_worn = 15;

UPDATE shirts
SET last_worn = 0
WHERE last_worn = 15;

-- Update all white shirts : Change size to 'XS' and color to 'off white'

SELECT * 
FROM shirts
WHERE color = 'white';

UPDATE shirts
SET color = 'Off white'
WHERE color = 'white';

UPDATE shirts
SET shirt_size = 'XS'
WHERE color = 'off white';

SELECT * 
FROM shirts
WHERE color = 'off white';

-- Delete all old shirts : Last worn 200 days ago

SELECT *
FROM shirts
WHERE last_worn = 200;

DELETE FROM shirts
WHERE LAST_WORN = 200;

-- Delete all tank tops

SELECT * FROM shirts
WHERE article = 'tank top';

DELETE FROM shirts
WHERE article = 'tank top';

-- Delete all shirts

SELECT * FROM shirts;

DELETE FROM shirts;

-- Drop the entire shirts table

DROP TABLE shirts;

SHOW TABLES;
    