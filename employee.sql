CREATE DATABASE College3;


USE College;


CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50),
    Marks INT
);


INSERT INTO Students VALUES
(1, 'Aman', 75),
(2, 'Riya', 88),
(3, 'Rahul', 65),
(4, 'Priya', 92),
(5, 'Karan', 80);


SELECT *
FROM Students
WHERE Marks > (
    SELECT AVG(Marks)
    FROM Students
);
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    Salary INT
);


INSERT INTO Employees VALUES
(1, 'Aman', 30000),
(2, 'Riya', 45000),
(3, 'Rahul', 40000),
(4, 'Priya', 55000),
(5, 'Karan', 50000);

-- Query
SELECT *
FROM Employees
WHERE Salary > (
    SELECT MAX(Salary)
    FROM Employees
);
DROP TABLE Employees;


DROP DATABASE College;
CREATE DATABASE Office;

-- Use Database
USE Office;

-- Create Department Table
CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50),
    DeptFloor INT
);

-- Create Employee Table
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Location VARCHAR(50),
    DepartmentID INT,
    Salary DECIMAL(10,2),
    Gender VARCHAR(10),
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);
INSERT INTO Employee VALUES
(1, 'Aman', 25, 'Delhi', 103, 50000, 'Male'),
(2, 'Riya', 28, 'Lucknow', 102, 60000, 'Female'),
(3, 'Rahul', 30, 'Kanpur', 101, 45000, 'Male'),
(4, 'Priya', 27, 'Noida', 104, 55000, 'Female'),
(5, 'Karan', 32, 'Gurugram', 105, 70000, 'Male'),
(6, 'Neha', 26, 'Jaipur', 106, 48000, 'Female'),
(7, 'Arjun', 29, 'Mumbai', 107, 75000, 'Male'),
(8, 'Sneha', 31, 'Pune', 108, 68000, 'Female'),
(9, 'Vikas', 35, 'Bhopal', 109, 52000, 'Male'),
(10, 'Anjali', 24, 'Chandigarh', 110, 46000, 'Female');

INSERT INTO Department VALUES
(101, 'Human Resources', 1),
(102, 'Finance', 2),
(103, 'IT', 3),
(104, 'Marketing', 4),
(105, 'Operations', 5),
(106, 'Sales', 2),
(107, 'Research', 6),
(108, 'Legal', 3),
(109, 'Administration', 1),
(110, 'Customer Support', 4);
SELECT * FROM Department;
INSERT INTO Department VALUES
(101, 'Human Resources', 1),
(102, 'Finance', 2),
(103, 'IT', 3),
(104, 'Marketing', 4),
(105, 'Operations', 5),
(106, 'Sales', 2),
(107, 'Research', 6),
(108, 'Legal', 3),
(109, 'Administration', 1),
(110, 'Customer Support', 4);
SELECT * FROM Department;
SELECT * FROM Employee;

INSERT INTO Employee VALUES
(1, 'Aman', 25, 'Delhi', 103, 50000, 'Male'),
(2, 'Riya', 28, 'Lucknow', 102, 60000, 'Female'),
(3, 'Rahul', 30, 'Kanpur', 101, 45000, 'Male'),
(4, 'Priya', 27, 'Noida', 104, 55000, 'Female'),
(5, 'Karan', 32, 'Gurugram', 105, 70000, 'Male'),
(6, 'Neha', 26, 'Jaipur', 106, 48000, 'Female'),
(7, 'Arjun', 29, 'Mumbai', 107, 75000, 'Male'),
(8, 'Sneha', 31, 'Pune', 108, 68000, 'Female'),
(9, 'Vikas', 35, 'Bhopal', 109, 52000, 'Male'),
(10, 'Anjali', 24, 'Chandigarh', 110, 46000, 'Female');
SELECT * FROM Employee;
-- 1. Display all records from the Employee table
SELECT * FROM Employee;

-- 2. Display only employee names and salaries
SELECT Name, Salary FROM Employee;

-- 3. Display employee names along with their cities
SELECT Name, Location FROM Employee;

-- 4. Find employees whose salary is greater than 50000
SELECT * FROM Employee
WHERE Salary > 50000;

-- 5. Find employees whose age is greater than 25
SELECT * FROM Employee
WHERE Age > 25;

-- 6. Display all female employees
SELECT * FROM Employee
WHERE Gender = 'Female';

-- 7. Display all employees who belong to Delhi
SELECT * FROM Employee
WHERE Location = 'Delhi';

-- 8. Find employees whose salary is between 40000 and 70000
SELECT * FROM Employee
WHERE Salary BETWEEN 40000 AND 70000;

-- 9. Find employees whose names start with the letter 'A'
SELECT * FROM Employee
WHERE Name LIKE 'A%';

-- 10. Find employees whose names end with the letter 'a'
SELECT * FROM Employee
WHERE Name LIKE '%a';

-- 11. Display employees whose city is either Delhi or Mumbai
SELECT * FROM Employee
WHERE Location IN ('Delhi', 'Mumbai');

-- 12. Display employees whose salary is not equal to 50000
SELECT * FROM Employee
WHERE Salary <> 50000;

-- 13. Sort employees based on salary in ascending order
SELECT * FROM Employee
ORDER BY Salary ASC;

-- 14. Sort employees based on salary in descending order
SELECT * FROM Employee
ORDER BY Salary DESC;

-- 15. Display the top 5 highest-paid employees
SELECT * FROM Employee
ORDER BY Salary DESC
LIMIT 5;
-- 1. Find the total number of employees
SELECT COUNT(*) AS TotalEmployees
FROM Employee;

-- 2. Find the maximum salary among employees
SELECT MAX(Salary) AS MaximumSalary
FROM Employee;

-- 3. Find the minimum salary among employees
SELECT MIN(Salary) AS MinimumSalary
FROM Employee;

-- 4. Find the average salary of employees
SELECT AVG(Salary) AS AverageSalary
FROM Employee;

-- 5. Find the total salary paid by the company
SELECT SUM(Salary) AS TotalSalary
FROM Employee;

-- 6. Find the total number of male employees
SELECT COUNT(*) AS MaleEmployees
FROM Employee
WHERE Gender = 'Male';

-- 7. Find the total number of female employees
SELECT COUNT(*) AS FemaleEmployees
FROM Employee
WHERE Gender = 'Female';
-- 1. Find the average salary of each department
SELECT DepartmentID, AVG(Salary) AS AverageSalary
FROM Employee
GROUP BY DepartmentID;

-- 2. Find the maximum salary in each department
SELECT DepartmentID, MAX(Salary) AS MaximumSalary
FROM Employee
GROUP BY DepartmentID;

-- 3. Find the minimum salary in each department
SELECT DepartmentID, MIN(Salary) AS MinimumSalary
FROM Employee
GROUP BY DepartmentID;

-- 4. Find the total salary paid department-wise
SELECT DepartmentID, SUM(Salary) AS TotalSalary
FROM Employee
GROUP BY DepartmentID;

-- 5. Find departments having more than 3 employees
SELECT DepartmentID, COUNT(*) AS EmployeeCount
FROM Employee
GROUP BY DepartmentID
HAVING COUNT(*) > 3;

-- 6. Find departments where average salary is greater than 50000
SELECT DepartmentID, AVG(Salary) AS AverageSalary
FROM Employee
GROUP BY DepartmentID
HAVING AVG(Salary) > 50000;

-- 7. Find the number of employees in each city
SELECT Location, COUNT(*) AS EmployeeCount
FROM Employee
GROUP BY Location;

-- 8. Find the average salary of employees in each city
SELECT Location, AVG(Salary) AS AverageSalary
FROM Employee
GROUP BY Location;
-- 1. Display employee names along with their department names
SELECT E.Name, D.DepartmentName
FROM Employee E
JOIN Department D
ON E.DepartmentID = D.DepartmentID;

-- 2. Display employee names with department locations
SELECT E.Name, D.Location
FROM Employee E
JOIN Department D
ON E.DepartmentID = D.DepartmentID;

-- 3. Find all employees working in the IT department
SELECT E.*
FROM Employee E
JOIN Department D
ON E.DepartmentID = D.DepartmentID
WHERE D.DepartmentName = 'IT';

-- 4. Display all employees along with their department details
SELECT E.*, D.*
FROM Employee E
JOIN Department D
ON E.DepartmentID = D.DepartmentID;

-- 5. Display all departments along with employees
-- (including departments with no employees)
SELECT D.*, E.Name
FROM Department D
LEFT JOIN Employee E
ON D.DepartmentID = E.DepartmentID;

-- 6. Find employees who do not belong to any department
SELECT E.*
FROM Employee E
LEFT JOIN Department D
ON E.DepartmentID = D.DepartmentID
WHERE D.DepartmentID IS NULL;

-- 7. Display department-wise employee count using JOIN
SELECT D.DepartmentName, COUNT(E.EmployeeID) AS EmployeeCount
FROM Department D
LEFT JOIN Employee E
ON D.DepartmentID = E.DepartmentID
GROUP BY D.DepartmentName;

-- 8. Find the highest salary employee in each department
SELECT D.DepartmentName, MAX(E.Salary) AS HighestSalary
FROM Department D
JOIN Employee E
ON D.DepartmentID = E.DepartmentID
GROUP BY D.DepartmentName;

-- 9. Display employee name, salary, department name, and location
SELECT E.Name, E.Salary, D.DepartmentName, D.Location
FROM Employee E
JOIN Department D
ON E.DepartmentID = D.DepartmentID;

-- 10. Find employees working in departments located in Delhi
SELECT E.*
FROM Employee E
JOIN Department D
ON E.DepartmentID = D.DepartmentID
WHERE D.Location = 'Delhi';

-- 11. Find the total salary paid in each department using JOIN
SELECT D.DepartmentName, SUM(E.Salary) AS TotalSalary
FROM Department D
JOIN Employee E
ON D.DepartmentID = E.DepartmentID
GROUP BY D.DepartmentName;

-- 12. Find departments having more than 5 employees using JOIN
SELECT D.DepartmentName, COUNT(E.EmployeeID) AS EmployeeCount
FROM Department D
JOIN Employee E
ON D.DepartmentID = E.DepartmentID
GROUP BY D.DepartmentName
HAVING COUNT(E.EmployeeID) > 5;
ALTER TABLE Department
ADD Location VARCHAR(50);
-- 1. Display employee names along with their department names
SELECT E.Name, D.DepartmentName
FROM Employee E
JOIN Department D
ON E.DepartmentID = D.DepartmentID;

-- 2. Display employee names with department locations
SELECT E.Name, D.Location
FROM Employee E
JOIN Department D
ON E.DepartmentID = D.DepartmentID;

-- 3. Find all employees working in the IT department
SELECT E.*
FROM Employee E
JOIN Department D
ON E.DepartmentID = D.DepartmentID
WHERE D.DepartmentName = 'IT';

-- 4. Display all employees along with their department details
SELECT E.*, D.*
FROM Employee E
JOIN Department D
ON E.DepartmentID = D.DepartmentID;

-- 5. Display all departments along with employees
-- (including departments with no employees)
SELECT D.*, E.Name
FROM Department D
LEFT JOIN Employee E
ON D.DepartmentID = E.DepartmentID;

-- 6. Find employees who do not belong to any department
SELECT E.*
FROM Employee E
LEFT JOIN Department D
ON E.DepartmentID = D.DepartmentID
WHERE D.DepartmentID IS NULL;

-- 7. Display department-wise employee count using JOIN
SELECT D.DepartmentName, COUNT(E.EmployeeID) AS EmployeeCount
FROM Department D
LEFT JOIN Employee E
ON D.DepartmentID = E.DepartmentID
GROUP BY D.DepartmentName;

-- 8. Find the highest salary employee in each department
SELECT D.DepartmentName, MAX(E.Salary) AS HighestSalary
FROM Department D
JOIN Employee E
ON D.DepartmentID = E.DepartmentID
GROUP BY D.DepartmentName;

-- 9. Display employee name, salary, department name, and location
SELECT E.Name, E.Salary, D.DepartmentName, D.Location
FROM Employee E
JOIN Department D
ON E.DepartmentID = D.DepartmentID;

-- 10. Find employees working in departments located in Delhi
SELECT E.*
FROM Employee E
JOIN Department D
ON E.DepartmentID = D.DepartmentID
WHERE D.Location = 'Delhi';

-- 11. Find the total salary paid in each department using JOIN
SELECT D.DepartmentName, SUM(E.Salary) AS TotalSalary
FROM Department D
JOIN Employee E
ON D.DepartmentID = E.DepartmentID
GROUP BY D.DepartmentName;

-- 12. Find departments having more than 5 employees using JOIN
SELECT D.DepartmentName, COUNT(E.EmployeeID) AS EmployeeCount
FROM Department D
JOIN Employee E
ON D.DepartmentID = E.DepartmentID
GROUP BY D.DepartmentName
HAVING COUNT(E.EmployeeID) > 5;
-- 1. Find the department having the highest average salary
SELECT D.DepartmentName, AVG(E.Salary) AS AverageSalary
FROM Employee E
JOIN Department D
ON E.DepartmentID = D.DepartmentID
GROUP BY D.DepartmentName
ORDER BY AverageSalary DESC
LIMIT 1;
-- 2. Find the department with the maximum number of employees
SELECT D.DepartmentName, COUNT(E.EmployeeID) AS EmployeeCount
FROM Employee E
JOIN Department D
ON E.DepartmentID = D.DepartmentID
GROUP BY D.DepartmentName
ORDER BY EmployeeCount DESC
LIMIT 1;
-- 3. Find employees whose age is greater than the average age of all employees
SELECT *
FROM Employee
WHERE Age > (
    SELECT AVG(Age)
    FROM Employee
);
-- 4. Find employees whose salary is above their department's average salary
SELECT E.*
FROM Employee E
WHERE E.Salary > (
    SELECT AVG(E2.Salary)
    FROM Employee E2
    WHERE E2.DepartmentID = E.DepartmentID
);