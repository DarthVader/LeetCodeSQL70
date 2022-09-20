
/* Write your T-SQL query statement below */

select cast(round(avg(daily_percent), 2) as decimal(8, 2)) average_daily_percent 
from (
    select action_date, sum(removal) removal, sum(spam) spam,
        100.0 * sum(removal) / sum(spam) daily_percent
    from (
        select a.post_id, a.action_date, 
            count(distinct a.post_id) spam, 
            count(distinct r.post_id) removal
        from Actions a
        left join Removals r on r.post_id = a.post_id
        where extra = 'spam'
        group by a.post_id, a.action_date
       ) t
    group by action_date--    order by action_date
) t