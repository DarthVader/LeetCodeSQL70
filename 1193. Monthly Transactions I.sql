
/* Write your T-SQL query statement below */

select left(trans_date, 7) month, country, 
    count(*) trans_count,
    sum(approved) approved_count,
    sum(amount) trans_total_amount,
    sum(approved_amount) approved_total_amount 
from (
    select *, 
        iif(state='approved', 1, 0) approved,
        iif(state='approved', 1, 0) * amount approved_amount
    from Transactions
) t
group by left(trans_date, 7), country
