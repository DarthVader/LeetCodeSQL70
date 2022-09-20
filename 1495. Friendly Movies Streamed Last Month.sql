
/* Write your T-SQL query statement below */

select distinct c.title
from Content c
left join TVProgram p 
    on p.content_id = c.content_id
where c.Kids_content = 'Y'
and left(program_date, 7) = '2020-06'
and content_type = 'Movies'