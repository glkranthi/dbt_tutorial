with
    base as (select * from {{ ref('stg_salesforce_event') }}),

    final as (

        select
            event_id,
            activity_date as event_activity_date,
            activity_date_time as event_activity_date_time,
            event_description as event_description,
            duration_in_minutes as event_duration_in_minutes,
            end_date_time as event_end_date_time,
            event_subtype as event_event_subtype,
            is_all_day_event as event_is_all_day_event,
            is_private as event_is_private,
            is_recurrence_2 as event_is_recurrence_2,
            is_reminder_set as event_is_reminder_set,
            is_visible_in_self_service as event_is_visible_in_self_service,
            location as event_location,
            owner_id as event_owner_id,
            show_as as event_show_as,
            start_date_time as event_start_date_time,
            subject as event_subject,
            type as event_type,
            what_id as event_what_id,
            who_id as event_who_id

        from base
    )

select *
from final
