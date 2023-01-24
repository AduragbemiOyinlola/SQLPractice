------------------------------------------------------------------
-- UNDERSTANDING DATA TYPES
------------------------------------------------------------------

-- Data dictionary: a document that lists each column; specifies wether it's
-- a number, character, or other type; and explains the column values.

-- Data types, Characters, Numbers and Dates and times.

------------------------------
-- Characters

-- char(n) 
-- a fixed length column where the character length is specified by n
-- This stores n characters per row regardless of how many characters you 
-- insert. If you insert fewer character it gets padded with space.

-- varchar(n)
-- a variable length column where the maximum length is specified by n. If
-- fewer characters than maximum is inserted, it does not get padded.

-- text
-- a variable-length column of unlimited length.
-- Not part of SQL standard.

CREATE TABLE char_data_types(
    varchar_column varchar(10),
    char_column char(10),
    text_column text
);

INSERT INTO char_data_types
VALUES  ('abc', 'abc', 'abc'),
        ('defghi', 'defghi', 'defghi');

COPY char_data_types TO 'C:Users/HP - PC/Documents/SQLPratice/typetest.txt'
WITH (FORMAT CSV, HEADER, DELIMITER '|');