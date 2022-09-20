
/* Write your T-SQL query statement below */

select company_id, employee_id, employee_name,
    cast(round(s.salary * (1 - tax_rate), 0) as int) salary
from Salaries s

cross apply (
    select iif(max(salary) < 1000, 0.0, 
           iif(max(salary) > 10000, 0.49, 0.24)) tax_rate
    from Salaries s2
    where s2.company_id = s.company_id
    group by s2.company_id
) m
