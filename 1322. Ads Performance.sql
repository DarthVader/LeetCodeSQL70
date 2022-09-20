
/* Write your T-SQL query statement below */

with pt as (
    select * from (
        select ad_id, action
        from Ads
    ) st
    pivot (
        count(action)
        for action 
        in ([Clicked], [Viewed], [Ignored])
    ) pt
)
select ad_id, iif(Clicked + Viewed = 0, 0,
    cast(round(100.0 * Clicked / (Clicked + Viewed), 2) as decimal(8,2))
    ) ctr
from pt
order by ctr desc, ad_id