-- PostgreSQL Cursors
-- PostgreSQL cursor syntax differs from MySQL

SET search_path TO classicmodels;

CREATE OR REPLACE FUNCTION createEmailList()
RETURNS TEXT AS $$
DECLARE
    emailList TEXT := '';
    emailAddress VARCHAR(100);
    email_cursor CURSOR FOR
        SELECT email FROM employees;
BEGIN
    -- Open cursor and loop through results
    FOR emailAddress IN email_cursor LOOP
        -- Build email list (concatenate with semicolon)
        IF emailList = '' THEN
            emailList := emailAddress;
        ELSE
            emailList := emailList || ';' || emailAddress;
        END IF;
    END LOOP;

    RETURN emailList;
END;
$$ LANGUAGE plpgsql;

-- Call the function and get the result
SELECT createEmailList() AS email_list;