
with base as (

    select * 
    from {{ source('salesforce', 'opportunity') }}
),

final as (
    
    select 
        cast(_fivetran_synced as {{ dbt.type_timestamp() }}) as _fivetran_synced,
        id,
        is_deleted,
        account_id,
        record_type_id,
        name,
        description,
        stage_name,
        amount,
        probability,
        cast(close_date as {{ dbt.type_timestamp() }}) as close_date,
        type,
        next_step,
        lead_source,
        is_closed,
        is_won,
        forecast_category,
        forecast_category_name,
        campaign_id,
        has_opportunity_line_item,
        pricebook_2_id,
        owner_id,
        cast(created_date as {{ dbt.type_timestamp() }}) as created_date,
        created_by_id,
        cast(last_modified_date as {{ dbt.type_timestamp() }}) as last_modified_date,
        last_modified_by_id,
        system_modstamp,
        cast(last_activity_date as {{ dbt.type_timestamp() }}) as last_activity_date,
        push_count,
        cast(last_stage_change_date as {{ dbt.type_timestamp() }}) as last_stage_change_date,
        fiscal_quarter,
        fiscal_year,
        fiscal,
        contact_id,
        cast(last_viewed_date as {{ dbt.type_timestamp() }}) as last_viewed_date,
        cast(last_referenced_date as {{ dbt.type_timestamp() }}) as last_referenced_date,
        synced_quote_id,
        contract_id,
        has_open_activity,
        has_overdue_task,
        last_amount_changed_history_id,
        last_close_date_changed_history_id,
        budget_confirmed_c,
        discovery_completed_c,
        roi_analysis_completed_c,
        loss_reason_c,
        _fivetran_deleted,
        ps_subscriber_id_c,
        is_private,
        total_opportunity_quantity,
        ps_other_reason_c,
        ps_demonstration_completed_c,
        ps_shared_sales_collateral_c,
        cast(ps_expiry_lapsing_date_c as {{ dbt.type_timestamp() }}) as ps_expiry_lapsing_date_c,
        ps_moureturned_c,
        ps_operating_model_preference_c,
        ps_subscription_name_c,
        ps_loss_reason_c,
        ps_mousigned_c,
        ps_mouissued_c,
        ps_non_adi_c,
        expected_revenue
                
    from base
)

select *
from final
where not coalesce(is_deleted, false)