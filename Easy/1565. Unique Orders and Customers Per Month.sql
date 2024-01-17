/*
1565. Unique Orders and Customers Per Month
Easy
73
43
SQL Schema
Table: Orders

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| order_id      | int     |
| order_date    | date    |
| customer_id   | int     |
| invoice       | int     |
+---------------+---------+
order_id is the primary key for this table.
This table contains information about the orders made by customer_id.
 

Write an SQL query to find the number of unique orders and the number of unique customers with invoices > $20 for each different month.

Return the result table sorted in any order.

The query result format is in the following example.

 

Example 1:

Input: 
Orders table:
+----------+------------+-------------+------------+
| order_id | order_date | customer_id | invoice    |
+----------+------------+-------------+------------+
| 1        | 2020-09-15 | 1           | 30         |
| 2        | 2020-09-17 | 2           | 90         |
| 3        | 2020-10-06 | 3           | 20         |
| 4        | 2020-10-20 | 3           | 21         |
| 5        | 2020-11-10 | 1           | 10         |
| 6        | 2020-11-21 | 2           | 15         |
| 7        | 2020-12-01 | 4           | 55         |
| 8        | 2020-12-03 | 4           | 77         |
| 9        | 2021-01-07 | 3           | 31         |
| 10       | 2021-01-15 | 2           | 20         |
+----------+------------+-------------+------------+
Output: 
+---------+-------------+----------------+
| month   | order_count | customer_count |
+---------+-------------+----------------+
| 2020-09 | 2           | 2              |
| 2020-10 | 1           | 1              |
| 2020-12 | 2           | 1              |
| 2021-01 | 1           | 1              |
+---------+-------------+----------------+
Explanation: 
In September 2020 we have two orders from 2 different customers with invoices > $20.
In October 2020 we have two orders from 1 customer, and only one of the two orders has invoice > $20.
In November 2020 we have two orders from 2 different customers but invoices < $20, so we don't include that month.
In December 2020 we have two orders from 1 customer both with invoices > $20.
In January 2021 we have two orders from 2 different customers, but only one of them with invoice > $20.
*/

/*
Grouping by customer_id or order_id would provide very different results and wouldn't make sense in this context. Let me explain why:

Grouping by customer_id:

If you group by customer_id, you would essentially get one row for each unique customer who made an order that meets the invoice > 20 condition. 
This means that you would have a separate row for each customer, and the aggregate functions (like COUNT) would count the number of orders and customers, r
espectively, for each individual customer. This would not give you a meaningful summary of your data because you would have as many rows as there are unique customers.
It wouldn't provide insights into monthly trends, which is often a key aspect of data analysis.
Grouping by order_id:

If you group by order_id, you would again have one row for each unique order that meets the invoice > 20 condition. 
This would not give you monthly summaries but rather a list of individual orders. 
The aggregate functions would count the number of orders and customers, 
which would be the same as the total number of orders and customers in this context.
This grouping doesn't provide insights into monthly trends either.
The primary goal of the original query is to provide a monthly summary of orders and customers, which is why it's appropriate to group by month (derived from order_date). This allows you to see how many orders were placed and how many unique customers made purchases each month, helping you analyze trends and make informed decisions based on monthly data. Grouping by customer_id or order_id wouldn't serve this purpose.
*/

SELECT DATE_FORMAT(order_date, "%Y-%m") AS month,
       COUNT(DISTINCT order_id) AS order_count,
       COUNT(DISTINCT customer_id) AS customer_count
FROM orders
WHERE invoice > 20
GROUP BY DATE_FORMAT(order_date, "%Y-%m")
