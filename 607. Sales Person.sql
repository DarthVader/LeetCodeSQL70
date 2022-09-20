
/* Write your T-SQL query statement below */

select s.name from SalesPerson s
where not exists (
    select *
    from Company c
    inner join Orders o on o.com_id = c.com_id and c.name = 'RED'
    where s.sales_id = o.sales_id
    )
