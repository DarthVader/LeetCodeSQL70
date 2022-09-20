
/* Write your T-SQL query statement below */

select  gender, day, 
    sum(score) over (partition by gender order by day) total
from (
    select gender, day, sum(score_points) score
    from Scores
    group by gender, day
) t
order by gender, day