CREATE TABLE csci601.vehicles (
    vehicleId INT,
    year INT NOT NULL,
    make VARCHAR(100) NOT NULL,
    PRIMARY KEY(vehicleId)
);

SELECT * FROM information_schema.columns where table_name = 'employees';
/*
Add a column to a table

ALTER TABLE table_name
ADD 
    new_column_name column_definition
    [FIRST | AFTER column_name]
*/

ALTER TABLE csci601.vehicles
ADD model VARCHAR(100) NOT NULL;

SELECT * FROM csci601.vehicles;

/*
Add multiple columns to a table
ALTER TABLE table_name
    ADD new_column_name column_definition
    [FIRST | AFTER column_name],
    ADD new_column_name column_definition
    [FIRST | AFTER column_name],
    ...;
*/

ALTER TABLE csci601.vehicles
ADD color VARCHAR(50),
ADD note VARCHAR(255);

SELECT *
FROM
    information_schema.columns
WHERE
        table_name = 'vehicles';

/*
Modify a column
ALTER TABLE table_name
MODIFY column_name column_definition
[ FIRST | AFTER column_name];
*/

ALTER TABLE csci601.vehicles alter column note set data type VARCHAR(100);
ALTER TABLE csci601.vehicles alter column note set not null;

SELECT *
FROM
    information_schema.columns
WHERE
        table_name = 'vehicles';

-- MODIFY MULTIPLE COLUMNS
/*
ALTER TABLE table_name
    MODIFY column_name column_definition
    [ FIRST | AFTER column_name],
    MODIFY column_name column_definition
    [ FIRST | AFTER column_name],
    ...;
*/
-- ALTER TABLE vehicles
-- MODIFY year SMALLINT NOT NULL,
-- MODIFY color VARCHAR(20) NULL AFTER make;

SELECT *
FROM
    information_schema.columns
WHERE
        table_name = 'vehicles';

/*
MySQL ALTER TABLE – Rename a column in a table
ALTER TABLE table_name
    CHANGE COLUMN original_name new_name column_definition
    [FIRST | AFTER column_name];
*/

-- ALTER TABLE csci601.vehicles
-- alter COLUMN note vehicleCondition VARCHAR(100) NOT NULL;

SELECT *
FROM
    information_schema.columns
WHERE
        table_name = 'vehicles';

/*
MySQL ALTER TABLE – Drop a column
ALTER TABLE table_name
DROP COLUMN column_name;
*/

ALTER TABLE csci601.vehicles
DROP COLUMN vehicleCondition;

SELECT *
FROM
    information_schema.columns
WHERE
        table_name = 'vehicles';

/*
MySQL ALTER TABLE – Rename table
ALTER TABLE table_name
RENAME TO new_table_name;
*/

ALTER TABLE csci601.vehicles
RENAME TO cars;

SELECT *
FROM
    information_schema.columns
WHERE
        table_name = 'vehicles';
SELECT *
FROM
    information_schema.columns
WHERE
        table_name = 'cars';


