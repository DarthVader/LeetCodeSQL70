
/* Write your T-SQL query statement below */

with gen as (
	select 1 i union all select i+1	from gen where i<100
),
prep as (
	select product_id, period_start, period_end,
		year(period_start) ys,
		year(period_end) ye,
		average_daily_sales
	from Sales s
),

calc as (
	select p.*, cast(report_year as varchar(4)) report_year, 
    dt.year_start, dt.year_end, ps.dt ps, pe.dt pe
	from prep p
	cross apply (
		select i-1+p.ys report_year from gen where i<=datediff(year, period_start, period_end)+1
	) x	
	cross apply (
		select cast(cast(report_year as varchar(4)) as date) year_start,
		dateadd(year, 1, dateadd(day, -1, cast(cast(report_year as varchar(4)) as date))) year_end
	) dt
	cross apply (
		select max(dt) dt from (
			select dt.year_start dt
			union all
			select p.period_start
		) d
	) ps
	cross apply (
		select min(dt) dt from (
			select dt.year_end dt
			union all
			select p.period_end
		) d
	) pe
)

select s.product_id, p.product_name, report_year, (datediff(day, ps, pe)+1) * average_daily_sales total_amount
from calc s
inner join Product p on s.product_id = p.product_id
order by s.product_id, report_year