/*
Drop MySQL foreign key constraints
To drop a foreign key constraint, you use the ALTER TABLE statement:

ALTER TABLE table_name 
DROP FOREIGN KEY constraint_name;

*/

-- To obtain the generated constraint name of a table, you use 
-- SHOW CREATE TABLE table_name;

-- CREATE TABLE products;
--
-- ALTER TABLE products
-- DROP FOREIGN KEY fk_category;
--
-- SHOW CREATE TABLE products;

/*
To define a UNIQUE constraint for a column when you create a table, you use this syntax:
CREATE TABLE table_name(
    ...,
    column_name data_type UNIQUE,
    ...
);

To define a UNIQUE  constraint for two or more columns, you use the following syntax:
CREATE TABLE table_name(
   ...
   column_name1 column_definition,
   column_name2 column_definition,
   ...,
   UNIQUE(column_name1,column_name2)
);

If you define a UNIQUE constraint without specifying a name, MySQL automatically generates a name for it. To define a UNIQUE constraint with a name, you use this syntax:

[CONSTRAINT constraint_name]
UNIQUE(column_list)
*/
CREATE TABLE suppliers (
    supplier_id serial,
    name VARCHAR(255) NOT NULL,
    phone VARCHAR(15) NOT NULL UNIQUE,
    address VARCHAR(255) NOT NULL,
    PRIMARY KEY (supplier_id),
    CONSTRAINT uc_name_address UNIQUE (name , address)
);

INSERT INTO suppliers(name, phone, address) 
VALUES( 'ABC Inc', 
       '(408)-908-2476',
       '4000 North 1st Street');

INSERT INTO suppliers(name, phone, address) 
VALUES( 'XYZ Corporation','(408)-908-2476','3000 North 1st Street'); -- Generates an error

INSERT INTO suppliers(name, phone, address) 
VALUES( 'XYZ Corporation','(408)-908-3333','3000 North 1st Street');

/*
To drop a UNIQUE constraint, you use can use DROP INDEX or ALTER TABLE statement:

DROP INDEX index_name ON table_name;

ALTER TABLE table_name
DROP INDEX index_name;
*/

-- SHOW INDEX FROM suppliers;
--
-- DROP INDEX uc_name_address ON suppliers;
--
-- SHOW INDEX FROM suppliers;

/*
The following ALTER TABLE ADD CONSTRAINT adds a unique constraint to a column of an existing table:
ALTER TABLE table_name
ADD CONSTRAINT constraint_name 
UNIQUE (column_list);
*/

ALTER TABLE suppliers
ADD CONSTRAINT uc_name_address 
UNIQUE (name,address);

-- SHOW INDEX FROM suppliers;