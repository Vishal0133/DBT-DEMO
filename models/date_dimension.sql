{{ config(materialized='table') }}
WITH cte AS (
  SELECT
    TO_TIMESTAMP_NTZ(started_at)                                   AS started_at_ts,
    DATE(TO_TIMESTAMP_NTZ(started_at))                             AS date_started_at,
    HOUR(TO_TIMESTAMP_NTZ(started_at))                             AS hour_started_at,
    {{day_type('started_at')}}                                     AS day_type,
    {{ season_format('started_at') }}                              AS season_of_year
  FROM {{ source('demo','bike') }}
  WHERE started_at <> 'started_at'
    AND TRY_TO_TIMESTAMP_NTZ(started_at) IS NOT NULL
)
SELECT *
FROM cte
