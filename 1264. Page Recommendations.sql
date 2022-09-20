
/* Write your T-SQL query statement below */

with f as (
    select user2_id user_id
    from Friendship
    where user1_id = 1
    union all
    select user1_id
    from Friendship
    where user2_id = 1
)

select distinct l.page_id recommended_page
from Likes l
inner join f on f.user_id = l.user_id
where page_id not in (
    select page_id from Likes where user_id = 1
)