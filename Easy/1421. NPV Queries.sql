/*
1421. NPV Queries
Easy
50
286
company
Amazon
SQL Schema
Pandas Schema
Table: NPV

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| year          | int     |
| npv           | int     |
+---------------+---------+
(id, year) is the primary key (combination of columns with unique values) of this table.
The table has information about the id and the year of each inventory and the corresponding net present value.
 

Table: Queries

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| year          | int     |
+---------------+---------+
(id, year) is the primary key (combination of columns with unique values) of this table.
The table has information about the id and the year of each inventory query.
 

Write a solution to find the npv of each query of the Queries table.

Return the result table in any order.

The result format is in the following example.

 

Example 1:

Input: 
NPV table:
+------+--------+--------+
| id   | year   | npv    |
+------+--------+--------+
| 1    | 2018   | 100    |
| 7    | 2020   | 30     |
| 13   | 2019   | 40     |
| 1    | 2019   | 113    |
| 2    | 2008   | 121    |
| 3    | 2009   | 12     |
| 11   | 2020   | 99     |
| 7    | 2019   | 0      |
+------+--------+--------+
Queries table:
+------+--------+
| id   | year   |
+------+--------+
| 1    | 2019   |
| 2    | 2008   |
| 3    | 2009   |
| 7    | 2018   |
| 7    | 2019   |
| 7    | 2020   |
| 13   | 2019   |
+------+--------+
Output: 
+------+--------+--------+
| id   | year   | npv    |
+------+--------+--------+
| 1    | 2019   | 113    |
| 2    | 2008   | 121    |
| 3    | 2009   | 12     |
| 7    | 2018   | 0      |
| 7    | 2019   | 0      |
| 7    | 2020   | 30     |
| 13   | 2019   | 40     |
+------+--------+--------+
Explanation: 
The npv value of (7, 2018) is not present in the NPV table, we consider it 0.
The npv values of all other queries can be found in the NPV table.
*/

/*
/*
In a SQL JOIN, the conditions specified in the ON clause determine how rows from the joined tables are matched. 
In this case, you want to match rows from the Queries table with rows from the NPV table 
based on both the id and year columns. Using AND in the ON clause correctly combines these conditions, 
ensuring that rows are matched on both columns simultaneously.
*/


SELECT
    q.id,
    q.year,
    COALESCE(n.npv, 0) AS npv
FROM
    Queries q
LEFT JOIN
    NPV n
ON
    q.id = n.id AND q.year = n.year;
