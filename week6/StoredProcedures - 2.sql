SET search_path TO classicmodels;

/* PostgreSQL Stored Functions (equivalent to MySQL Stored Procedures) */

-- VARIABLES IN STORED FUNCTIONS

CREATE OR REPLACE FUNCTION GetTotalOrder()
RETURNS INT AS $$
DECLARE
	totalOrder INT DEFAULT 0;
BEGIN
    SELECT COUNT(*)
    INTO totalOrder
    FROM orders;

    RETURN totalOrder;
END;
$$ LANGUAGE plpgsql;

SELECT GetTotalOrder() AS total_orders;


-- PostgreSQL simple IF-THEN statement

CREATE OR REPLACE FUNCTION GetCustomerLevel(pCustomerNumber INT)
RETURNS VARCHAR(20) AS $$
DECLARE
    credit DECIMAL(10,2) DEFAULT 0;
    pCustomerLevel VARCHAR(20);
BEGIN
    SELECT creditLimit
    INTO credit
    FROM customers
    WHERE customerNumber = pCustomerNumber;

    IF credit > 50000 THEN
        pCustomerLevel := 'PLATINUM';
    END IF;

    RETURN pCustomerLevel;
END;
$$ LANGUAGE plpgsql;

SELECT GetCustomerLevel(141) AS customer_level;

-- PostgreSQL IF-THEN-ELSE statement
DROP FUNCTION IF EXISTS GetCustomerLevel(INT);

CREATE OR REPLACE FUNCTION GetCustomerLevel(pCustomerNumber INT)
RETURNS VARCHAR(20) AS $$
DECLARE
    credit DECIMAL DEFAULT 0;
    pCustomerLevel VARCHAR(20);
BEGIN
    SELECT creditLimit
    INTO credit
    FROM customers
    WHERE customerNumber = pCustomerNumber;

    IF credit > 50000 THEN
        pCustomerLevel := 'PLATINUM';
    ELSE
        pCustomerLevel := 'NOT PLATINUM';
    END IF;

    RETURN pCustomerLevel;
END;
$$ LANGUAGE plpgsql;

SELECT GetCustomerLevel(447) AS customer_level;

-- PostgreSQL IF-THEN-ELSEIF-ELSE statement
DROP FUNCTION IF EXISTS GetCustomerLevel(INT);

CREATE OR REPLACE FUNCTION GetCustomerLevel(pCustomerNumber INT)
RETURNS VARCHAR(20) AS $$
DECLARE
    credit DECIMAL DEFAULT 0;
    pCustomerLevel VARCHAR(20);
BEGIN
    SELECT creditLimit
    INTO credit
    FROM customers
    WHERE customerNumber = pCustomerNumber;

    IF credit > 50000 THEN
        pCustomerLevel := 'PLATINUM';
    ELSIF credit <= 50000 AND credit > 10000 THEN
        pCustomerLevel := 'GOLD';
    ELSE
        pCustomerLevel := 'SILVER';
    END IF;

    RETURN pCustomerLevel;
END;
$$ LANGUAGE plpgsql;

SELECT GetCustomerLevel(447) AS customer_level;

-- PostgreSQL CASE Statement

CREATE OR REPLACE FUNCTION GetCustomerShipping(pCustomerNumber INT)
RETURNS VARCHAR(50) AS $$
DECLARE
    customerCountry VARCHAR(100);
    pShipping VARCHAR(50);
BEGIN
    SELECT country
    INTO customerCountry
    FROM customers
    WHERE customerNumber = pCustomerNumber;

    CASE customerCountry
        WHEN 'USA' THEN
           pShipping := '2-day Shipping';
        WHEN 'Canada' THEN
           pShipping := '3-day Shipping';
        ELSE
           pShipping := '5-day Shipping';
    END CASE;

    RETURN pShipping;
END;
$$ LANGUAGE plpgsql;

SELECT GetCustomerShipping(112) AS shipping_method;
