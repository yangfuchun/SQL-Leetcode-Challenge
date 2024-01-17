/*
180. Consecutive Numbers
Medium

Table: Logs

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| num         | varchar |
+-------------+---------+
In SQL, id is the primary key for this table.
id is an autoincrement column.
 

Find all numbers that appear at least three times consecutively.

Return the result table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Logs table:
+----+-----+
| id | num |
+----+-----+
| 1  | 1   |
| 2  | 1   |
| 3  | 1   |
| 4  | 2   |
| 5  | 1   |
| 6  | 2   |
| 7  | 2   |
+----+-----+
Output: 
+-----------------+
| ConsecutiveNums |
+-----------------+
| 1               |
+-----------------+
Explanation: 1 is the only number that appears consecutively for at least three times.
*/

-- Common Table Expression (CTE) named CTE is used to calculate LEAD values
-- for the num column in the Logs table.

WITH CTE AS(
	SELECT num,
    LEAD(num,1) OVER() AS num1,
    LEAD(num,2) OVER() AS num2
	FROM Logs
)

-- The following query selects distinct num values from the CTE where
-- three consecutive numbers are found.

SELECT DISTINCT num AS ConsecutiveNums
FROM CTE
WHERE (num=num1) and (num1=num2);