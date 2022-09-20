
/* Write your T-SQL query statement below */

select t.product_id, round(sum(t.price) / sum(t.units), 2) average_price 
from (
    select u.product_id, u.units, u.units * p.price * 1.0 price
    from UnitsSold u
    inner join Prices p on p.product_id = u.product_id 
        and u.purchase_date between p.start_date and p.end_date
) t
group by t.product_id