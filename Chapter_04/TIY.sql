
--------------------------------------------------------------------------
-- Question 1
-- Write a WITH statement to include with COPY to handle the import of an 
-- imaginary text file whose first couple of rows look like this: 

-------------------------------------------
-- id:movie:actor 
-- 50:#Mission: Impossible#:Tom Cruise
-------------------------------------------
--------------------------------------------------------------------------

COPY movies
FROM 'C|Your_directory|imaginary.txt'
WITH (FORMAT CSV, HEADER, DELIMITER ':', QUOTE '#')


--------------------------------------------------------------------------
-- Question 2
-- Using the table us_counties_2010 you created and filled in this chapter, 
-- export to a CSV file the 20 counties in the United States that have the 
-- most housing units. Make sure you export only each county’s name, state, 
-- and number of housing units. (Hint: Housing units are totaled for each 
-- county in the column housing_unit_count_100_percent.)
---------------------------------------------------------------------------


COPY (
    SELECT geo_name, state_us_abbreviation, housing_unit_count_100_percent
    FROM us_counties_2010
    ORDER BY housing_unit_count_100_percent DESC
    LIMIT 2O
)
TO 'C:|YourDirectory|top20_housing_unit.txt'
WITH (FORMAT CSV, HEADER);


----------------------------------------------------------------------------
-- Question 3
-- Imagine you’re importing a file that contains a column with these values:

--------------------
-- 17519.668 
-- 20084.461 
-- 18976.335 
--------------------

-- Will a column in your target table with data type numeric(3,8) work for 
-- these values? Why or why not?
---------------------------------------------------------------------------

No, an error will be thrown because the precision which has been set for
 the numeric datatype for the table is smaller than that of the values to
be imported
