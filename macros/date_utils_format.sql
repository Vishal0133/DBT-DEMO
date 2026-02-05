{% macro season_format(started_at) %}

CASE
      WHEN MONTH(TO_TIMESTAMP_NTZ({{started_at}})) IN (11,12,1,2) THEN 'Winter'
      WHEN MONTH(TO_TIMESTAMP_NTZ({{started_at}})) IN  (3,4,5,6)    THEN 'Summer'
      ELSE 'Rainy'
END                                                         

{% endmacro %}

{%macro day_type(started_at) %}
 CASE
      WHEN DAYNAME(TO_TIMESTAMP_NTZ({{started_at}})) IN ('Sat','Sun') THEN 'Weekend'
      ELSE 'BusinessDay'
END    
{% endmacro %}