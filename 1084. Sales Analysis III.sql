
/* Write your T-SQL query statement below */

select distinct p.product_id, p.product_name
from Sales s
inner join Product p on p.product_id = s.product_id
where s.sale_date between '2019-01-01' and '2019-03-31'
and not exists (
    select * from Sales s2 where s2.product_id = s.product_id
    and s2.sale_date not between '2019-01-01' and '2019-03-31'
)