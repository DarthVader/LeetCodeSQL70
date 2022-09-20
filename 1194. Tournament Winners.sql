
/* Write your T-SQL query statement below */

with t as (
    select group_id, player_id, sum(first_score) score
    from Players p 
    inner join Matches m on m.first_player = p.player_id
    group by group_id, player_id
    union all
    select group_id, player_id, sum(second_score) score
    from Players p 
    inner join Matches m on m.second_player = p.player_id
    group by group_id, player_id
),
s as (
    select group_id, player_id, sum(score) score
    from t
    group by group_id, player_id
),
m as (
    select group_id, player_id,
    rank() over (partition by group_id order by score desc, player_id) rnk
    from s
)
select group_id, player_id
from m
where rnk = 1