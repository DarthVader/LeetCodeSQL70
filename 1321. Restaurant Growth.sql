
/* Write your T-SQL query statement below */

select visited_on, amount, cast(average_amount as decimal(8, 2)) average_amount from (
    select visited_on, 
        sum(amount) over (order by visited_on rows between 6 preceding and current row) amount,
        round(avg(amount*1.0) over (order by visited_on rows between 6 preceding and current row), 2) average_amount,
        row_number() over (order by visited_on) rn
    from (
        select visited_on, sum(amount) amount
        from Customer
        group by visited_on
    ) t
) t
where rn > 6
order by visited_on