
/* Write your T-SQL query statement below */

select country_name, 
    case 
        when avg(weather_state*1.0) <= 15 then 'Cold'
        when avg(weather_state*1.0) >= 25 then 'Hot'
        else 'Warm'
    end weather_type
from Countries c
inner join Weather w on w.country_id = c.country_id
where day between '2019-11-01' and '2019-11-30'
group by country_name
order by 1