{{
    config(
        tags=["piperider"]
    )
}}
select
    {{ dbt_utils.generate_surrogate_key(["int_salesforce_task.task_id"]) }} as task_key,
    task_id,
    task_activitydate,
    task_calltype,
    task_completeddatetime,
    task_description,
    -- TASK_EMAIL,
    task_isrecurrence,
    task_ownerid,
    -- TASK_PHONE,
    task_priority,
    task_recurrenceinterval,
    task_status,
    task_subject,
    task_tasksubtype,
    task_type,
    task_whatid,
    task_whoid
from {{ ref("int_salesforce_task") }}
