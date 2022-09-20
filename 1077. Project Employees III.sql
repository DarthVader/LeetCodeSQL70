
/* Write your T-SQL query statement below */

select distinct project_id, p.employee_id
from Employee e
inner join Project p on e.employee_id = p.employee_id
cross apply
(   select 1 a
    from Employee e2
    inner join Project p2 on e2.employee_id = p2.employee_id
    where p.project_id = p2.project_id
    group by p2.project_id
    having max(e2.experience_years) = e.experience_years 
) x
