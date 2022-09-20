
/* Write your T-SQL query statement below */

select product_name, sum(unit) unit
from Orders o
inner join Products p on p.product_id = o.product_id
where left(order_date, 7) = '2020-02'
group by product_name
having sum(unit)>=100