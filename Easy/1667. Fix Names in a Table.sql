/*
1667. Fix Names in a Table
Easy

Table: Users

+----------------+---------+
| Column Name    | Type    |
+----------------+---------+
| user_id        | int     |
| name           | varchar |
+----------------+---------+
user_id is the primary key (column with unique values) for this table.
This table contains the ID and the name of the user. The name consists of only lowercase and uppercase characters.
 

Write a solution to fix the names so that only the first character is uppercase and the rest are lowercase.

Return the result table ordered by user_id.

The result format is in the following example.

 

Example 1:

Input: 
Users table:
+---------+-------+
| user_id | name  |
+---------+-------+
| 1       | aLice |
| 2       | bOB   |
+---------+-------+
Output: 
+---------+-------+
| user_id | name  |
+---------+-------+
| 1       | Alice |
| 2       | Bob   |
+---------+-------+
*/
-- Extract the first 3 characters from the "name" column:
-- SELECT SUBSTR(name, 1, 3) FROM YourTable;
-- Extract the first 3 characters from the "name" column:
-- SELECT SUBSTR(description, 4) FROM YourTable;
-- Extract the last 5 characters from the "code" column:
-- SELECT SUBSTR(code, LENGTH(code) - 4 + 1) FROM YourTable;

SELECT
    CONCAT(UPPER(SUBSTR(name, 1, 1)), LOWER(SUBSTR(name, 2))) AS name
FROM
    Users;
