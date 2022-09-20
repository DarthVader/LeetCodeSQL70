
/* Write your T-SQL query statement below */

select country
from (
    select cn.name country, duration 
    from Calls c
    inner join Person p on c.caller_id = p.id
    inner join Country cn on cn.country_code = left(p.phone_number, 3)
    union all
    select cn.name country, duration 
    from Calls c
    inner join Person p on c.callee_id = p.id
    inner join Country cn on cn.country_code = left(p.phone_number, 3)
) t
group by t.country
having avg(cast(t.duration as decimal(8,2))) > 
    (select avg(cast(duration as decimal(8,2))) from Calls)