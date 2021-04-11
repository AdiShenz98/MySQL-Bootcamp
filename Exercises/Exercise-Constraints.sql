SELECT DATABASE();

CREATE TABLE Employees(
	id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    middle_name VARCHAR(20),
    age INT NOT NULL,
    current_status VARCHAR(20) NOT NULL DEFAULT 'employed',
    PRIMARY KEY(id)
);

DESC Employees;

INSERT INTO Employees (first_name, last_name, age) 
VALUES ('Dora', 'Smith', 58);

SELECT * FROM Employees;