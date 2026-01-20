/*
The SELECT statement allows you to read data from one or more tables. To write a SELECT statement in PostgreSQL, you follow this syntax:
SELECT select_list
FROM table_name;
*/

-- Find the last names of all employees
SELECT lastName
FROM employees;

-- Find the first name, last name, and job title of employees
SELECT lastname, firstname, jobtitle
FROM employees;

-- Display all the data for all the employees
SELECT * 
FROM employees;

/*
To sort the result set, you add the ORDER BY clause to the SELECT statement. 
The following illustrates the syntax of the ORDER BY  clause:
SELECT 
   select_list
FROM 
   table_name
ORDER BY 
   column1 [ASC|DESC], 
   column2 [ASC|DESC],
   ...;
   
ASC - Ascending Order
DESC - Descending Order

If you want to sort the result set by multiple columns, you specify a comma-separated list of columns in the ORDER BY clause:
ORDER BY
   column1,
   column2;

It is possible to sort the result by a column in ascending order, and then by another column in descending order:
ORDER BY
    column1 ASC,
    column2 DESC;
*/

-- Sort the customers by the values in the contactLastName column in ascending order.
SELECT
	contactLastname,
	contactFirstname
FROM
	csci601.customers
ORDER BY
	contactLastname;

-- Sort customers by the last name in the descending order
SELECT
	contactLastname,
	contactFirstname
FROM
	customers
ORDER BY
	contactLastname DESC;

-- Sort the customers by the last name in descending order and then by the first name in ascending order
SELECT
	contactLastname,
	contactFirstname
FROM
	customers
ORDER BY
	contactLastname DESC,
	contactFirstname ASC;

-- The following query selects the order line items from the orderdetails table. It calculates the subtotal for each line item and sorts the result set based on the subtotal.
SELECT 
    orderNumber, 
    orderlinenumber, 
    quantityOrdered * priceEach
FROM
    orderdetails
ORDER BY 
   quantityOrdered * priceEach DESC;

/* To make the query more readable, you can assign the expression in the SELECT clause 
a column alias and use that column alias in the ORDER BY clause as shown in the following query. 
*/
SELECT 
    orderNumber,
    orderLineNumber,
    quantityOrdered * priceEach AS subtotal
FROM
    orderdetails
ORDER BY subtotal DESC;

-- The ORDER BY clause allows you to sort data using a custom list by using a CASE statement.
/*
Suppose that you want to sort the sales orders based on their statuses in the following order:
In Process
On Hold
Cancelled
Resolved
Disputed
Shipped
*/
SELECT
    orderNumber,
    status
FROM
    orders
ORDER BY
    CASE status
        WHEN 'In Process' THEN 1
        WHEN 'On Hold' THEN 2
        WHEN 'Cancelled' THEN 3
        WHEN 'Resolved' THEN 4
        WHEN 'Disputed' THEN 5
        WHEN 'Shipped' THEN 6
        ELSE 7
    END;

