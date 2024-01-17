/*
177. Nth Highest Salary
Medium

Table: Employee

+-------------+------+
| Column Name | Type |
+-------------+------+
| id          | int  |
| salary      | int  |
+-------------+------+
id is the primary key (column with unique values) for this table.
Each row of this table contains information about the salary of an employee.
 

Write a solution to find the nth highest salary from the Employee table. If there is no nth highest salary, return null.

The result format is in the following example.

 

Example 1:

Input: 
Employee table:
+----+--------+
| id | salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+
n = 2
Output: 
+------------------------+
| getNthHighestSalary(2) |
+------------------------+
| 200                    |
+------------------------+
Example 2:

Input: 
Employee table:
+----+--------+
| id | salary |
+----+--------+
| 1  | 100    |
+----+--------+
n = 2
Output: 
+------------------------+
| getNthHighestSalary(2) |
+------------------------+
| null                   |
+------------------------+
*/

-- Original notes:
-- This function retrieves the Nth highest salary from the Employee table.
-- It calculates the offset based on the parameter N and returns the salary.

CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
    -- Declare a variable to store the offset value
    DECLARE M INT;
    SET M = N - 1;
    
    -- Return the Nth highest salary using an SQL query
    RETURN (
        SELECT DISTINCT Salary FROM Employee 
        ORDER BY Salary DESC 
        LIMIT 1 OFFSET M
    ); 
END;


