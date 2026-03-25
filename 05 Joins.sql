-- ----- TASK 5 :  SQL JOINS -----

--
-- TASK 1 : Setup Tables

CREATE DATABASE join_db;

USE join_db;

-- Tables creating

CREATE TABLE departments
    (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) );
    
CREATE TABLE employees
    (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary FLOAT,
    dept_id INT );
    
    
-- INSERTING VALUES INTO THE TABLES

INSERT INTO departments( dept_id ,dept_name) VALUES 
(1, 'AI'),
(2, 'IT'),
(3, 'Finance'),
(4, 'Marketing'),
(5, 'Developer'),
(6, 'MLops');


INSERT INTO employees (emp_id, emp_name, salary, dept_id) VALUES
(101, 'Harsha', 50000, 1),
(102, 'Bobyy', 60000, 2),
(103, 'Charls', 55000, 3),
(104, 'Hari', 45000, 6),   --  No matching department to observe behaviour of joins
(105, 'Endri', 70000, NULL),  -- No department assigned 
(106, 'Harshavardhan', 52000, 2);

-- TASK 2: Inner Join

-- Objective: Retrieve only matching records.

-- Display employee name and department name using INNER JOIN

SELECT  employee.emp_name ,departmt.dept_name 
from  employees employee INNER JOIN  departments departmt ON employee.dept_id = departmt.dept_id;

--  Task 3 : Left OUter Join

-- Retrieve all records from left table.

-- Display all employees along with department details and 
-- Include employees without matching departments

SELECT e.emp_name ,d.dept_name 
from employees e LEFT JOIN  departments d 
ON e.dept_id = d.dept_id; -- here null values come in department name where the department does not match

-- Task 4: Right Outer Join
-- Retrieve all records from right table.

SELECT e.emp_name ,d.dept_name 
from employees e RIGHT OUTER  JOIN  departments d 
ON e.dept_id = d.dept_id; -- here NULL occur in emp name where the department does not match

-- Task 5 : Full Outer Join
--   Retrieve all records from both tables.
-- LEFT JOIN UNION RIGHT JOIN

SELECT * 
from employees e LEFT JOIN  departments d  ON e.dept_id = d.dept_id

UNION 

SELECT *
FROM  employees e RIGHT OUTER  JOIN  departments d ON e.dept_id = d.dept_id;

-- Task 6: Cross Join

-- Understand Cartesian product.
--  Display all possible combinations of employees and departments


SELECT e.emp_name, d.dept_name 
FROM employees e CROSS JOIN  departments d;

-- Total rows = (rows in employees × rows in departments)
-- 6 inputs from employees and 6 from department 
-- 6 * 6 = 36 ROWS

-- OUTPUT 36 row(s) returned

