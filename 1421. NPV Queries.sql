
/* Write your T-SQL query statement below */

select q.id, q.year, isnull(npv, 0) npv
from Queries q
outer apply (
    select npv 
    from NPV n 
    where n.id = q.id 
    and n.year = q.year
) x