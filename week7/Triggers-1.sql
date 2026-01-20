SET search_path TO classicmodels;

DROP TABLE IF EXISTS employees_audit;
DROP TRIGGER IF EXISTS before_employee_update ON employees;

CREATE TABLE employees_audit (
    id SERIAL PRIMARY KEY,
    employeeNumber INT NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    changedat DATE DEFAULT NULL,
    action VARCHAR(50) DEFAULT NULL
);

SELECT * FROM employees_audit;

/*
The trigger body can access the values of the column being affected by the DML statement.

To distinguish between the value of the columns BEFORE and AFTER the DML has fired, you use the NEW and OLD modifiers.

For example, if you update the column description, in the trigger body, you can access the value of the 
description before the update OLD.description and the new value NEW.description.

https://www.mysqltutorial.org/create-the-first-trigger-in-mysql.aspx 
*/

CREATE OR REPLACE FUNCTION rec_insert()
    RETURNS trigger AS
$$
BEGIN
    INSERT INTO employees_audit(employeeNumber,lastname,changedat,action)
    values (old.employeeNumber, old.lastname, NOW(), 'update');
    return new;
END;
$$
LANGUAGE 'plpgsql';

CREATE TRIGGER before_employee_update 
    BEFORE UPDATE ON employees
    FOR EACH ROW EXECUTE FUNCTION rec_insert();


-- PostgreSQL equivalent to show triggers:
-- SELECT * FROM information_schema.triggers WHERE event_object_table = 'employees';

UPDATE employees 
SET 
    lastName = 'Phan'
WHERE
    employeeNumber = 1056;


SELECT * FROM employees_audit;

-- ANOTHER TRIGGER EXAMPLE
CREATE TABLE billings (
    billingNo SERIAL,
    customerNo INT,
    billingDate DATE,
    amount DEC(10 , 2 ),
    PRIMARY KEY (billingNo)
);

CREATE OR REPLACE FUNCTION before_billing_update()
    RETURNS trigger AS
$$
BEGIN
    IF new.amount > old.amount * 10 THEN
        raise notice 'New amount cannot be 10 times greater than the current amount.';
    END IF;

    RETURN NEW;
END;
$$
LANGUAGE 'plpgsql';

CREATE TRIGGER before_billing_update_trigger
    BEFORE UPDATE ON billings
    FOR EACH ROW EXECUTE FUNCTION before_billing_update();

DROP TRIGGER IF EXISTS before_billing_update_trigger ON billings;

