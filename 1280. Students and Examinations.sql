
/* Write your T-SQL query statement below */

select s.student_id, s.student_name, sub.subject_name, 
    (select count(*) from Examinations e 
     where s.student_id = e.student_id
     and e.subject_name = sub.subject_name
    ) attended_exams
from Students s
cross join Subjects sub
group by s.student_id, subject_name, s.student_name
order by s.student_id, subject_name