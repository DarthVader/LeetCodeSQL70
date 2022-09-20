
/* Write your T-SQL query statement below */

select project_id, cast(avg(cast(experience_years as decimal(8,2))) as decimal(8, 2)) average_years 
from Project p
inner join Employee e on p.employee_id = e.employee_id 
group by project_id  