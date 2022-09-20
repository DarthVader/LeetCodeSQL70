
/* Write your T-SQL query statement below */

select distinct u.username, x.activity, x.startDate, x.endDate
from UserActivity u
cross apply (
    select top 1 t.activity, t.startDate, t.endDate
    from (
            select top 2 u2.activity, u2.startDate, u2.endDate
            from UserActivity u2
            where u2.username = u.username
            order by u2.startDate desc
        
        ) t order by t.startDate
) x
