/*
 Alexandria Clark
 Script - 1
 */
DROP SCHEMA IF EXISTS library CASCADE;
CREATE SCHEMA library AUTHORIZATION CURRENT_USER;
SET search_path TO library;

CREATE TABLE PUBLISHER
(
    Name    VARCHAR(100) PRIMARY KEY,
    Address VARCHAR(200) NOT NULL,
    Phone   VARCHAR(20) UNIQUE
);

CREATE TABLE BOOK
(
    Book_id        SERIAL PRIMARY KEY,
    Title          VARCHAR(200) NOT NULL,
    Publisher_name VARCHAR(100) NOT NULL,

    CONSTRAINT fl_book_publisher
        FOREIGN KEY (Publisher_name)
            REFERENCES PUBLISHER (Name)
            ON DELETE RESTRICT
            ON UPDATE CASCADE
);

CREATE TABLE BOOK_AUTHORS
(
    Book_id     INT          NOT NULL,
    Author_name VARCHAR(100) NOT NULL,
    PRIMARY KEY (Book_id, Author_name),

    CONSTRAINT fk_authors_book
        FOREIGN KEY (Book_id)
            REFERENCES BOOK (Book_id)
            ON DELETE CASCADE
            ON UPDATE CASCADE
);

CREATE TABLE LIBRARY_BRANCH
(
    Branch_id   SERIAL PRIMARY KEY,
    Branch_name VARCHAR(100) NOT NULL UNIQUE,
    Address     VARCHAR(200) NOT NULL
);

CREATE TABLE BORROWER
(
    Card_no SERIAL PRIMARY KEY,
    Name    VARCHAR(100) NOT NULL,
    Address VARCHAR(200) NOT NULL,
    Phone   VARCHAR(20) UNIQUE
);


CREATE TABLE BOOK_COPIES
(
    Book_id      INT NOT NULL,
    Branch_id    INT NOT NULL,
    No_of_copies INT NOT NULL CHECK (No_of_copies >= 0),

    PRIMARY KEY (Book_id, Branch_id),

    FOREIGN KEY (Book_id)
        REFERENCES BOOK (Book_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    FOREIGN KEY (Branch_id)
        REFERENCES LIBRARY_BRANCH (Branch_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE BOOK_LOANS
(
    Book_id   INT  NOT NULL,
    Branch_id INT  NOT NULL,
    Card_no   INT  NOT NULL,
    Date_out  DATE NOT NULL,
    Due_date  DATE NOT NULL,

    PRIMARY KEY (Book_id, Branch_id, Card_no, Date_out),

    FOREIGN KEY (Book_id)
        REFERENCES BOOK (Book_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    FOREIGN KEY (Branch_id)
        REFERENCES LIBRARY_BRANCH (Branch_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    FOREIGN KEY (Card_no)
        REFERENCES BORROWER (Card_no)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

