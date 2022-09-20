
/* Write your T-SQL query statement below */

select cast(round(100.0 *
(select count(*) p from Delivery where order_date = customer_pref_delivery_date) /
(select count(*) t from Delivery)
, 2) as decimal(8,2)) immediate_percentage


