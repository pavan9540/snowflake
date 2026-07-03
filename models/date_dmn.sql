with cte as (
    select 

    to_timestamp(started_at) as STARTED_DATE,
    date(to_timestamp(started_at)) as DATE_STARTED_AT,
    hour(to_timestamp(started_at)) as HOUR_STARTED_AT,
   
    {{day_type('STARTED_AT')}} AS DAY_TYPE,

    {{get_season('started_at')}} AS SEASON_OF_YEAR

   

     from 
     {{ source("demo", "BIKE") }}
    
    
    --  WHERE DAY_TYPE='WEEKEND' 
    --  {{ source('demo', 'BIKE') }} dayname(to_timestamp(started_at))IN ('SAT','SUN')
    )

select *
from cte

