
/* Write your T-SQL query statement below */

select (select unique_id from EmployeeUNI eu where eu.id = e.id) unique_id, name
from Employees e