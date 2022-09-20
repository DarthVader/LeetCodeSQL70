

/* Write your T-SQL query statement below */

with r as (
    select top 1 weight, person_name, turn
    from Queue
    where turn = 1
    order by turn
    union all
    select r.weight + a.weight, a.person_name, a.turn
    from r
    inner join Queue a on r.turn + 1  = a.turn
    where r.weight < 1000
)
select top 1 person_name 
from r
where r.weight <= 1000
order by turn desc