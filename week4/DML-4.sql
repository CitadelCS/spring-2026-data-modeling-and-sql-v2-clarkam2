/*
The AND operator is a logical operator that combines two or more Boolean expressions 
and returns true only if both expressions evaluate to true. 
The AND operator returns false if one of the two expressions evaluate to false.
*/

-- The following statement uses the AND operator to find customers who locate in California (CA), USA
SELECT customername, country, state
FROM customers
WHERE country = 'USA' AND state = 'CA';

-- Find the customers who locate in California, USA, and have the credit limit greater than 100K.
SELECT customername, country, state, creditlimit
FROM  customers
WHERE country = 'USA'
	AND state = 'CA'
	AND creditlimit > 100000;

/*
The PostgreSQL OR operator combines two Boolean expressions and returns true when either condition is true.
When you use more than one logical operator in an expression,
PostgreSQL always evaluates the OR operators after the AND operators.
This is called operator precedence which determines the order of evaluation of the operators.
PostgreSQL evaluates the operator with higher precedence first.
*/

-- Find the customers who locate in the USA or France
SELECT customername, country
FROM customers
WHERE country = 'USA' OR 
      country = 'France';
    
-- Find the customers who locate in the USA or France and have a credit limit greater than 100,000
SELECT customername, country, creditLimit
FROM customers
WHERE(country = 'USA'
		OR country = 'France')
	  AND creditlimit > 100000;

/*
If you do not use the parentheses, the query will return the customers who locate in the USA 
or the customers who locate in France with the credit limit greater than 10,000.
*/
SELECT customername, country, creditLimit
FROM customers
WHERE country = 'USA'
		OR country = 'France'
		AND creditlimit > 10000;