
/* Write your T-SQL query statement below */

select book_id, name
    --, sum(quantity) qty 
from (
    select b.book_id, b.name, available_from, 
        isnull(dispatch_date, '2010-01-01') dispatch_date, 
        isnull(o.quantity, 0) quantity
    from Books b
    left join Orders o on o.book_id = b.book_id
        and dispatch_date between dateadd(year, -1, '2019-06-23') and '2019-06-22'
) t
where available_from < dateadd(month, -1, '2019-06-23')
group by book_id, name
having sum(quantity) < 10
