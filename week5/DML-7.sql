/*
PostgreSQL alias for columns
SELECT
   [column_1 | expression] AS descriptive_name
FROM table_name;

To assign an alias to a column, you use the AS keyword followed by the alias.
If the alias contains spaces, you must quote it with double quotes:

SELECT
   [column_1 | expression] AS "descriptive name"
FROM
   table_name;
*/

SELECT CONCAT_WS(', ', lastName, firstname)
FROM classicmodels.employees;

SELECT CONCAT_WS(', ', lastName, firstname) AS "Full name"
FROM employees;

SELECT CONCAT_WS(', ', lastName, firstname) "Full name"
FROM employees
ORDER BY "Full name";

-- Table alias
SELECT e.firstName, e.lastName
FROM classicmodels.employees e
ORDER BY e.firstName;
    