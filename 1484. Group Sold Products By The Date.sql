
/* Write your T-SQL query statement below */

select a1.sell_date, count(distinct a1.product) num_sold, 
    min(products) products
from Activities a1
cross apply (
    select stuff(
        (   select ',' + a2.product
            from Activities a2
            where a2.sell_date = a1.sell_date
            group by a2.product
            order by a2.product
            for xml path('')
        )
        , 1, 1, '') 
) x (products)
group by a1.sell_date