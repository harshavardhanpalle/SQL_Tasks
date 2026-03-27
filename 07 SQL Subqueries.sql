-- ---- Task 7 Assignment: SQL Subqueries -----

-- Task 1: Setup Table

-- database is created
CREATE DATABASE subquery_db;

-- using the databse to create tables
USE subquery_db;

-- creating table 
CREATE TABLE studentmark (
 id INT PRIMARY KEY,
 name VARCHAR(50),
 marks INT,
 department VARCHAR(50) );
 
 
-- Inserting values into the table

INSERT INTO studentmark (id, name, marks, department) VALUES
    (1,"Harsha",90,"AIops"),
    (2, "Ananya", 85, "Mathematics"),
    (3, "Rohan", 78, "Computer science"),
    (4, "Priya", 92, "Civil"),
    (5, "Aarav", 88, "Electronics"),
    (6, "Saanvi", 95, "Electrical"),
    (7, "Karan", 80, "Business systems"),
    (8, "Isha", 87, "Cybersecurity"),
    (9, "Vikram", 91, "Mechanical"),
    (10, "Meera", 89, "Block chain"),
    (11,"ricky",99,"Computer science"),
    (12,"Lucky",80,"Computer science");
    
    
    
-- TASK 2 :: Single Row Subquery

-- Objective: Use subquery that returns a single value.
-- Fetch students whose marks are greater than the average marks

# inner query calculated avg marks here is 87.5000
# outer query has compared the values and shown the result
SELECT * FROM studentmark 
WHERE marks > (SELECT AVG(marks) FROM studentmark);  

-- TASK 3 :: Multiple Row Subquery

--  Use subquery that returns multiple rows.

-- Students whose marks are greater than ANY marks from a specific department

# any needs to be greater than atleast one value in the list
-- here computer science marks are (78,99,80) the result shows marks > 78
SELECT * FROM studentmark 
WHERE marks > ANY (SELECT marks FROM studentmark WHERE department = "Computer science");

# all must be greater than every value in the list
-- # here AIops marks are 90 ,output displays result more than 90 marks
SELECT * FROM studentmark 
WHERE marks > ALL (SELECT marks FROM studentmark WHERE department = "AIops");  

-- TASK 4 :: Correlated subquery

--  Understand dependency between inner and outer query.
-- Fetch students whose marks are greater than the average marks of their own department
-- Inner query depends on outer query and Subquery runs for each row

SELECT * FROM studentmark s1
where marks > (SELECT AVG(marks) FROM studentmark s2 where s2.department = s1.department );