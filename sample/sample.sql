CREATE SCHEMA IF NOT EXISTS sample;

CREATE TABLE IF NOT EXISTS sample.person
(
    id          serial PRIMARY KEY,
    firstName   VARCHAR(100) NOT NULL,
    lastName    VARCHAR(100) NOT NULL,
    street      VARCHAR(255) NOT NULL,
    city        VARCHAR(255) NOT NULL,
    state       VARCHAR(10)  NOT NULL,
    zip         VARCHAR(12)  NOT NULL,
    description TEXT,
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO sample.person(firstName, lastName, street, city, state, zip)
VALUES ('John', 'Smith', '123 Sesame Street', 'Charleston', 'SC', '29409');