
/* Write your T-SQL query statement below */

with t as (
    select transaction_date dt, user_id, count(*) transactions_count
    from Transactions
    group by transaction_date, user_id
), 

v as (
    select visit_date dt, user_id, count(*) visits_count
    from Visits
    group by visit_date, user_id
),

u as (
    select dt, user_id, transactions_count, 0 visits_count from t
    union all
    select dt, user_id, 0 transactions_count, visits_count from v
),

j as (
    select dt, user_id, 
        isnull(sum(transactions_count), 0) transactions_count,
        isnull(sum(visits_count), 0) visits_count
    from u
    group by dt, user_id
),

g as ( -- rcte generator
    select 0 id, 
        (select max(transactions_count) from j) max_tc 
    union all
    select id+1, max_tc from g
    where id < max_tc -- up to max transactions_count 
) 

select g.id transactions_count, isnull(sum(visits_count), 0) visits_count
from g left join j on g.id = j.transactions_count
group by g.id
order by g.id