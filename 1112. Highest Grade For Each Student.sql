
/* Write your T-SQL query statement below */

select student_id, 
    min(x.course_id) course_id, 
    max(x.grade) grade
from Enrollments e
cross apply (
    select top 1 e2.grade, e2.course_id
    from Enrollments e2
    where e2.student_id = e.student_id
    order by e2.grade desc, e2.course_id
) x
group by student_id
order by student_id