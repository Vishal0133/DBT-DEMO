{{ config(materialized='table') }}

with CTE as 
(
    SELECT 
    T.* ,
    D.*
    FROM {{ ref('Trip_Fact') }} T 
    LEFT JOIN {{ ref('daily_weather') }} D
    ON T.TRIP_DATE=D.DAILY_WEATHER
) 
SELECT * FROM CTE