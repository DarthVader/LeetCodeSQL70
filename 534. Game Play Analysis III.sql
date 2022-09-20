
/* Write your T-SQL query statement below */

select player_id, event_date,
    (select sum(games_played) 
     from Activity a2 
     where a.player_id = a2.player_id 
     and a2.event_date<=a.event_date) games_played_so_far
from Activity a