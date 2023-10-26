{{
    config(
        tags=["piperider"]
    )
}}

with base as (

    select * 
    from {{ source('salesforce', 'ps_subscription_c') }}
),

final as (
    
    select 
        cast(_fivetran_synced as {{ dbt.type_timestamp() }}) as _fivetran_synced,
        id,
        owner_id,
        is_deleted,
        name,
        cast(created_date as {{ dbt.type_timestamp() }}) as created_date,
        created_by_id,
        cast(last_modified_date as {{ dbt.type_timestamp() }}) as last_modified_date,
        last_modified_by_id,
        system_modstamp,
        cast(last_activity_date as {{ dbt.type_timestamp() }}) as last_activity_date,
        cast(last_viewed_date as {{ dbt.type_timestamp() }}) as last_viewed_date,
        cast(last_referenced_date as {{ dbt.type_timestamp() }}) as last_referenced_date,
        ps_account_c,
        ps_acln_c,
        ps_afin_c,
        ps_apcaiddestination_c,
        ps_apcaidsources_c,
        ps_arbn_c,
        ps_account_category_c,
        ps_activation_date_c,
        ps_active_digital_certificate_c,
        ps_approvedfor_soft_cert_c,
        ps_digital_signing_software_version_c,
        ps_digital_signing_software_c,
        ps_esa_c,
        ps_expiry_date_c,
        ps_lenderof_record_c,
        ps_microsoft_window_version_c,
        ps_non_adi_c,
        ps_onboarding_id_c,
        ps_other_category_c,
        ps_own_esaaccount_c,
        ps_pasigned_by_c,
        ps_paversion_c,
        ps_pexarevenue_c,
        ps_reasonfor_suspension_c,
        ps_reasonfor_termination_c,
        ps_settler_type_c,
        ps_sponsor_c,
        ps_status_c,
        ps_sub_category_c,
        ps_subscriber_id_c,
        ps_subscription_type_c,
        ps_suspension_termination_date_c,
        ps_termination_other_c,
        ps_two_factor_authentication_c,
        ps_operating_model_preference_c,
        ps_opportunity_id_c,
        ps_expiry_date_2_c,
        ps_master_policy_number_c,
        ps_master_policy_number_2_c,
        _fivetran_deleted
        
    from base
)

select *
from final
where not coalesce(is_deleted, false)