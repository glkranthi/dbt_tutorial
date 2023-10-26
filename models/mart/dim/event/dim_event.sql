{{
    config(
        tags=["piperider"]
    )
}}
select
    {{ dbt_utils.generate_surrogate_key(["e.event_id"]) }} as sk_event_id,
    e.event_id,
    e.event_description,
    e.event_event_subtype,
    e.event_is_all_day_event,
    e.event_is_private,
    e.event_is_recurrence_2,
    e.event_is_reminder_set,
    e.event_is_visible_in_self_service,
    e.event_location,
    e.event_show_as,
    e.event_subject,
    e.event_type,
    e.event_what_id,
    e.event_who_id    
from {{ ref("int_salesforce_event") }} as e