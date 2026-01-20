/*
The aggregate functions allow you to perform the calculation of a set of rows and return a single value. 
The GROUP BY clause is often used with an aggregate function to perform calculation and return a single value for each subgroup.

For example, if you want to know the number of orders in each status, you can use the COUNT function with the GROUP BY clause as follows:
*/

SELECT  status, COUNT(*)
FROM classicmodels.orders
GROUP BY status;

/*
To get the total amount of all orders by status, you join the orders table with the orderdetails table and 
use the SUM function to calculate the total amount. See the following query:
*/

SELECT status, SUM(quantityOrdered * priceEach) AS amount
FROM classicmodels.orders INNER JOIN classicmodels.orderdetails USING (orderNumber)
GROUP BY  status;

-- The following query returns the order numbers and the total amount of each order.
SELECT orderNumber, SUM(quantityOrdered * priceEach) AS total
FROM classicmodels.orderdetails
GROUP BY  orderNumber;

-- In addition to columns, you can group rows by expressions. The following query gets the total sales for each year.
SELECT EXTRACT(YEAR FROM orderDate) AS year, SUM(quantityOrdered * priceEach) AS total
FROM classicmodels.orders INNER JOIN classicmodels.orderdetails USING (orderNumber)
WHERE status = 'Shipped'
GROUP BY  EXTRACT(YEAR FROM orderDate);

/*
To filter the groups returned by GROUP BY clause, you use a  HAVING clause. 
The following query uses the HAVING clause to select the total sales of the years after 2003.
*/

SELECT  EXTRACT(YEAR FROM orderDate) AS year, SUM(quantityOrdered * priceEach) AS total
FROM classicmodels.orders INNER JOIN classicmodels.orderdetails  USING (orderNumber)
WHERE status = 'Shipped'
GROUP BY year
HAVING  year > 2003;

-- get order numbers, the number of items sold per order, and total sales for each with total sales greater than 1000
SELECT ordernumber, SUM(quantityOrdered) AS itemsCount, SUM(priceeach*quantityOrdered) AS total
FROM classicmodels.orderdetails
GROUP BY  ordernumber
HAVING  total > 1000;

-- find orders that have total amounts greater than 1000 and contain more than 600 items:
SELECT ordernumber, SUM(quantityOrdered) AS itemsCount, SUM(priceeach*quantityOrdered) AS total
FROM classicmodels.orderdetails
GROUP BY ordernumber
HAVING  total > 1000 AND  itemsCount > 600;

-- find all orders that are in shipped status and have the total amount greater than 1500
SELECT orders.ordernumber, status,  SUM(priceeach*quantityOrdered) total
FROM classicmodels.orderdetails  INNER JOIN classicmodels.orders ON orderdetails.ordernumber = orders.ordernumber
GROUP BY ordernumber,  status
HAVING  status = 'Shipped' 
	AND  total > 1500;

