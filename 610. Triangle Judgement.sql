
/* Write your T-SQL query statement below */

select x ,y, z, 
	iif (x + y > z and y + z > x and x + z > y, 'Yes', 'No') triangle
from Triangle