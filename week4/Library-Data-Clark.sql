/*
 Alexandria Clark
 Script - 1
 */

SET search_path TO library;

INSERT INTO library.PUBLISHER (Name, Address, Phone)
VALUES ('Pearson', 'New York, NY', '111-111-1111'),
       ('McGrawHill', 'Chicago, IL', '222-222-2222'),
       ('OReilly', 'San Francisco, CA', '333-333-3333');


INSERT INTO library.BOOK (Title, Publisher_name)
VALUES ('Database Systems', 'Pearson'),
       ('Learning SQL', 'OReilly'),
       ('Operating Systems', 'McGrawHill');

INSERT INTO library.BOOK_AUTHORS (Book_id, Author_name)
VALUES (1, 'Elmasri'),
       (2, 'Beaulieu'),
       (3, 'Silberschatz');

INSERT INTO library.LIBRARY_BRANCH (Branch_name, Address)
VALUES ('Downtown', '123 Main St'),
       ('Uptown', '456 Oak Ave'),
       ('Campus', '789 College Rd');

INSERT INTO library.BOOK_COPIES (Book_id, Branch_id, No_of_copies)

VALUES (1, 1, 5),
       (2, 2, 3),
       (3, 3, 7);

INSERT INTO library.BORROWER (Name, Address, Phone)
VALUES ('Alice Smith', '1 Apple St', '555-1111'),
       ('Bob Johnson', '2 Banana Ave', '555-2222'),
       ('Carol White', '3 Cherry Blvd', '555-3333');

INSERT INTO library.BOOK_LOANS (Book_id, Branch_id, Card_no, Date_out, Due_date)
VALUES (1, 1, 1, '2026-02-01', '2026-02-15'),
       (2, 2, 2, '2026-02-02', '2026-02-16'),
       (3, 3, 3, '2026-02-03', '2026-02-17');
