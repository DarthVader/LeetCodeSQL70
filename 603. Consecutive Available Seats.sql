
/* Write your T-SQL query statement below */

select c.seat_id
FROM (
	select seat_id, free,
	LAG(free, 1) over (order by seat_id)  prv,
	LEAD(free, 1) over (order by seat_id) nxt
	from Cinema
) c
where (c.prv=1 AND c.free=1) OR (c.nxt=1 AND c.free=1)
order by c.seat_id
