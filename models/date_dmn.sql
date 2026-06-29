with cte as (
    select 

    to_timestamp(started_at) as STARTED_DATE,
    date(to_timestamp(started_at)) as DATE_STARTED_AT,
    hour(to_timestamp(started_at)) as HOUR_STARTED_AT,
    CASE
    WHEN dayname(to_timestamp(started_at)) IN ('SAT','SUN')
    THEN 'WEEKEND'
    ELSE 'BUSINESSDAY'
    END AS DAY_TYPE,

    CASE WHEN MONTH(to_timestamp(started_at)) IN (12,1,2) 
    THEN 'WINTER'
    WHEN month(to_timestamp(started_at)) IN (3,4,5)
    THEN 'SPRING'
    WHEN month(to_timestamp(started_at)) IN (6,7,8)
    THEN 'SUMMER'
    ELSE 'AUTUM'
    END AS SEASON_OF_YEAR

     from 
     {{ source("demo", "BIKE") }}
    
    
    --  WHERE DAY_TYPE='WEEKEND' 
    --  {{ source('demo', 'BIKE') }} dayname(to_timestamp(started_at))IN ('SAT','SUN')
    )

select *
from cte

