
/* Write your T-SQL query statement below */

select cast(round(cast(
(
    select count(*) q
    from Activity a
    cross apply (
        select dateadd(day, 1, min(event_date)) event_date
        from Activity a2
        where a2.player_id = a.player_id
        group by a2.player_id
    ) x
    where a.event_date = x.event_date
)
as decimal(8, 2))
/
(select count(distinct player_id) from Activity)
, 2) as decimal(8, 2))

fraction
