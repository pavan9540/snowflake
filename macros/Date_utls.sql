{% macro get_season(x) %}

CASE WHEN MONTH(to_timestamp({{x}})) IN (12,1,2) 
    THEN 'WINTER'
    WHEN month(to_timestamp({{x}})) IN (3,4,5)
    THEN 'SPRING'
    WHEN month(to_timestamp({{x}})) IN (6,7,8)
    THEN 'SUMMER'
    ELSE 'AUTUM'
    END 

{% endmacro %}

{%macro day_type(x)%}

CASE
    WHEN dayname(to_timestamp(started_at)) IN ('SAT','SUN')
    THEN 'WEEKEND'
    ELSE 'BUSINESSDAY'
    END

{% endmacro %}