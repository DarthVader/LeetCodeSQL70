
/* Write your T-SQL query statement below */

select sale_date, diff = apples - oranges
from (
    select fruit, sale_date, sum(sold_num) sold_num
    from Sales
    group by sale_date, fruit
) st
pivot (
    sum(sold_num) 
    for fruit in ([apples], [oranges])
) pt
order by sale_date