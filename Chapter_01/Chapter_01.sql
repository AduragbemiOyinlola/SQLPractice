----------------------------------------------------
-- CREATING YOUR FIRST DATABASE AND TABLE
----------------------------------------------------



----------------------------------
-- Creating a database in SQL, database called analysis

CREATE DATABASE analysis;


-- create table teachers with columns 
-- _______________________
-- column name | datatype  |
-- _______________________ |
-- id          | bigserial |
-- first_name  | varchar   |
-- last_name   | varchar   |
-- school      | varchar   |
-- hire_date   | date      |
-- salary      | numeric   |


CREATE TABLE teachers(
    id bigserial,
    first_name varchar(25),
    last_name varchar(50),
    school varchar(50),
    hire_date date,
    salary numeric
);


-- adding data to a table using the INSERT INTO & VALUES statement

INSERT INTO teachers (first_name, last_name, school, hire_date, salary)
VALUES  ('Janet', 'Smith', 'F.D. Roosevelt HS', '2011-10-30', 36200),
        ('Lee', 'Reynolds', 'F.D. Roosevelt HS', '1993-05-22', 65000),
        ('Samuel', 'Cole', 'Myers Middle School', '2005-08-01', 43500), 
        ('Samantha', 'Bush', 'Myers Middle School', '2011-10-30', 36200), 
        ('Betty', 'Diaz', 'Myers Middle School', '2005-08-30', 43500), 
        ('Kathleen', 'Roush', 'F.D. Roosevelt HS', '2010-10-22', 38500);

-- the order of values must follow the order of COLUMNS
