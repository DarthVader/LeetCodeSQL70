
/* Write your T-SQL query statement below */

select e.business_id
from Events e
cross apply (
    select event_type, avg(cast(occurences as float)) occurences_avg
    from Events
    group by event_type
    having count(business_id)>1 
) x
where e.occurences > x.occurences_avg
    and e.event_type = x.event_type
group by e.business_id
having count(1)>1 