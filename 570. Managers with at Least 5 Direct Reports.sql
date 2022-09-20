
/* Write your T-SQL query statement below */

select min(x.name) name
from Employee e
cross apply (
    select e2.name 
    from Employee e2 
     where id = e.managerId
) x
group by managerId
having count(*)>=5