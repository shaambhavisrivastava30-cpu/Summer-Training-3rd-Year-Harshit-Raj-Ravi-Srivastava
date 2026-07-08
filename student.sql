CREATE DATABASE college2;
USE college2;
CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    course_id INT
);
CREATE TABLE Course (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50)
);
INSERT INTO Course VALUES
(101, 'Computer Science'),
(102, 'Data Science'),
(103, 'Artificial Intelligence'),
(104, 'Cyber Security'),
(105, 'Cloud Computing');
INSERT INTO Student VALUES
(1, 'Aman', 101),
(2, 'Priya', 102),
(3, 'Rahul', 103),
(4, 'Sneha', 104),
(5, 'Arjun', 105);
 SELECT * FROM Student;
 SELECT * FROM Course;
 SELECT s.student_id,
       s.student_name,
       c.course_name
FROM Student s
JOIN Course c
ON s.course_id = c.course_id;
SELECT *
FROM Student s
LEFT JOIN Course c
ON s.course_id = c.course_id;
SELECT *
FROM Student s
RIGHT JOIN Course c
ON s.course_id = c.course_id;
SELECT *
FROM Student s
LEFT JOIN Course c
ON s.course_id = c.course_id

UNION

SELECT *
FROM Student s
RIGHT JOIN Course c
ON s.course_id = c.course_id;
SELECT *
FROM Student
CROSS JOIN Course;