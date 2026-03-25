-- ----- TASK 4 : MYSQL KEYS & CONSTRAINTS -----


-- Task 1: Table Creation with Constraints

-- DATABASE CREATING

CREATE DATABASE constraints_db;

-- TO USE THIS DATABASE WE DEFINE
 
USE constraints_db;

-- Create a table named students with the following columns and constraints:

CREATE TABLE students (
 id INT PRIMARY KEY  AUTO_INCREMENT,
 name VARCHAR(50) NOT NULL,
 email VARCHAR(100) UNIQUE,
 age INT CHECK(age >= 18),
 city VARCHAR(50) DEFAULT('Chennai'));
 
 
 
 -- ----- Task 2: Foreign Key Implementation -----
 
 -- Create another table named courses:
 CREATE TABLE courses (
  course_id INT PRIMARY KEY,
  course_name VARCHAR(50) NOT NULL );
  
 
 -- Create a table named enrollments:
CREATE TABLE enrollments (
    enroll_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id) );
    
    
-- -----  Task 3: Data Insertion & Validation -----

-- Inserting data into students table
INSERT INTO students(name,email,age) values 
 ('Harsha','harshxyz@gmail.com',23),
 ('Ravi','ravi@gmail.com',22),
 ('Hari','hari123@gmail.com',23),
 ('Anjali','anjali@gmail.com', 22),
 ( 'prabhu','praxyz@gmail.com',21),
 ('harvijay','harvijay@gmail.com',20) ;
 
 SELECT * FROM students;
 
-- Inserting values into courses table
 INSERT INTO   courses (course_id,course_name) VALUES
 (11,'AI'),
 (12,'Devops'),
 (13,'Python developer'),
 (14,'Java'),
 (15,'Data Science'),
 (16, 'MLops');
 
 INSERT INTO   courses (course_id,course_name) VALUES
 (17,'Dsa');

 SELECT * FROM courses;
-- Inserting values into enrollments

INSERT INTO enrollments (enroll_id,student_id,course_id) values 
(100,1,11),
(200,2,12),
(300,3,13),
(400,4,14),
(500,5,15),
(600,6,16); 

SELECT * FROM enrollments;
 
-- Perform 
-- Try inserting duplicate email → observe UNIQUE constraint


-- here try to enter same mailid it came as error 
-- Error Code: 1062. Duplicate entry 'harshxyz@gmail.com' for key 'students.email'

INSERT INTO  students (name,email,age) VALUES
('vijay','harshxyz@gmail.com',22); 

-- we try with different mail with sight changes as harshaxyz@gmail.com
INSERT INTO  students (name,email,age) VALUES
('vijay','harshaxyz@gmail.com',22); -- here it is inserted

-- Try inserting NULL in NOT NULL column
-- here name is not null but we have entered null so it displays error
INSERT INTO  students (name,email,age) VALUES
(NULL,'harvixyz@gmail.com',22); -- Error Code: 1048. Column 'name' cannot be null


-- Error Code: 1048. Column 'course_name' cannot be null

INSERT INTO   courses (course_id,course_name) VALUES
 (11,NULL);
 
 -- Try inserting age < 18 → observe CHECK constraint
 -- here displayed as error age <18 so 
INSERT INTO students(name,email,age) values 
 ('Har','har@gmail.com',16); -- Error Code: 3819. Check constraint 'students_chk_1' is violated.

-- Skip city value → verify DEFAULT value
INSERT INTO students(name,email,age) values 
 ('Havi','havi@gmail.com',20); -- '22', 'Havi', 'havi@gmail.com', '20', 'Chennai'

 select * from students;


-- Insert records in enrollments with: valid foreign keys

INSERT INTO enrollments (enroll_id,student_id,course_id) VALUES
(700, 19,17); -- row is added -- '700', '19', '17'


SELECT * FROM enrollments;

-- Insert records in enrollments with: invalid foreign keys → observe error
INSERT INTO enrollments (enroll_id, student_id, course_id) VALUES
(800, 999, 888); 
-- error is 
-- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`constraints_db`.`enrollments`, CONSTRAINT `enrollments_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`))
