{{
    config(
        tags=["piperider"]
    )
}}
with
    base as (select * from {{ source('salesforce', 'event') }}),

final as (
    select
        cast(_fivetran_synced as {{ dbt.type_timestamp() }}) as _fivetran_synced,
        id as event_id,
        record_type_id,
        who_id,
        what_id,
        who_count,
        what_count,
        subject,
        location,
        is_all_day_event,
        activity_date_time,
        cast(activity_date as {{ dbt.type_timestamp() }}) as activity_date,
        duration_in_minutes,
        start_date_time,
        end_date_time,
        end_date,
        description as event_description,
        account_id,
        owner_id,
        type,
        is_private,
        show_as,
        is_deleted as event_is_deleted,
        is_child,
        is_group_event,
        group_event_type,
        created_date,
        created_by_id,
        last_modified_date,
        last_modified_by_id,
        system_modstamp,
        is_archived as event_is_archived,
        is_visible_in_self_service,
        recurrence_activity_id,
        is_recurrence,
        recurrence_start_date_time,
        recurrence_end_date_only,
        recurrence_time_zone_sid_key,
        recurrence_type,
        recurrence_interval,
        recurrence_day_of_week_mask,
        recurrence_day_of_month,
        recurrence_instance,
        recurrence_month_of_year,
        reminder_date_time,
        is_reminder_set,
        event_subtype,
        is_recurrence_2_exclusion,
        recurrence_2_pattern_text,
        recurrence_2_pattern_version,
        is_recurrence_2,
        is_recurrence_2_exception,
        recurrence_2_pattern_start_date,
        recurrence_2_pattern_time_zone,
        ps_category_c,
        ps_contact_direction_c,
        ps_other_category_c,
        ps_other_sub_category_c,
        ps_sub_category_c,
        call_meeting_duration_c,
        after_call_time_c,
        call_connected_time_c,
        call_disconnected_time_c,
        called_number_c,
        caller_number_c,
        genesys_interaction_id_c,
        genesys_queue_name_c,
        internal_call_c,
        participant_id_c,
        wrap_up_code_c,
        _fivetran_deleted

    from base
)

select *
from final
where not coalesce(event_is_deleted, false)
