
/* Write your T-SQL query statement below */

with 
c1 as (
    select log_id,
        log_id - row_number() over (order by log_id) grp
    from Logs
) 
select min(log_id) start_id, max(log_id) end_id
from c1
group by grp
order by 1
