
/* Write your T-SQL query statement below */

select distinct
	pay_month, department_id, --dep_avg, company_avg,
	iif(dep_avg > company_avg, 'higher', 
		iif(dep_avg < company_avg, 'lower', 'same')
		) comparison
from (
	select 
		LEFT(pay_date, 7) pay_month, 
		department_id,
		AVG(cast(amount as decimal(10, 2))) over (partition by LEFT(pay_date, 7)) company_avg,
		AVG(cast(amount as decimal(10, 2))) over (partition by LEFT(pay_date, 7), department_id) dep_avg
	from Salary s
	inner join Employee e on e.employee_id = s.employee_id
) t
order by department_id, pay_month