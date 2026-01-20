/*
The LIKE operator is a logical operator that tests whether a string contains a specified pattern or not. 
The LIKE operator is used in the WHERE clause of the SELECT , DELETE, and UPDATE statements to filter data based on patterns.

PostgreSQL provides two wildcard characters for constructing patterns: percentage % and underscore _ .

The percentage ( % ) wildcard matches any string of zero or more characters.
The underscore ( _ ) wildcard matches any single character.
*/

-- find employees whose first names start with a
SELECT employeeNumber, lastName, firstName
FROM classicmodels.employees
WHERE firstName LIKE 'a%';

-- find employees whose last names end with on e.g., Patterson, Thompson
SELECT employeeNumber, lastName, firstName
FROM classicmodels.employees
WHERE lastName LIKE '%on';

-- find all employees whose last names contain on , you use the following query with the pattern %on%
SELECT employeeNumber, lastName, firstName
FROM classicmodels.employees
WHERE lastname LIKE '%on%';

-- find employees whose first names start with  T , end with m
SELECT employeeNumber, lastName, firstName
FROM classicmodels.employees
WHERE firstname LIKE 'T_m';

-- search for employees whose last names don’t start with the character B
SELECT employeeNumber, lastName, firstName
FROM classicmodels.employees
WHERE lastName NOT LIKE 'B%';

-- find products whose product codes contain the string _20
SELECT productCode, productName
FROM classicmodels.products
WHERE productCode LIKE '%\_20%';

-- or
SELECT productCode, productName
FROM classicmodels.products
WHERE productCode LIKE '%$_20%' ESCAPE '$';

/*
The LIMIT clause is used in the SELECT statement to constrain the number of rows to return. The LIMIT clause accepts one or two arguments. The values of both arguments must be zero or positive integers.

The following illustrates the LIMIT clause syntax with two arguments:
SELECT 
    select_list
FROM
    table_name
LIMIT [offset,] row_count;
*/

SELECT customerNumber, customerName, creditLimit
FROM classicmodels.customers
ORDER BY creditLimit DESC
LIMIT 5;

-- Using PostgreSQL LIMIT for pagination

SELECT customerNumber, customerName
FROM classicmodels.customers
ORDER BY customerName    
LIMIT 10;

SELECT customerNumber, customerName
FROM classicmodels.customers
ORDER BY customerName    
LIMIT 10;