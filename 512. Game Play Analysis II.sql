
/* Write your T-SQL query statement below */

select distinct player_id, x.device_id
from Activity a
cross apply (
    select top 1 device_id
    from Activity a2
    where a2.player_id = a.player_id
    order by event_date
) x
