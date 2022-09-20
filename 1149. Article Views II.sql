
/* Write your T-SQL query statement below */

select distinct viewer_id id
from Views
group by view_date, viewer_id
having count(distinct article_id)>1