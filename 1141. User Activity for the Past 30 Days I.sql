
/* Write your T-SQL query statement below */

select activity_date day, count(distinct user_id) active_users
from Activity
where activity_date > dateadd(day, -30, '2019-07-27')
    -- and activity_date<='2019-07-27'
group by activity_date