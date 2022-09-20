
/* Write your T-SQL query statement below */

with
u as (
    select top 1 name results
    from MovieRating r
    inner join Users u on u.user_id = r.user_id
    group by u.name
    order by count(*) desc, name
),
m as (
    select top 1 title results from (
        select title, avg(1.0*rating) rating
        from MovieRating r
        inner join Movies m on m.movie_id = r.movie_id
        where left(created_at, 7) = '2020-02'
        group by title
    ) t
    order by rating desc, title
)
select results from u
union all
select results from m