
/* Write your T-SQL query statement below */

select student_id, student_name
from (
    select s.student_id, s.student_name,
         iif (e.score > b.min_score and e.score < max_score, 0, 1) is_not_quiet
    from Student s 
    inner join Exam e on e.student_id = s.student_id
    
    cross apply (
        select min(e2.score) min_score, max(e2.score) max_score
        from Exam e2
        where e.exam_id = e2.exam_id
        group by e2.exam_id
    ) b
) t
group by student_id, student_name
having sum(is_not_quiet) = 0
order by student_id
    