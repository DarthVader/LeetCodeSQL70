
/* Write your T-SQL query statement below */

select name customer_name, customer_id,
    order_id, order_date
from Customers c
cross apply (
    select top 3 order_id, order_date
    from Orders o
    where o.customer_id = c.customer_id
    order by o.order_date desc
) o
order by name, customer_id, order_date desc
