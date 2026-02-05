{{ config(materialized='table') }}

With CTE as (
    select * from  {{ source('demo', 'bike') }}
    limit 10
)
select 
RIDE_ID,
RIDEABLE_TYPE,
DATE(to_timestamp(STARTED_AT)) as TRIP_DATE,
START_STATIO_ID as START_STATION_ID,
MEMBER_CSUAL as MEMBER_CASUAL,
datediff('second', to_timestamp(started_at), to_timestamp(ended_at)) as trip_duration_in_seconds
from CTE