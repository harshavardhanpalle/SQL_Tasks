-- ----- Task 6 Assignment: SQL Aggregation & Grouping -----


-- Task 1 :setup table

-- creating database
CREATE DATABASE aggregation_db;

-- using database
USE aggregation_db;

-- creating students table 

CREATE TABLE students (
  id INT PRIMARY KEY,
  name VARCHAR(50),
  marks INT,
  department VARCHAR(50) );
  
-- Insert at least 8 records into the table.
-- Multiple students belong to the same department (for grouping)

INSERT INTO students (id,name,marks,department) VALUES 
(1,"Harsha",90,"computer science"),
(2,"Aarav",85,"computer science"),
(3,"Rohan",78,"mechanical"),
(4,"Sneha",95,"computer science"),
(5,"Hari",88,"mechanical"),
(6,"Senthil",75,"mathematics"),
(7,"Vicky",80,"civil"),
(8,"Ricky",64,"mathematics"),
(9,"vijay",99,"computer science"),
(10,"Divya",83,"mathematics"),
(11,"John",56,"computer science");

SELECT * FROM students;

-- Task 2: Aggregate functions

-- Perform calculations on multiple rows.

-- COUNT() -- used to count how many students are there in table
SELECT COUNT(name) FROM students;  -- 11 is output

-- MAX() used to find maximum marks for the student in table
SELECT MAX(marks) FROM students; -- 99

-- MIN() used to find the lowest marks in the table
SELECT MIN(marks) FROM students; -- 56

-- AVG() used to find average of the marks

 -- 81.1818 here if we use round we get the limit values only after decimal
 -- ROUND(AVG(marks) ,2) -- 81.18
 SELECT AVG(marks) FROM students; 
 
 -- SUM() to find total marks 
 SELECT SUM(marks) FROM students; -- 893
 
-- Task 3 Group BY

-- Group by groups rows that have the same values in a specified column
-- Group rows based on a column.

-- Find total marks department-wise
SELECT department,SUM(marks) FROM students GROUP BY department;

-- Find average marks department-wise
SELECT department,AVG(marks) from students GROUP BY department;

-- Count number of students in each department
SELECT department,COUNT(name) from students GROUP BY department;

-- Task 4: WHERE VS HAVING

-- Where is used for filtering rows based on  condition before grouping
-- Having is used to filter groups after aggregations

--  Understand filtering at row level vs group level.

-- USE WHERE : Filter students with marks greater than a value
-- in where we can't use aggreate functions directly so we used sub query
SELECT name , department, marks  FROM students 
WHERE marks > (SELECT AVG(marks) FROM students);

-- Use HAVING:Filter departments having average marks greater than a value

-- 
SELECT department,AVG(marks) AS avg_marks FROM students 
GROUP BY department  
HAVING AVG(marks) > (SELECT AVG(marks) FROM students);

-- 