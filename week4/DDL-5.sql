/* 
SET NULL action
These steps illustrate how the ON UPDATE SET NULL and ON DELETE SET NULL actions work.
*/

DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS categories;


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
        ON UPDATE SET NULL
        ON DELETE SET NULL 
);

INSERT INTO categories(categoryName)
VALUES
    ('Smartphone'),
    ('Smartwatch');
    
INSERT INTO products(productName, categoryId)
VALUES
    ('iPhone', 1), 
    ('Galaxy Note',1),
    ('Apple Watch',2),
    ('Samsung Galary Watch',2);
    
UPDATE categories
SET categoryId = 100
WHERE categoryId = 1;

SELECT * FROM categories;
SELECT * FROM products;

DELETE FROM categories 
WHERE categoryId = 2;

SELECT * FROM products;


