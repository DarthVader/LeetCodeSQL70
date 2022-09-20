
/* Write your T-SQL query statement below */

select [month], country, 
    sum(approved_count) approved_count, sum(approved_amount) approved_amount,
    sum(chargeback_count) chargeback_count, sum(chargeback_amount) chargeback_amount
from (
    select left(trans_date, 7) [month], country, 
        count(*) approved_count, sum(amount) approved_amount,
        0 chargeback_count, 0 chargeback_amount
    from Transactions t
    where state = 'approved'
    group by left(trans_date, 7), country
    union all
    select left(c.trans_date, 7) [month], country, 
        0 approved_count, 0 approved_amount, 
        count(*) chargeback_count, sum(amount) chargeback_amount
    from Chargebacks c
    inner join Transactions t on c.trans_id = t.id
    group by left(c.trans_date, 7), country
) t
group by [month], country