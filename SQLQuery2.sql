with cte as
(
    select * from bike_share_yr_0
    union all
    select * from bike_share_yr_1
)

select 
    dteday,
    season,
    a.yr,
    weekday,
    hr,
    rider_type,
    riders,
    price,
    COGS,
    price * riders as revenue,
    ((riders * price) - COGS) as profit
from 
    cte a
left join 
    cost_table b on a.yr = b.yr;
