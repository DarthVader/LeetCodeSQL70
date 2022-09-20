
/* Write your T-SQL query statement below */

select dept_name,
    (   select count(1) from Student s 
        where s.dept_id = d.dept_id
    ) student_number
from Department d
order by 2 desc, 1