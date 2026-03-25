-- Task 1: SQL Queries & CRUD Operations

-- 1.Creating a database  with Student_db

CREATE DATABASE Student_db;

-- 2.Is used to define like use the database

USE Student_db;

-- 3.create a table name students
 
CREATE TABLE students (
            id INT PRIMARY KEY, -- used for uniques id 
            name VARCHAR(50),-- used for student name like len->(50)
            age INT,
            marks INT
            );
            
-- 4 
-- Insert at least 5 records

INSERT INTO students (id, name, age, marks) VALUES (1, "Harsha" , 23 ,90);
INSERT INTO students (id, name, age, marks) VALUES (2, 'hari', 22, 91);
INSERT INTO students (id, name, age, marks) VALUES (3, 'Ravi', 24, 76);
INSERT INTO students (id, name, age, marks) VALUES (4, 'Pavi', 21, 88);
INSERT INTO students (id, name, age, marks) VALUES (5, 'Rajesh', 20, 83);
INSERT INTO students (id, name, age, marks) VALUES (6, 'Murthy', 25, 70);

-- read(select) 
-- display all records ,* is used to read all records in from the table

SELECT * FROM students;

-- DISPLAY USING SPECIFIC COLOUMNS 
-- WE USE COLOUMN NAMES AND GET THE RESULT FOR SPECIFIC PERSON OR ID OR SUCH THINGS

SELECT id,name, marks FROM Students; -- here while user just thought of age of no use

-- UPDATE IS USED TO CHANGE THE WRONG INPUT AND ANY MANUAL MISTAKES
-- WHERE CLAUSE IS USED TO CONDITION PARTICULAR ID OR NAME OR ANY PARTCULAR DATA TO CHANGE OR UPDATE
-- HERE WE CHANGE MARKS FOR A STUDENT ID = 3 , FROM MARKS 76 TO 86

UPDATE students
SET marks = 86 WHERE id = 3;

-- here we change the age of an id 6

UPDATE  students set age = 24 where id= 6;

-- Delete one record using WHERE clause
-- check data before deletion 
SELECT * FROM students;

DELETE FROM students
WHERE id = 2;

-- table after deletion 

SELECT * FROM students ;

-- Truncate
-- Delete all records using TRUNCATE  and here only table structure only remains

TRUNCATE TABLE students;

SELECT * FROM students;


INSERT INTO students (id, name, age, marks) VALUES (1, "Harsha" , 23 ,90);
INSERT INTO students (id, name, age, marks) VALUES (2, 'hari', 22, 91);
INSERT INTO students (id, name, age, marks) VALUES (3, 'Ravi', 24, 76);
INSERT INTO students (id, name, age, marks) VALUES (4, 'Pavi', 21, 88);
INSERT INTO students (id, name, age, marks) VALUES (5, 'Rajesh', 20, 83);
INSERT INTO students (id, name, age, marks) VALUES (6, 'Murthy', 25, 70);
INSERT INTO students (id, name, age, marks) VALUES (7, 'Priya', 20, 42);
INSERT INTO students (id, name, age, marks) VALUES (8, 'Vikram', 21, 35);
INSERT INTO students (id, name, age, marks) VALUES (9, 'Meena', 22, 78);
INSERT INTO students (id, name, age, marks) VALUES (10, 'Karthik', 19, 60);
INSERT INTO students (id, name, age, marks) VALUES (11, 'Divya', 21, 73);
INSERT INTO students (id, name, age, marks) VALUES (12, 'Suresh', 24, 60);

select * from students;

-- Task 2: SQL Conditions & Operators

-- operators using select

-- = operator
-- it displays records of marks = 80 if no result it does't display anything

SELECT * FROM students WHERE marks = 80; 

-- here it displays marks which are not equal to 80  

SELECT * FROM students WHERE marks <> 70;

SELECT * FROM students WHERE marks != 80;

-- GREATER THAN >
-- > used to make the top list like marks > 80 comes under A grade 

SELECT * FROM students WHERE marks >80; -- displays records greater than 80 or above 80 marks


-- LESS THAN <
-- used to list down the students under required marks
SELECT * FROM students WHERE marks < 35;

-- >= 
-- Greater than or equal to
-- to seperate the records whose marks are >= 50
SELECT * FROM students WHERE marks >= 50;


-- less than or equal to <=
-- here we will use this for age 
-- if students check their eligibility using age ,age<= 20

SELECT * FROM students WHERE age <= 20;


-- 2.USE WHERE CLAUSE WITH SELECT ,UPDATE,DELETE

-- SELECT
SELECT * FROM students WHERE marks >= 70 and age <= 20;
SELECT * FROM students WHERE name = "Harsha";

-- UPDATE 
-- AGE update using where

UPDATE students
SET marks = 95 WHERE name = "Harsha";

 SELECT * FROM students ;
 
 -- DELETE  used to delete specific condition
 
DELETE FROM students WHERE id = 4;

DELETE FROM students WHERE age < 20;

