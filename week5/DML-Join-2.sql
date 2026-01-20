/*
INNER JOIN SYNTAX

SELECT 
     select_list
FROM 
     t1
INNER JOIN t2 ON join_condition;

*/

/* Suppose you want to get:
 - The productCode and productName from the products table.
 - The textDescription of product lines from the productlines table.
To do this, you need to select data from both tables by matching rows based on values in the 
productline column using the INNER JOIN clause as follows:
*/

SELECT productCode, productName, textDescription
FROM classicmodels.products t1 INNER JOIN classicmodels.productlines t2
    ON t1.productline = t2.productline;

-- alternative syntax
SELECT productCode, productName, textDescription
FROM classicmodels.products INNER JOIN classicmodels.productlines USING (productline);

-- Inner join for three tables
SELECT orderNumber, orderDate, orderLineNumber, productName, quantityOrdered, priceEach
FROM classicmodels.orders
	INNER JOIN classicmodels.orderdetails USING (orderNumber)
	INNER JOIN classicmodels.products USING (productCode)
ORDER BY orderNumber, orderLineNumber;

-- find sales price of the product whose code is S10_1678 that is less than the manufacturer’s suggested retail price (MSRP) for that product
SELECT orderNumber, productName, msrp, priceEach
FROM classicmodels.products p INNER JOIN classicmodels.orderdetails o
	ON p.productcode = o.productcode AND p.msrp > o.priceEach
WHERE p.productcode = 'S10_1678';

-- Inner join and group by
SELECT orderNumber, status, SUM(quantityOrdered * priceEach) total
FROM classicmodels.orders INNER JOIN classicmodels.orderdetails USING (orderNumber)
GROUP BY orderNumber;
