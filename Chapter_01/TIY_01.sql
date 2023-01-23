-------------------------------------------------------------------
-- Question 1
-- Imagine you’re building a database to catalog all the animals at 
-- your local zoo. You want one table to track the kinds of animals 
-- in the collection and another table to track the specifics on each 
-- animal. Write CREATE TABLE statements for each table that include 
-- some of the columns you need. Why did you include the columns you 
-- chose?
------------------------------------------------------------------

-- database zoo to store information about all animals in the zoo
CREATE DATABASE zoo;

-- table animals is to track all kinds of animals in the zoo

CREATE TABLE animals(
    id bigserial,
    name varchar(25),
    date_acquired date,
    gender varchar(1)
);



-- table specifics tracks unique features of the animals
CREATE TABLE specifics(
    id bigserial,
    scientific_name varchar(60),
    weight numeric,
    food_consumed numeric
);


------------------------------------------------------------------------
-- Question 2
-- Now create INSERT statements to load sample data into the tables. 
-- How can you view the data via the pgAdmin tool? Create an additional 
-- INSERT statement for one of your tables. Purposely omit one of the 
-- required commas separating the entries in the VALUES clause of the query.
--  What is the error message? Would it help you find the error in the code?
-------------------------------------------------------------------------

-- insert values into the animals table
INSERT INTO animals(name, date_acquired, gender)
VALUES  ('Lion', '2023-01-23', 'M'),
        ('Giraffe', '2022-01-22', 'F'),
        ('Elephant', '2021-09-24', 'M'),
        ('Crocodile', '2023-01-07', 'M');

-- insert values into the specifics table
INSERT INTO specifics(scientific_name, weight, food_consumed)
VALUES  ('Panther Leo', 175, 100),
        ('Giraffa', 1180, 180),
        ('Loxodonta', 6800, 250),
        ('Crocodylidae', 1000, 175);