
with base as (

    select * 
    from {{ ref('stg_salesforce_task') }}
),

final as (
    
    select 
        TASK_ID,
        ACTIVITY_DATE AS TASK_ACTIVITYDATE,
        CALL_TYPE AS TASK_CALLTYPE,
        COMPLETED_DATE_TIME AS TASK_COMPLETEDDATETIME,
        TASK_DESCRIPTION AS TASK_DESCRIPTION,
       -- EMAIL AS TASK_EMAIL,
        IS_RECURRENCE AS TASK_ISRECURRENCE,
        OWNER_ID AS TASK_OWNERID,
        --PHONE AS TASK_PHONE,
        PRIORITY AS TASK_PRIORITY,
        RECURRENCE_INTERVAL AS TASK_RECURRENCEINTERVAL,
        STATUS AS TASK_STATUS,
        SUBJECT AS TASK_SUBJECT,
        TASK_SUBTYPE AS TASK_TASKSUBTYPE,
        TYPE AS TASK_TYPE,
        WHAT_ID AS TASK_WHATID,
        WHO_ID AS TASK_WHOID
                
    from base
)

select *
from final