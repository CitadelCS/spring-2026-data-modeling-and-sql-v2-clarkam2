SET search_path TO classicmodels;

/* PostgreSQL Stored Functions (equivalent to MySQL Stored Procedures) */

CREATE OR REPLACE FUNCTION GetCustomers()
RETURNS TABLE(
    customerName VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    postalCode VARCHAR(15),
    country VARCHAR(50)
) AS $$
BEGIN
	RETURN QUERY
	SELECT c.customerName, c.city, c.state, c.postalCode, c.country
	FROM customers c
	ORDER BY c.customerName;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM GetCustomers();

/* PostgreSQL uses $$ delimiters by default for function bodies.
No need to change delimiters like in MySQL. */

CREATE OR REPLACE FUNCTION GetEmployees()
RETURNS TABLE(
    firstName VARCHAR(50),
    lastName VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(50)
) AS $$
BEGIN
    RETURN QUERY
    SELECT e.firstName, e.lastName, o.city, o.state, o.country
    FROM employees e INNER JOIN offices o USING (officeCode);
END;
$$ LANGUAGE plpgsql;

DROP FUNCTION IF EXISTS GetEmployees();


-- In PostgreSQL, parameters are IN by default, and you can return tables or single values.
-- PostgreSQL doesn't have OUT/INOUT parameters exactly like MySQL, but you can return values.

-- EXAMPLE WITH IN PARAMETER
CREATE OR REPLACE FUNCTION GetOfficeByCountry(
	countryName VARCHAR(255)
)
RETURNS TABLE(
    officeCode VARCHAR(10),
    city VARCHAR(50),
    phone VARCHAR(50),
    addressLine1 VARCHAR(50),
    addressLine2 VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(50),
    postalCode VARCHAR(15),
    territory VARCHAR(10)
) AS $$
BEGIN
	RETURN QUERY
	SELECT o.officeCode, o.city, o.phone, o.addressLine1, o.addressLine2,
           o.state, o.country, o.postalCode, o.territory
 	FROM offices o
	WHERE o.country = countryName;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM GetOfficeByCountry('USA');

-- EXAMPLE RETURNING A VALUE (equivalent to OUT parameter)
CREATE OR REPLACE FUNCTION GetOrderCountByStatus (
	orderStatus VARCHAR(25)
)
RETURNS INT AS $$
DECLARE
	total INT;
BEGIN
	SELECT COUNT(orderNumber)
	INTO total
	FROM orders
	WHERE status = orderStatus;

	RETURN total;
END;
$$ LANGUAGE plpgsql;

-- Call function and get result directly
SELECT GetOrderCountByStatus('Shipped') AS total_shipped;

-- EXAMPLE MODIFYING A VALUE (equivalent to INOUT parameter)
-- PostgreSQL approach: return the modified value
CREATE OR REPLACE FUNCTION SetCounter(
	counter INT,
    inc INT
)
RETURNS INT AS $$
BEGIN
	RETURN counter + inc;
END;
$$ LANGUAGE plpgsql;

-- PostgreSQL approach to simulate the MySQL behavior:
-- You would typically use variables or a session table for persistent state
DO $$
DECLARE
    counter_val INT := 1;
BEGIN
    counter_val := SetCounter(counter_val, 1); -- 2
    RAISE NOTICE 'Counter: %', counter_val;

    counter_val := SetCounter(counter_val, 1); -- 3
    RAISE NOTICE 'Counter: %', counter_val;

    counter_val := SetCounter(counter_val, 5); -- 8
    RAISE NOTICE 'Counter: %', counter_val;
END $$;

