
/* Write your T-SQL query statement below */

select distinct s.buyer_id
from Product p
inner join Sales s
    on p.product_id = s.product_id
where p.product_name = 'S8' 
and not exists (   
    select max(s2.buyer_id)
    from Sales s2
    inner join Product p2
        on p2.product_id = s2.product_id
    where p2.product_name = 'iPhone'
        and s.buyer_id = s2.buyer_id
    group by buyer_id
)
