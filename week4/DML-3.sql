/*Using PostgreSQL WHERE clause with comparison operators
The following table shows the comparison operators that you can use to form the expression in the WHERE clause.

Operator	Description
=			Equal to. You can use it with almost any data types.
<> or !=	Not equal to
<			Less than. You typically use it with numeric and date/time data types.
>			Greater than.
<=			Less than or equal to
>=			Greater than or equal to

*/

-- The following query uses the not equal to (<>) operator to find all employees who are not the Sales Rep
SELECT lastname, firstname, jobtitle
FROM employees
WHERE jobtitle <> 'Sales Rep';

-- The following query finds employees whose office code is greater than 5:
SELECT lastname, firstname, officeCode
FROM employees
WHERE officecode > 5;

-- The following query returns employees with office code less than or equal 4 (<=4):
SELECT lastname, firstname, officeCode
FROM employees
WHERE officecode <= 4;

/*
When querying data from a table, you may get duplicate rows. 
In order to remove these duplicate rows, you use the DISTINCT clause in the SELECT statement.

Here is the syntax of the DISTINCT clause:
SELECT DISTINCT
    select_list
FROM
    table_name;
*/

-- First, query the last names of employees from the employees table using the following SELECT statement:
SELECT lastname
FROM employees
ORDER BY lastname;

-- This statement uses the DISTINCT clause to select unique last names from the employees table:
SELECT DISTINCT lastname
FROM employees
ORDER BY lastname;

/* If a column has NULL values and you use the DISTINCT clause for that column, 
PostgreSQL keeps only one NULL value because DISTINCT treats all NULL values as the same value. */

SELECT DISTINCT state
FROM customers;

/* You can use the DISTINCT clause with more than one column. 
In this case, PostgreSQL uses the combination of values in these columns to determine the uniqueness of the row in the result set.

For example, to get a unique combination of city and state from the customers table, you use the following query:*/
SELECT DISTINCT state, city
FROM customers
WHERE state IS NOT NULL
ORDER BY state, city;

/* You can use the DISTINCT clause with an aggregate function e.g., SUM, AVG, and COUNT, to remove duplicate rows before the aggregate functions are applied to the result set.

For example, to count the unique states of customers in the U.S., you use the following query:*/
SELECT COUNT(DISTINCT state)
FROM customers
WHERE country = 'USA';

/* In case you use the DISTINCT clause with the LIMIT clause, PostgreSQL immediately stops searching when it finds the number of unique rows specified in the LIMIT clause.

The following query selects the first five non-null unique states in the customers table. */
SELECT DISTINCT state
FROM customers
WHERE state IS NOT NULL
LIMIT 5;



