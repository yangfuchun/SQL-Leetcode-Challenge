/*
613. Shortest Distance in a Line
Easy

Table: Point

+-------------+------+
| Column Name | Type |
+-------------+------+
| x           | int  |
+-------------+------+
In SQL, x is the primary key column for this table.
Each row of this table indicates the position of a point on the X-axis.
 

Find the shortest distance between any two points from the Point table.

The result format is in the following example.

 

Example 1:

Input: 
Point table:
+----+
| x  |
+----+
| -1 |
| 0  |
| 2  |
+----+
Output: 
+----------+
| shortest |
+----------+
| 1        |
+----------+
Explanation: The shortest distance is between points -1 and 0 which is |(-1) - 0| = 1.
 

Follow up: How could you optimize your solution if the Point table is ordered in ascending order?
*/
SELECT MIN(abs(p1.x-p2.x)) AS shortest
FROM Point p1 JOIN Point p2 On P1.x != p2.x