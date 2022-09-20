
/* Write your T-SQL query statement below */

select u.name, sum(isnull(r.distance, 0)) travelled_distance
from Users u
left join Rides r on u.id = r.user_id
group by u.name
order by sum(r.distance) desc, u.name