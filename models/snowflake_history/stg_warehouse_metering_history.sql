select
    START_TIME,
    END_TIME,
    WAREHOUSE_ID,
    WAREHOUSE_NAME,
    CREDITS_USED,
    TO_DATE(START_TIME) as START_DATE,
    DATEDIFF(HOUR, START_TIME, END_TIME) as WAREHOUSE_OPERATION_HOURS,
    HOUR(START_TIME) as TIME_OF_DAY
from demo_db.snowflake_stats.warehouse_metering_history
order by TO_DATE(START_TIME) desc
-- need to fix error with source asap
