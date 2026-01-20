/*
A MySQL subquery is a query nested within another query such as SELECT, INSERT, UPDATE or DELETE. 
In addition, a subquery can be nested inside another subquery.

A MySQL subquery is called an inner query while the query that contains the subquery is called an outer query.
 A subquery can be used anywhere that expression is used and must be closed in parentheses.
*/

-- https://www.mysqltutorial.org/mysql-subquery/

-- Find all the employees who work in offices located in the USA.

SELECT  lastName, firstName
FROM classicmodels.employees
WHERE officeCode IN (
			SELECT  officeCode
			FROM classicmodels.offices
			WHERE country = 'USA');
            

-- Find the customer who has the maximum payment
SELECT customerNumber, checkNumber, amount
FROM classicmodels.payments
WHERE amount = (SELECT MAX(amount) FROM classicmodels.payments);

-- Find customers whose payments are greater than the average payment
SELECT  customerNumber, checkNumber, amount
FROM classicmodels.payments
WHERE amount > (
			SELECT AVG(amount)
			FROM classicmodels.payments);

/*
If a subquery returns more than one value, you can use other operators such as IN or NOT IN operator in the WHERE clause.
*/

-- Find the customers who have not placed any orders.
SELECT customerName
FROM classicmodels.customers
WHERE customerNumber NOT IN (
				SELECT DISTINCT customerNumber
				FROM classicmodels.orders);

/*
MySQL subquery in the FROM clause

When you use a subquery in the FROM clause, the result set returned from a subquery is used as a temporary table. 
This table is referred to as a derived table or materialized subquery.

*/

SELECT  MAX(items), MIN(items), FLOOR(AVG(items))
FROM (
				SELECT orderNumber, COUNT(orderNumber) AS items
				FROM classicmodels.orderdetails
				GROUP BY orderNumber) AS lineitems;

/*
	MySQL correlated subquery
    
    A correlated subquery is a subquery that uses the data from the outer query. 
    In other words, a correlated subquery depends on the outer query. 
    A correlated subquery is evaluated once for each row in the outer query.
*/

-- Find the products whose buy prices are greater than the average buy price of all products in each product line.
SELECT productname, buyprice
FROM classicmodels.products p1
WHERE
    buyprice > (SELECT AVG(buyprice)
        FROM classicmodels.products
        WHERE productline = p1.productline);

/* 
In the query above, The inner query executes for every product line because the product line is changed for every row. 
Hence, the average buy price will also change. 
The outer query filters only products whose buy price is greater than the average buy price per product line from the subquery.
*/

-- A more complex query
/*
Suppose you have to classify the customers  who bought products in 2003 into 3 groups: platinum, gold, and silver. And you need to know the number of customers in each group with the following conditions:

Platinum customers who have orders with the volume greater than 100K
Gold customers who have orders with the volume between 10K and 100K
Silver customers who have orders with the volume less than 10K
To construct this query, you first need to put each customer into the respective group using CASE expression and GROUP BY clause as follows:
*/

SELECT
    customerNumber,
    ROUND(SUM(quantityOrdered * priceEach)) sales,
    (CASE
        WHEN SUM(quantityOrdered * priceEach) < 10000 THEN 'Silver'
        WHEN SUM(quantityOrdered * priceEach) BETWEEN 10000 AND 100000 THEN 'Gold'
        WHEN SUM(quantityOrdered * priceEach) > 100000 THEN 'Platinum'
    END) customerGroup
FROM
    classicmodels.orderdetails
        INNER JOIN
    classicmodels.orders USING (orderNumber)
WHERE
    EXTRACT(YEAR FROM shippedDate) = 2003
GROUP BY customerNumber;

-- Then, you can use this query as the derived table and perform grouping as follows:
SELECT customerGroup, COUNT(cg.customerGroup) AS groupCount
FROM
    (SELECT 
        customerNumber,
            ROUND(SUM(quantityOrdered * priceEach)) sales,
            (CASE
                WHEN SUM(quantityOrdered * priceEach) < 10000 THEN 'Silver'
                WHEN SUM(quantityOrdered * priceEach) BETWEEN 10000 AND 100000 THEN 'Gold'
                WHEN SUM(quantityOrdered * priceEach) > 100000 THEN 'Platinum'
            END) customerGroup
    FROM
        classicmodels.orderdetails
    INNER JOIN classicmodels.orders USING (orderNumber)
    WHERE
        EXTRACT(YEAR FROM shippedDate) = 2003
    GROUP BY customerNumber) cg
GROUP BY cg.customerGroup;