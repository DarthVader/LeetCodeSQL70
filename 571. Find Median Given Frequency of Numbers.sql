
/* Write your T-SQL query statement below */

with gen(i) as (
	select 1 i
	union all
	select i+1 from gen where i<100
),
median as (
	select num, frequency
		, PERCENTILE_CONT(0.5) within group (order by num) over () Median
	from Numbers
	cross apply (
		select i from gen where i<=frequency
	) x
)
select top 1 median from median