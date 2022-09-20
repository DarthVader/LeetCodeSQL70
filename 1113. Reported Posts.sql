
/* Write your PL/SQL query statement below */

select extra report_reason, count(distinct post_id) report_count
from Actions
where action='report' and extra is not null
    and action_date = '2019-07-04'
group by extra