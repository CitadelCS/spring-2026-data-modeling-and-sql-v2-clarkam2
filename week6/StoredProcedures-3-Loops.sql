-- PostgreSQL WHILE loop

SET search_path TO classicmodels;

CREATE TABLE IF NOT EXISTS calendars(
    id SERIAL PRIMARY KEY,
    fulldate DATE UNIQUE,
    day SMALLINT NOT NULL,
    month SMALLINT NOT NULL,
    quarter SMALLINT NOT NULL,
    year INT NOT NULL
);

CREATE OR REPLACE FUNCTION InsertCalendar(dt DATE)
RETURNS VOID AS $$
BEGIN
    INSERT INTO calendars(
        fulldate,
        day,
        month,
        quarter,
        year
    )
    VALUES(
        dt,
        EXTRACT(DAY FROM dt)::SMALLINT,
        EXTRACT(MONTH FROM dt)::SMALLINT,
        EXTRACT(QUARTER FROM dt)::SMALLINT,
        EXTRACT(YEAR FROM dt)::INT
    );
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION LoadCalendars(
    startDate DATE,
    days INT
)
RETURNS VOID AS $$
DECLARE
    counter INT DEFAULT 1;
    dt DATE DEFAULT startDate;
BEGIN
    WHILE counter <= days LOOP
        PERFORM InsertCalendar(dt);
        counter := counter + 1;
        dt := dt + INTERVAL '1 day';
    END LOOP;
END;
$$ LANGUAGE plpgsql;

SELECT LoadCalendars('2019-01-01'::DATE, 31);
SELECT * FROM calendars;

