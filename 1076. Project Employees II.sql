
/* Write your T-SQL query statement below */

select project_id  
from Project p
group by project_id
having count(distinct employee_id) =
    (select top 1 count(distinct employee_id) 
     from Project p2 
     group by project_id 
     order by count(*) desc)