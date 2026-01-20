/*
PostgreSQL has supported CHECK constraints since early versions. They are enforced by default.
[CONSTRAINT [constraint_name]] CHECK (expression)
*/

CREATE TABLE parts (
    part_no VARCHAR(18) PRIMARY KEY,
    description VARCHAR(40),
    cost DECIMAL(10,2 ) NOT NULL CHECK (cost >= 0),
    price DECIMAL(10,2) NOT NULL CHECK (price >= 0)
);

-- SHOW CREATE TABLE parts;

INSERT INTO parts(part_no, description,cost,price) 
VALUES('A-001','Cooler',0,-100); -- generates error

DROP TABLE IF EXISTS parts;

CREATE TABLE parts (
    part_no VARCHAR(18) PRIMARY KEY,
    description VARCHAR(40),
    cost DECIMAL(10,2 ) NOT NULL CHECK (cost >= 0),
    price DECIMAL(10,2) NOT NULL CHECK (price >= 0),
    CONSTRAINT parts_chk_price_gt_cost 
        CHECK(price >= cost)
);

INSERT INTO parts(part_no, description,cost,price) 
VALUES('A-001','Cooler',200,100); -- generates error

INSERT INTO parts(part_no, description,cost,price) 
VALUES('A-001','Cooler',200,300);