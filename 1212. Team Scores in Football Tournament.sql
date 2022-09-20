
/* Write your T-SQL query statement below */

select t.team_id, t.team_name, isnull(sum(m.points), 0) num_points
from (
    select host_team team_id, 3 points from Matches where host_goals > guest_goals
    union all
    select guest_team team_id, 3 points from Matches where host_goals < guest_goals
    union all
    select host_team team_id, 1 points from Matches where host_goals = guest_goals
    union all
    select guest_team team_id, 1 points from Matches where host_goals = guest_goals
) m
right join Teams t on t.team_id = m.team_id
group by t.team_id, t.team_name
order by sum(m.points) desc, t.team_id
