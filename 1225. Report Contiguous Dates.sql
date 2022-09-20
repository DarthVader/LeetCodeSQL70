
/* Write your T-SQL query statement below */

;with s as (
    select success_date dt, lag(success_date) over (order by success_date) prev
    from Succeeded s
    where s.success_date between '2019-01-01' and '2019-12-31'
)
,
f as (
    select fail_date dt, lag(fail_date) over (order by fail_date) prev
    from Failed f
    where fail_date between '2019-01-01' and '2019-12-31'
)
,
grp as (
	select 'succeeded' period_state, dt, prev, sum(iif(datediff(day, prev, dt)=1, null, 1)) over (order by dt) grp from s
	union all
	select 'failed' period_state, dt, prev, sum(iif(datediff(day, prev, dt)=1, null, 1)) over (order by dt) grp from f
)
select distinct period_state,
	first_value(dt) over (partition by period_state, grp order by dt) [start_date],
	first_value(dt) over (partition by period_state, grp order by dt desc) end_date
from grp
order by [start_date]