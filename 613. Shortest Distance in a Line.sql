
/* Write your T-SQL query statement below */

select min(distance) shortest from (
    select abs(x - lag(x) over (order by x)) distance from Point
) t