
/* Write your T-SQL query statement below */

select distinct author_id id
from Views
where author_id=viewer_id
order by author_id