{{
    config(materialized='table')
}}

with cte as (
select * from {{ ref('bike_stage') }}
where RIDE_ID!='ride_id' and  STARTED_AT != 'started_at' and STARTED_AT != '"started_at"'
)
select 
start_statio_id as start_station_id,
start_station_name,
start_lat,
start_lng
from cte 