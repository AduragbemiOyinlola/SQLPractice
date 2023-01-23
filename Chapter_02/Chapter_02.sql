-----------------------------------------
-- BEGINNING DATA EXPLORATION WITH SELECT
-----------------------------------------

SELECT *
FROM teachers;

------------------------------------------
-- Querying a Subset of Columns
------------------------------------------

SELECT last_name, first_name, salary
FROM teachers;

------------------------------------------
-- Using DISTINCT to Find Unique VALUESz
------------------------------------------

SELECT DISTINCT school
FROM teachers;

-----------------------------------------
-- Sorting Data with ORDER BY
-----------------------------------------

SELECT first_name, last_name, salary
FROM teachers
ORDER BY salary DESC;
-- Sorting by numeric values is the easiest in SQL

-----------------------------------------------------------------------
-- Order in which characters are sorted in postgresql_fdw_validator
-- Punctuation marks, including quotes, parentheses, and math operators
-- Numbers
-- Additional punctuation, including question mark
-- Capital letters
-- More punctuation, including brackets and underscore
-- Lowercase letters
-- Additional punctuation, special characters, and the extended alphabet
------------------------------------------------------------------------

SELECT last_name, school, hire_date
FROM teachers
ORDER BY school ASC, hire_date DESC;

-----------------------------------------------------------------------
-- Filtering Rows with WHERE
-----------------------------------------------------------------------

SELECT last_name, school, hire_date
FROM teachers
WHERE school = 'Myers Middle School';

SELECT school
FROM teachers
WHERE school <> 'F.D. Roosevelt HS';

SELECT first_name, last_name, school, salary
FROM teachers
WHERE salary BETWEEN 40000 AND 65000;

-----------------------------------------------------------------------
-- Using LIKE and ILIKE with WHERE
-----------------------------------------------------------------------

-- Percent sign(%) - wildcard matching one or more characters
-- Underscore (_) - wildcard matching just one character 

-- LIKE is case sensitive while ILIKE is case insensitive

SELECT first_name
FROM teachers 
WHERE first_name LIKE 'sam%';

SELECT first_name
FROM teachers
WHERE first_name ILIKE 'sam%';

-----------------------------------------------------------------------
-- Combining Operators with AND  and OR
-----------------------------------------------------------------------

SELECT *
FROM teachers 
WHERE school = 'Myers Middle School' AND salary < 40000;

SELECT *
FROM teachers
WHERE school = 'F.D. Roosevelt HS' 
    AND (salary < 38000 OR salary > 40000);

------------------------------------------------------------------------
-- Putting it All Together
------------------------------------------------------------------------

SELECT first_name, last_name, school, hire_date, salary
FROM teachers
WHERE school LIKE '%Roos%'
ORDER BY hire_date DESC;

-- SQL is particular about the order of keywords.