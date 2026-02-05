{{ config(materialized='table') }}
with CTE as(
    select * from 
    {{ source('demo','weather') }}
)
select 
date(time) as daily_weather,
weather,
round(avg(temp),2) as avg_temp,
round(avg(pressure),2) as avg_pressure,
round(avg(humidity),2) as avg_humidity
from CTE
group by daily_weather,weather
qualify row_number() OVER (partition by daily_weather order by count(weather) desc )=1

--for each weather type start with one 
--qualify row_number() OVER (partition by daily_weather order by count(weather) desc )=1