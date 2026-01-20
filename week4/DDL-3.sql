-- CREATE DATABASE testdb;
--
-- USE testdb;

/*
Define a PRIMARY KEY constraint in CREATE TABLE
CREATE TABLE table_name(
    primary_key_column datatype PRIMARY KEY,
    ...
);

OR

CREATE TABLE table_name(
    primary_key_column1 datatype,
    primary_key_column2 datatype,
    ...,
    PRIMARY KEY(column_list)
);
*/

CREATE TABLE users(
   user_id serial PRIMARY KEY,
   username VARCHAR(40),
   password VARCHAR(255),
   email VARCHAR(255)
);

CREATE TABLE roles(
   role_id serial,
   role_name VARCHAR(50),
   PRIMARY KEY(role_id)
);

CREATE TABLE user_roles(
   user_id INT,
   role_id INT,
   PRIMARY KEY(user_id,role_id),
   FOREIGN KEY(user_id) 
       REFERENCES users(user_id),
   FOREIGN KEY(role_id) 
       REFERENCES roles(role_id)
);

/*
Define PRIMARY KEY constraints using ALTER TABLE
ALTER TABLE table_name
ADD PRIMARY KEY(column_list);
*/

CREATE TABLE pkdemos(
   id INT,
   title VARCHAR(255) NOT NULL
);

ALTER TABLE pkdemos
ADD PRIMARY KEY(id);

/* A UNIQUE index ensures that values in a column must be unique. 
Unlike the PRIMARY index, MySQL allows NULL values in the UNIQUE index. In addition, a table can have multiple UNIQUE indexes.*/

-- ALTER TABLE users
-- ADD UNIQUE INDEX username_unique (username ASC) ;
--
-- ALTER TABLE users
-- ADD UNIQUE INDEX  (email ASC) ;
--
-- DESCRIBE users;