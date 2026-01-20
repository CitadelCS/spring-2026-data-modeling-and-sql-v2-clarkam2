/*
PostgreSQL FOREIGN KEY syntax

[CONSTRAINT constraint_name]
FOREIGN KEY [foreign_key_name] (column_name, ...)
REFERENCES parent_table(colunm_name,...)
[ON DELETE reference_option]
[ON UPDATE reference_option]

PostgreSQL has several reference options: CASCADE, SET NULL, NO ACTION, RESTRICT, and SET DEFAULT.

CASCADE: if a row from the parent table is deleted or updated, the values of the matching rows in the child table automatically deleted or updated.
SET NULL:  if a row from the parent table is deleted or updated, the values of the foreign key column (or columns) in the child table are set to NULL.
RESTRICT:  if a row from the parent table has a matching row in the child table, PostgreSQL rejects deleting or updating rows in the parent table.
NO ACTION: is similar to RESTRICT but the check is deferred until the end of the transaction.
SET DEFAULT: sets the foreign key column to its default value.

If you don't specify the ON DELETE and ON UPDATE clause, the default action is NO ACTION.
*/

-- CREATE DATABASE fkdemo;
--
-- SET search_path TO fkdemo;

CREATE TABLE categories(
    categoryId SERIAL PRIMARY KEY,
    categoryName VARCHAR(100) NOT NULL
);

CREATE TABLE products(
    productId SERIAL PRIMARY KEY,
    productName varchar(100) not null,
    categoryId INT,
    CONSTRAINT fk_category
    FOREIGN KEY (categoryId) 
        REFERENCES categories(categoryId)
);

INSERT INTO categories(categoryName)
VALUES
    ('Smartphone'),
    ('Smartwatch');

SELECT * FROM categories;

INSERT INTO products(productName, categoryId)
VALUES('iPhone',1);

INSERT INTO products(productName, categoryId)
VALUES('iPad',3);  -- will not work

UPDATE categories
SET categoryId = 100
WHERE categoryId = 1; -- will not work

-- Because of the RESTRICT option, you cannot delete or update categoryId 1 since it is referenced by the productId 1 in the products table.

DROP TABLE products;

CREATE TABLE products(
    productId SERIAL PRIMARY KEY,
    productName varchar(100) not null,
    categoryId INT NOT NULL,
    CONSTRAINT fk_category
    FOREIGN KEY (categoryId) 
    REFERENCES categories(categoryId)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

INSERT INTO products(productName, categoryId)
VALUES
    ('iPhone', 1), 
    ('Galaxy Note',1),
    ('Apple Watch',2),
    ('Samsung Galary Watch',2);
    
SELECT * FROM products;

UPDATE categories
SET categoryId = 100
WHERE categoryId = 1;

SELECT * FROM categories;
SELECT * FROM products;

DELETE FROM categories
WHERE categoryId = 2;

SELECT * FROM categories;

SELECT * FROM products;




