
/* Write your T-SQL query statement below */

select s.id, s.name 
from Students s
where not exists (
    select * from Departments d 
    where d.id = s.department_id
)