{{
    config(
        tags=["piperider"]
    )
}}
with base as (

    select * 
    from {{ source('salesforce', 'task') }}
),

final as (
    
    select 
        cast(_fivetran_synced as {{ dbt.type_timestamp() }}) as _fivetran_synced,
        id as task_id,
        account_id,
        cast(activity_date as {{ dbt.type_timestamp() }}) as activity_date,
        call_disposition,
        call_duration_in_seconds,
        call_object,
        call_type,
        cast(completed_date_time as {{ dbt.type_timestamp() }}) as completed_date_time,
        created_by_id,
        cast(created_date as {{ dbt.type_timestamp() }}) as created_date,
        description as task_description,
        is_archived,
        is_closed,
        is_deleted,
        is_high_priority,
        last_modified_by_id,
        cast(last_modified_date as {{ dbt.type_timestamp() }}) as last_modified_date,
        owner_id,
        priority,
        record_type_id,
        status,
        subject,
        task_subtype,
        type,
        what_count,
        what_id,
        who_count,
        who_id,
        reminder_date_time,
        is_reminder_set,
        recurrence_activity_id,
        is_recurrence,
        recurrence_start_date_only,
        recurrence_end_date_only,
        recurrence_time_zone_sid_key,
        recurrence_type,
        recurrence_interval,
        recurrence_day_of_week_mask,
        recurrence_day_of_month,
        recurrence_instance,
        recurrence_month_of_year,
        recurrence_regenerated_type,
        _fivetran_deleted,
        after_call_time_c,
        genesys_interaction_id_c,
        wrap_up_code_c,
        call_disconnected_time_c,
        ps_other_sub_category_c,
        ps_sub_category_c,
        called_number_c,
        ps_contact_direction_c,
        genesys_queue_name_c,
        ps_other_category_c,
        internal_call_c,
        participant_id_c,
        ps_category_c,
        is_visible_in_self_service,
        call_connected_time_c,
        call_meeting_duration_c,
        caller_number_c

        
    from base
)

select *
from final
where not coalesce(is_deleted, false)