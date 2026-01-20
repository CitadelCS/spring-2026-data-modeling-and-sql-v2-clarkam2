/*
The WHERE clause allows you to specify a search condition for the rows returned by a query. The following shows the syntax of the WHERE clause:
SELECT 
    select_list
FROM
    table_name
WHERE
    search_condition;
*/

-- Find all employees whose job titles are Sales Rep
SELECT 
    lastname, 
    firstname, 
    jobtitle
FROM
    employees
WHERE
    jobtitle = 'Sales Rep';

-- find employees whose job titles are Sales Rep and office codes are 1
SELECT 
    lastname, 
    firstname, 
    jobtitle,
    officeCode
FROM
    employees
WHERE
    jobtitle = 'Sales Rep' AND 
    officeCode = 1;

-- finds employees whose job title is Sales Rep or employees who locate the office with office code 1
SELECT 
    lastName, 
    firstName, 
    jobTitle, 
    officeCode
FROM
    employees
WHERE
    jobtitle = 'Sales Rep' OR 
    officeCode = 1
ORDER BY 
    officeCode , 
    jobTitle;

/*
The BETWEEN operator returns TRUE if a value is in a range of values:
expression BETWEEN low AND high
*/
-- finds employees who locate in offices whose office code is from 1 to 3:
SELECT 
    firstName, 
    lastName, 
    officeCode
FROM
    employees
WHERE
    officeCode BETWEEN 1 AND 3
ORDER BY officeCode;

/* 
The LIKE operator evaluates to TRUE if a value matches a specified pattern. 
To form a pattern, you use % and _ wildcards. The % wildcard matches any string of zero or more characters 
while the _ wildcard matches any single character.
*/
-- This query finds employees whose last names end with the string 'son'.
SELECT 
    firstName, 
    lastName
FROM
    employees
WHERE
    lastName LIKE '%son'
ORDER BY firstName;

/*
The IN operator returns TRUE if a value matches any value in a list.
value IN (value1, value2,...)
*/
-- The following example uses the WHERE clause with the IN operator to find employees who locate in the office with office code 1.
SELECT 
    firstName, 
    lastName, 
    officeCode
FROM
    employees
WHERE
    officeCode IN (1 , 2, 3)
ORDER BY 
    officeCode;

/* 
The IS NULL operator returns TRUE if a value is NULL.
This statement uses the WHERE clause with the IS NULL operator to get the row whose value in the reportsTo column is NULL
*/

SELECT 
    lastName, 
    firstName, 
    reportsTo
FROM
    employees
WHERE
    reportsTo IS NULL;
