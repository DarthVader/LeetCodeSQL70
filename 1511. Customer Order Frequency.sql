
/* Write your T-SQL query statement below */

select customer_id, name
    --, sum(amount_06) amount_06, sum(amount_07) amount_07
from (
    select o.customer_id, c.name, sum(quantity * price) amount_06, 0 amount_07
    from Orders o
    inner join Product p on p.product_id = o.product_id
    inner join Customers c on c.customer_id = o.customer_id
    where left(order_date, 7) = '2020-06' 
    group by o.customer_id, c.name
    having sum(quantity * price) >= 100

    union all

    select o.customer_id, c.name, 0 amount_06, sum(quantity * price) amount_07
    from Orders o
    inner join Product p on p.product_id = o.product_id
    inner join Customers c on c.customer_id = o.customer_id
    where left(order_date, 7) = '2020-07' 
    group by o.customer_id, c.name
    having sum(quantity * price) >= 100
) u
group by customer_id, name
having sum(amount_06)>=100 and sum(amount_07)>=100