select
    PIPE_ID,
    PIPE_NAME,
    START_TIME,
    END_TIME,
    CREDITS_USED,
    BYTES_INSERTED,
    FILES_INSERTED,
    TO_DATE(START_TIME) as START_DATE,
    DATEDIFF(HOUR, START_TIME, END_TIME) as PIPELINE_OPERATION_HOURS,
    HOUR(START_TIME) as TIME_OF_DAY
from demo_db.snowflake_stats.pipe_usage_history
order by TO_DATE(START_TIME) desc
-- fix source func not working