
/* Write your T-SQL query statement below */

select s.seller_id
from Sales s
group by s.seller_id
having sum(s.price) = 
(
    select top 1 sum(price)
    from Sales 
    group by seller_id
    order by sum(price) desc
)