{{
    config(materialized='table')
}}

with cte as (
select * from {{source('demo','bike')}}
where RIDE_ID!='ride_id'
)
select 
start_statio_id as start_station_id,
start_station_name,
start_lat,
start_lng
from cte 