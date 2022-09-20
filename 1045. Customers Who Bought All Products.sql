
/* Write your T-SQL query statement below */

select customer_id
from Customer c
group by c.customer_id
having count(distinct product_key) = (select count(1) from Product)