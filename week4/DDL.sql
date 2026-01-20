-- SQL DATA DEFINITION LANGUAGE AND COMMANDS

/*
PostgreSQL is a single storage engine database system that uses a unified storage layer.
PostgreSQL tables have consistent properties and characteristics across the system.
*/
-- To see version info: SELECT version();
/*
PostgreSQL supports ACID transactions by default and has built-in support for
distributed transactions and savepoints.
*/

-- SYSTEM INFORMATION

-- SELECT NOW();

/*
PostgreSQL CREATE TABLE syntax:
CREATE TABLE [IF NOT EXISTS] table_name(
   column_1_definition,
   column_2_definition,
   ...,
   table_constraints
);

column_name data_type(length) [NOT NULL] [DEFAULT value] [SERIAL for auto-increment] column_constraint;
*/

CREATE SCHEMA IF NOT EXISTS csci601;

CREATE TABLE IF NOT EXISTS csci601.tasks (
    task_id serial PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    start_date DATE,
    due_date DATE,
    status int NOT NULL,
    priority int NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS csci601.checklists (
    todo_id serial,
    task_id INT,
    todo VARCHAR(255) NOT NULL,
    is_completed BOOLEAN NOT NULL DEFAULT FALSE,
    PRIMARY KEY (todo_id , task_id),
    FOREIGN KEY (task_id)
        REFERENCES tasks (task_id)
        ON UPDATE RESTRICT ON DELETE CASCADE
);

