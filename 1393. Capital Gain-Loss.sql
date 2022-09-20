
/* Write your T-SQL query statement below */

select stock_name, 
sum(price * iif(operation='Buy', -1, 1)) capital_gain_loss
from Stocks
group by stock_name
order by stock_name