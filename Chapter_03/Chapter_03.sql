------------------------------------------------------------------
-- UNDERSTANDING DATA TYPES
------------------------------------------------------------------

-- Data dictionary: a document that lists each column; specifies wether it's
-- a number, character, or other type; and explains the column values.

-- Data types, Characters, Numbers and Dates and times.

------------------------------
-- Characters

-- char(n):
-- a fixed length column where the character length is specified by n
-- This stores n characters per row regardless of how many characters you 
-- insert. If you insert fewer character it gets padded with space.

-- varchar(n):
-- a variable length column where the maximum length is specified by n. If
-- fewer characters than maximum is inserted, it does not get padded.

-- text:
-- a variable-length column of unlimited length.
-- Not part of SQL standard.
-------------------------------


CREATE TABLE char_data_types(
    varchar_column varchar(10),
    char_column char(10),
    text_column text
);


INSERT INTO char_data_types
VALUES  ('abc', 'abc', 'abc'),
        ('defghi', 'defghi', 'defghi');

COPY char_data_types TO 'C:\Directory\typetest.txt'
WITH (FORMAT CSV, HEADER, DELIMITER '|');


-------------------------------------------------------------------------
-- Numbers

-- Integer: 
-- whole numbers, both positive and negative.

-- Fixed-point:
-- also called the arbitrary precision type, is .numeric(precision, scale).
-- precision, the max number of digits to the left and right of the decimal point,
-- and arg scale as the number of digits allowable on the right of the decimal
-- point. Can alsos be written as decimal(precision, scale)

-- Floating-point: 
-- two floating-point types are real(allows precision to six digits) and 
-- double precision(to 15 decimal points of precision)
----------------------------------------------------------------------------


CREATE TABLE number_data_types (
    numeric_column numeric(20, 5),
    real_column real,
    double_column double precision
);

INSERT INTO number_data_types
VALUES
    (.7, .7, .7),
    (2.13579, 2.13579, 2.13579),
    (2.1357987654, 2.1357987654, 2.1357987654);

SELECT *
FROM number_data_types;

SELECT
    numeric_column * 10000000 AS "Fixed",
    real_column * 10000000 AS "Float"
FROM number_data_types
WHERE numeric_column = .7;

--------------------------------------------------------------------------
-- Dates and timestamp

-- timestamp: 
-- records date and time, timestamptz to track date time and time zone.

-- date:
-- records just the date.

-- time:
-- records just the time. addidng time zone.

-- interval:
-- records the lenght difference of a time period.
--------------------------------------------------------------------------


CREATE TABLE date_time_types(
    timestamp_column timestamp with time zone,
    interval_column interval
);

INSERT INTO date_time_types
VALUES 
    ('2018-12-31 01:00 EST','2 days'), 
    ('2018-12-31 01:00 -8','1 month'), 
    ('2018-12-31 01:00 Australia/Melbourne','1 century'), 
    (now(),'1 week');


SELECT *
FROM date_time_types;

SELECT
    timestamp_column,
    interval_column,
    timestamp_column - interval_column AS new_date
FROM date_time_types;

-------------------------------------------------------------
-- Transforming Values from One Type to Another with CAST
-------------------------------------------------------------

-- The CAST() function only succeeds when the target data type can accomodate
-- the original value.

SELECT timestamp_column,
    CAST(timestamp_column AS varchar(10))
FROM date_time_types;

SELECT numeric_column,
    CAST(numeric_column AS integer),
    CAST(numeric_column AS varchar(6))
FROM number_data_types;

-- Returns error
-- SELECT CAST(char_column AS integer) FROM char_data_types;

---------------------------------------------------------
-- CAST Shortcut Notation
---------------------------------------------------------

-- double colon(::) is a shortcut for CAST but it is only available in
-- PostgreSQL.

SELECT timestamp_column::varchar(10)
FROM date_time_types;