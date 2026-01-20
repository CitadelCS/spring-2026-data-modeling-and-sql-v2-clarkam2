-- PostgreSQL BEFORE INSERT triggers

SET search_path TO classicmodels;

DROP TABLE IF EXISTS WorkCenters;

CREATE TABLE WorkCenters (
    id serial PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    capacity INT NOT NULL
);

DROP TABLE IF EXISTS WorkCenterStats;

CREATE TABLE WorkCenterStats(
    totalCapacity INT NOT NULL
);

CREATE OR REPLACE FUNCTION before_workcenters_insert()
    RETURNS trigger AS
$$
DECLARE
    rowcount int;
BEGIN
    SELECT INTO rowcount COUNT(*) FROM WorkCenterStats;

    IF rowcount > 0 THEN
        UPDATE WorkCenterStats
        SET totalCapacity = totalCapacity + new.capacity;
    ELSE
        INSERT INTO WorkCenterStats(totalCapacity)
        VALUES(new.capacity);
    END IF;

    RETURN NEW;
END;
$$
LANGUAGE 'plpgsql';

CREATE TRIGGER before_workcenters_insert_trigger
    BEFORE INSERT ON WorkCenters
    FOR EACH ROW EXECUTE FUNCTION before_workcenters_insert();

INSERT INTO WorkCenters(name, capacity)
VALUES('Mold Machine',100);

SELECT * FROM WorkCenterStats;

INSERT INTO WorkCenters(name, capacity)
VALUES('Packing',200);

SELECT * FROM WorkCenterStats;