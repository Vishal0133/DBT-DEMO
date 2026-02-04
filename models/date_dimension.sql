WITH CTE AS(
    SELECT to_timestamp_ntz(started_at),
    DATE(to_timestamp_ntz(started_at)) as date_started_at,
    HOUR(to_timestamp_ntz(started_at)) as hour_started_at,
CASE
    WHEN dayname(to_timestamp_ntz(started_at)) in ('Sat','Sun') 
    THEN 'Weekend'
    ELSE 'BussinessDay'
    END as day_type,
CASE
    WHEN MONTH(to_timestamp_ntz(started_at)) in (11,12,1,2) 
    THEN 'Winter'
    WHEN MONTH(to_timestamp_ntz(started_at)) in (3,4,5,6) 
    THEN 'Summer'
    WHEN MONTH(to_timestamp_ntz(started_at)) in (3,4,5,6) 
    THEN 'Summer'
    ELSE 'Rainy'
    END as Station_of_year
    FROM {{source('demo','bike')}}
    WHERE STARTED_AT!='started_at'
)

SELECT 
* 
FROM  CTE