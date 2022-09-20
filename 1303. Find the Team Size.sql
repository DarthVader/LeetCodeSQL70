
/* Write your T-SQL query statement below */

select employee_id, count(1) over (partition by team_id) team_size
from Employee e