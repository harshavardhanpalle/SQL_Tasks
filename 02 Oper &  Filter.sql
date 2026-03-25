-- ----- Task 2  : SQL Operators & Filtering -----

-- Task 1: SQL – Operators & Filtering

-- 1 create databse 
CREATE DATABASE practice_db;

-- Is used to help us use the database
USE practice_db;

-- TABLE NAME STUDENT
CREATE TABLE students (
       id INT PRIMARY KEY,
       name VARCHAR(50),
       age INT,
       department VARCHAR(50),
       marks INT
       );
       
--  Inserting Values 
--  Insert at least 8 records with different values.
 INSERT INTO  students ( id, name, age, department, marks) VALUES 
( 1, "Ajith", 20, "Computer Science " ,90 ) ,
(2, "Pawan", 21, "Mechanical" ,92 ),
(3, "Samara", 22, "Electricals" ,96 ),
(4, "Charan", 19, "Computer Science" ,78 ),
(5, "HARI", 23, "Computer. Science" ,87 ),
(6, "Jayanth", 20, "IT" ,88 ),
(7, "Pavani", 22 , "IT", 98),
(8, "Neha", 20 , "Electronics", 98),
(9, "Amit", 24 , "IT", 98),
(10, "Arjun", 20, "IT", 98);

-- used to see the table we have created 
SELECT * FROM students;


-- Task 2: Comparison & Logical Operators

-- EQUAL TO ( = )Operator 

SELECT * FROM students WHERE department = "IT";

SELECT * FROM students WHERE department = "Computer Science" ;

-- NOT EQUAL TO ( !=  OR <>)
-- query used to display the record who is not from IT department

SELECT * FROM students WHERE department != "IT";

SELECT * FROM students WHERE marks <> 98;

-- LESS THAN < 

SELECT * FROM students where marks < 90 ;

-- GREATER THAN >
SELECT * FROM students WHERE marks > 80;

-- LESS THAN OR EQUAL TO  >= 
SELECT * FROM students WHERE  marks <= 90;

-- GREATER THAN OR EQUALS TO >= 
SELECT * FROM students WHERE marks >= 90;

-- select * from students;

-- LOGICAL OPERATORS ----

-- AND displays record when both conditions are TRUE

SELECT * FROM STUDENTS;

SELECT * FROM students WHERE department = 'IT' AND marks >= 90;

SELECT * FROM students WHERE  department = "Computer Science" AND marks < 90;

-- OR DISPLAYS RECORDS  ATLEAST ONE CONDITION MUST BE TRUE

SELECT * FROM students WHERE department = "IT"  OR marks > 90;

-- NOT 
SELECT * FROM students WHERE NOT department = 'IT';

-- Task 3: BETWEEN & IN Operators

-- BETWEEN operator
-- used to find students who scored between 85 and 95 marks
SELECT * FROM students WHERE marks BETWEEN 85 AND 95;

-- IN 
-- used to find students from IT and Mechanical departments
SELECT * FROM students WHERE department IN ('IT', 'Mechanical');

-- NOT IN 
-- used to find students NOT from IT and Electronics departments
SELECT * FROM students WHERE department NOT IN ('IT', 'Electronics');

-- Task 4: LIKE Operator & Wildcards

-- names Starting with a Specific Letter
SELECT * FROM students WHERE name LIKE 'A%';

--  students whose names end with 'a'
SELECT * FROM students WHERE name LIKE '%a';

-- students whose second letter is 'a'

SELECT * FROM students WHERE name LIKE '_a%';

-- 2 Examples to implement:
-- Names starting with a specific letter 

SELECT * FROM students WHERE name LIKE '%ar%';

-- ending with a specific letter 

SELECT * FROM students WHERE name LIKE '_a%';

-- Names with specific pattern 

SELECT * FROM students WHERE name LIKE 'P%i';

-- Task 5: Sorting & Limiting Results

-- order by
-- ASCENDING ORDER
-- marks in ascending order using asc and usually marks are orderby ascending order

SELECT * FROM students ORDER BY marks ASC;

--  DESCENDING ORDER DESC
-- Sort students by marks in descending order

SELECT * FROM students ORDER BY marks DESC;

SELECT * FROM students ORDER BY department ASC, marks DESC;

-- Use LIMIT and OFFSET:
 
-- Limit number of records displayed
-- starting 5 records only
SELECT * FROM students LIMIT 5;

-- Skip a certain number of records

SELECT * FROM students LIMIT 5 OFFSET 3;


SELECT * FROM students LIMIT 3, 5;