
/* Write your T-SQL query statement below */

select distinct employee_id 
from  Employees
where employee_id != 1 and (
    manager_id = 1  -- level 1
    or manager_id in ( -- level 2
            select employee_id from Employees where manager_id = 1
        ) 
    or manager_id in ( -- level 3
            select employee_id from Employees where manager_id in (
                select employee_id from Employees where manager_id = 1
            )
        )
    )