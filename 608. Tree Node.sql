
/* Write your T-SQL query statement below */

select id, 
    iif(isnull(p_id, 0)=0, 'Root',
       iif(
           (select count(1) 
            from Tree t2
            where t2.p_id = t.id
           ) = 0, 
           'Leaf', 
           'Inner')
       ) type
from Tree t