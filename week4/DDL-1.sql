CREATE TABLE csci601.employees (
    emp_no serial PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

INSERT INTO csci601.employees(first_name,last_name)
VALUES('John','Doe'),
      ('Mary','Jane');


SELECT * FROM csci601.employees;

DELETE FROM csci601.employees
WHERE emp_no = 2;

SELECT * FROM csci601.employees;

INSERT INTO csci601.employees(first_name,last_name)
VALUES('Jack','Lee');

SELECT * FROM csci601.employees;
/* PostgreSQL SERIAL sequences do not reuse deleted sequence numbers. The new row has emp_no 3. */

UPDATE csci601.employees
SET 
    first_name = 'Joe',
    emp_no = 1
WHERE
    emp_no = 3;
    
-- PostgreSQL will issue an error for duplicate primary key. Let's fix it.

UPDATE csci601.employees
SET 
    first_name = 'Joe',
    emp_no = 10
WHERE
    emp_no = 3;

SELECT * FROM csci601.employees;

INSERT INTO csci601.employees(first_name,last_name)
VALUES('Wang','Lee');

SELECT * FROM csci601.employees;

DELETE FROM csci601.employees;