CREATE DATABASE company;
USE company;
CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    salary DECIMAL(10,2),
    experience INT,
    location VARCHAR(50)
);
INSERT INTO Employee
VALUES
(101, 'Aman', 25, 45000, 2, 'Lucknow'),
(102, 'Priya', 28, 55000, 4, 'Delhi'),
(103, 'Rahul', 30, 65000, 6, 'Mumbai'),
(104, 'Sneha', 27, 50000, 3, 'Kanpur'),
(105, 'Arjun', 35, 80000, 10, 'Bangalore'),
(106, 'Neha', 24, 42000, 1, 'Pune'),
(107, 'Vikas', 32, 70000, 8, 'Hyderabad'),
(108, 'Riya', 26, 48000, 3, 'Jaipur'),
(109, 'Karan', 29, 60000, 5, 'Chennai'),
(110, 'Anjali', 31, 75000, 7, 'Kolkata');

SELECT *
FROM Employee
ORDER BY salary DESC
LIMIT 5;
SELECT *
FROM Employee
ORDER BY age ASC;
SELECT *
FROM Employee
ORDER BY age DESC;
SELECT *
FROM Employee
WHERE age BETWEEN 25 AND 30;
SELECT *
FROM Employee
WHERE location IN ('Lucknow', 'Delhi', 'Mumbai');
SELECT *
FROM Employee
WHERE location NOT IN ('Lucknow', 'Delhi');
SELECT *
FROM Employee
WHERE name LIKE 'A%';
SELECT *
FROM Employee
WHERE name LIKE '%A';
SELECT *
FROM Employee
WHERE name LIKE '%A%';
SELECT AVG(salary) AS Average_Salary
FROM Employee;
SELECT MAX(salary) AS Highest_Salary
FROM Employee;
SELECT MIN(salary) AS Lowest_Salary
FROM Employee;
CREATE TABLE Manager (
    emp_id INT,
    name VARCHAR(50),
    age INT
);
INSERT INTO Manager VALUES
(201,'Rohit',40),
(202,'Meera',38),
(203,'Sanjay',45);
SELECT emp_id, name, age
FROM Employee

UNION

SELECT emp_id, name, age
FROM Manager;
