-- LEFT Join

SELECT customers.customerNumber, customerName, orderNumber, status
FROM classicmodels.customers LEFT JOIN classicmodels.orders
	ON orders.customerNumber = customers.customerNumber;

-- Alternative syntax
SELECT customerNumber, customerName, orderNumber, status
FROM classicmodels.customers LEFT JOIN classicmodels.orders USING (customerNumber);

-- Find the customers who don't have any orders
SELECT c.customerNumber, c.customerName, o.orderNumber, o.status
FROM classicmodels.customers c LEFT JOIN classicmodels.orders o
    ON c.customerNumber = o.customerNumber
WHERE orderNumber IS NULL;


-- RIGHT Join

/*
The RIGHT JOIN returns all rows from the table employees whether rows in the table employees 
have matching values in the column salesRepEmployeeNumber of the table customers.
*/

SELECT employeeNumber, customerNumber
FROM classicmodels.customers RIGHT JOIN classicmodels.employees
    ON salesRepEmployeeNumber = employeeNumber
ORDER BY employeeNumber;

-- find the employees who are not in charge of any customers.
SELECT employeeNumber, customerNumber
FROM classicmodels.customers RIGHT JOIN classicmodels.employees ON
	salesRepEmployeeNumber = employeeNumber
WHERE customerNumber is NULL
ORDER BY employeeNumber;

-- SELF Join

/* Find the employees who have a manager */
-- https://www.mysqltutorial.org/mysql-self-join/
SELECT
    CONCAT(m.lastName, ', ', m.firstName) AS Manager,
    CONCAT(e.lastName, ', ', e.firstName) AS "Direct report"
FROM classicmodels.employees e INNER JOIN classicmodels.employees m
    ON m.employeeNumber = e.reportsTo
ORDER BY Manager;



