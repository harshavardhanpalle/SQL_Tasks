-- Task 3 Assignment: MySQL Functions

-- Task 1: Setup
-- creating databse and using this db
CREATE DATABASE functions_db;

USE functions_db;
-- creating a table 
CREATE TABLE employees( 
emp_id INT  PRIMARY KEY,
emp_name VARCHAR(50),
salary FLOAT,
department VARCHAR(50),
joining_date DATE);



-- inserting values into table
INSERT INTO employees (emp_id, emp_name, salary, department, joining_date) VALUES 
(1, 'Harsha', 48000.40, 'DevOps', '2026-03-02'),
(2, 'Ani', 52000.60, 'HR', '2025-11-15'),
(3, 'Hari', 60000.90, 'Engineering', '2024-07-20'),
(4, 'Sneha', 45000.10, 'Marketing', '2025-01-10'),
(5, 'Kiran', 70000.30, 'Finance', '2023-09-05'),
(6, 'Priya', 55000.20, 'Engineering', '2024-12-01'),
(7, 'Arjun', 62000.35, 'DevOps', '2025-06-18'),
(8, 'Maya', 48000.40, 'HR', '2024-03-25'),
(9, 'Vikram', 84100.60, 'Management', '2022-08-30'),
(10, 'Pooja', 53000.50, 'Marketing', '2025-04-12'),
(11, 'Ravi', 67000.00, 'Engineering', '2023-11-22'),
(12, 'Daya', 61800.90, 'Finance', '2024-02-14'),
(13, 'Suresh', 58000.90, 'DevOps', '2023-06-09'),
(14, 'Neha', 51000.70, 'HR', '2025-09-17'),
(15, 'Manoj', 72000.90, 'Management', '2022-12-05'),
(16, 'Harshavardhan',100000.10,'AIML Engineer','2026-03-10');


SELECT * FROM employees;


-- ----- Task 2 : Numberic Functions

-- Round 

SELECT emp_id, emp_name,salary ,ROUND(salary ,2) AS  Rounded_salary FROM employees;

-- FLOOR
SELECT emp_id,emp_name,salary , FLOOR(salary) as salary_floor FROM employees;

-- CEIL
SELECT emp_id, emp_name, salary, CEIL(salary) AS ceil_salary FROM employees;

-- ABS
SELECT emp_id, emp_name, salary,
       ROUND(ABS(salary - (SELECT AVG(salary) FROM employees)), 2) AS abs_diff_from_avg FROM employees;

-- MOD() using a number(1000)

SELECT emp_id,emp_name,salary  ,MOD(salary , 1000) as salary_mod FROM employees;

-- POWER()/ POW()

SELECT emp_id, emp_name, salary, ROUND(POW(salary, 2), 2 ) AS salary_squared FROM employees;

-- square root ---- SQRT()

SELECT emp_id, emp_name, salary ,ROUND(SQRT(salary),4) AS salary_squareroot FROM employees;

-- TASK 3 String Functions

-- Combine employee name and department using CONCAT()
SELECT emp_id,  CONCAT(emp_name, ' - ' ,department ) AS  details FROM employees;

-- Find length of employee names using LENGTH()
SELECT emp_id ,LENGTH(emp_name) AS length_name from employees;

-- Convert employee names to uppercase and lowercase
-- upper 
SELECT emp_id , UPPER(emp_name) AS NAMES_UPPER FROM employees;

SELECT emp_id , LOWER(emp_name) AS name_lower FROM employees;

SELECT emp_id ,  UPPER(emp_name) AS NAMES_UPPER , LOWER(emp_name) as names_lower FROM employees;

-- Task 4: Date Functions 

-- NOW() used to extract current data and time  
SELECT NOW( ) AS CURRENT_DT ;

-- Currentdate CURTIME()
SELECT  CURDATE() AS current_dt ;

-- Current Time
SELECT CURTIME() AS current_ti ;

-- number of days an employee has worked using DATEDIFF() (compare current date with joining_date)
SELECT emp_id,emp_name ,joining_date, DATEDIFF(CURDATE() , joining_date) AS No_of_days FROM employees;