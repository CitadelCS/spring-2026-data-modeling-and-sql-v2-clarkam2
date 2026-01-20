/*
The IN  operator allows you to determine if a specified value matches any value in a set of values or returned by a subquery.

The following illustrates the syntax of the IN  operator:
SELECT 
    column1,column2,...
FROM
    table_name
WHERE 
	(expr|column_1) IN ('value1','value2',...);
*/

-- find the offices that locate in the U.S. and France
SELECT officeCode, city, phone, country
FROM offices
WHERE country IN ('USA' , 'France');

-- To get offices that do not locate in USA and France, you use NOT IN  in the WHERE clause as follows:
SELECT officeCode, city, phone
FROM offices
WHERE country NOT IN ('USA' , 'France');

/*
The IN operator is often used with a subquery. 
Instead of providing a list of literal values, the subquery gets a list of values 
from one or more tables and uses them as the input values of the IN operator.
*/

-- Find the orders whose total values are greater than 60,000
SELECT orderNumber, customerNumber, status, shippedDate
FROM classicmodels.orders
WHERE orderNumber IN
(
	 SELECT orderNumber
	 FROM classicmodels.orderDetails
	 GROUP BY orderNumber
	 HAVING SUM(quantityOrdered * priceEach) > 60000
);

/* 
The BETWEEN operator is a logical operator that allows you to specify whether a value in a range or not. 
The BETWEEN operator is often used in the WHERE clause of the SELECT, UPDATE, and DELETE statements.
*/
-- find products whose buy prices between  90 and 100
SELECT productCode, productName, buyPrice
FROM classicmodels.products
WHERE buyPrice BETWEEN 90 AND 100;

-- To find the product whose buy price is not between $20 and $100, you combine the BETWEEN operator with the NOT operator as follows
SELECT productCode, productName, buyPrice
FROM classicmodels.products
WHERE buyPrice NOT BETWEEN 20 AND 100;

-- The following example returns the orders which have the required dates between 01/01/2003 to 01/31/2003
SELECT orderNumber, requiredDate, status
FROM classicmodels.orders
WHERE requireddate BETWEEN 
     CAST('2003-01-01' AS DATE) AND 
     CAST('2003-01-31' AS DATE);