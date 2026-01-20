/*
MySQL join clauses 

MySQL supports the following types of joins:
- Inner join
- Left join
- Right join
- Cross join
To join tables, you use the cross join, inner join, left join, or right join clause 
for the corresponding type of join. The join clause is used in the SELECT statement appeared after the FROM clause.

Note that MySQL hasn’t supported the FULL OUTER JOIN yet.
*/

CREATE TABLE members (
    member_id serial,
    name VARCHAR(100),
    PRIMARY KEY (member_id)
);

CREATE TABLE committees (
    committee_id serial,
    name VARCHAR(100),
    PRIMARY KEY (committee_id)
);

INSERT INTO members(name)
VALUES('John'),('Jane'),('Mary'),('David'),('Amelia');

INSERT INTO committees(name)
VALUES('John'),('Mary'),('Amelia'),('Joe');

SELECT * FROM members;
SELECT * FROM committees;


-- Join Example 1
SELECT m.member_id, m.name, c.committee_id, c.name 
FROM members m right JOIN committees c ON c.name = m.name;

-- Join Example 2
SELECT productCode, productName, textDescription
FROM classicmodels.products t1 INNER JOIN classicmodels.productlines t2
    ON t1.productline = t2.productline;

-- Join Example 3 - Using clause
SELECT productCode, productName, textDescription
FROM classicmodels.products INNER JOIN classicmodels.productlines USING (productline);

-- Join 3 tables
SELECT orderNumber, orderDate, orderLineNumber, productName, quantityOrdered, priceEach
FROM classicmodels.orders INNER JOIN classicmodels.orderdetails USING (orderNumber)
	INNER JOIN classicmodels.products USING (productCode)
ORDER BY orderNumber, orderLineNumber;