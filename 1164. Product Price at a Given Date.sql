
/* Write your T-SQL query statement below */

select distinct 
    p.product_id, isnull(x.new_price, 10) price
from Products p
outer apply (
    select top 1 p2.new_price
    from Products p2
    where p2.product_id = p.product_id
    and p2.change_date <= '2019-08-16'
    order by p2.change_date desc
) x