#  ------- Final Task Assignment: Notes Saver App (Python + MySQL) -------

#FINAL TASK based on the concepts of MySQL Views and Python + MySQL Integration (CRUD Operations).

-- Part 1 : Database Setup

# Creating databse
CREATE DATABASE notes_db;

# Using the databse
USE notes_db;

# Creating table named notes
CREATE TABLE notes(
 note_id INT PRIMARY KEY AUTO_INCREMENT,
 title VARCHAR(100),
 content TEXT,
 created_at DATETIME );
 
 INSERT INTO notes(title,content,created_at) Values
 ('Plan Notes','Learning Skills','2026-03-31 05:30:00' ),
 ('Morning Routine', 'Wake up, exercise, breakfast', '2026-03-30 07:30:00'),
 ('Office Meeting', 'Discuss client requirements', '2026-03-30 10:00:00'),
 ('Lunch Plan', 'Eat with team at cafeteria', '2026-03-30 13:00:00'),
 ('Project Work', 'Complete SQL assignment', '2026-03-30 15:30:00'),
 ('Study Plan', 'Complete SQL chapter and practice queries', NOW()),
 ('Daily Tasks', 'Finish assignment, clean room, call parents', NOW()),
 ('Weekend Plan', 'Watch movie, go out with friends, relax', NOW());
 
 SELECT * FROM notes;
 
-- Part 2 : View Creation
# Implement basic data security using Views.
# here  we are requested to show id,title ,when it is created not the content

CREATE VIEW notes_view AS SELECT  note_id,title,created_at from notes;

SELECT * FROM notes_view;


USE notes_db;
SHOW TABLES;
SELECT * FROM notes;