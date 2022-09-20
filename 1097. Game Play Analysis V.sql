
/* Write your T-SQL query statement below */

select install_dt, sum(installs) installs,
    cast(round(
        sum(retention)  / 
        sum(cast(installs as decimal(8, 4))), 2) as decimal(8,2)
        ) Day1_retention
from (
        
    select player_id, min(a.event_date) install_dt, 1 installs, 
        isnull(max(x.retention), 0) retention
    from Activity a
    outer apply(
        select min(event_date) day1 from Activity a3 where a3.player_id = a.player_id group by player_id
    ) day1
    outer apply (
        select top 1 1 retention
        from Activity a2
        where a2.player_id = a.player_id
        and dateadd(day, -1, a2.event_date) = day1.day1
    ) x
    group by player_id

) t group by install_dt