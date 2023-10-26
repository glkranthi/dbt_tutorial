{{
    config(
        tags=["piperider"]
    )
}}
with base as (

    select * 
    from {{ source('salesforce', 'digital_certificate_c') }}
),

final as (
    
    select 
        cast(_fivetran_synced as {{ dbt.type_timestamp() }}) as _fivetran_synced,
        id as digital_certificate_id,
        is_deleted,
        name,
        cast(created_date as {{ dbt.type_timestamp() }}) as created_date,
        created_by_id,
        cast(last_modified_date as {{ dbt.type_timestamp() }}) as last_modified_date,
        last_modified_by_id,
        system_modstamp,
        cast(last_viewed_date as {{ dbt.type_timestamp() }}) as last_viewed_date,
        cast(last_referenced_date as {{ dbt.type_timestamp() }}) as last_referenced_date,
        account_c,
        contact_c,
        email_for_symantec_digital_certificate_c,
        obtain_digital_certificate_c,
        symantec_digital_certificate_c,
        related_application_c,
        requires_a_new_digital_certificate_c,
        symantec_digital_certificate_suitable_fo_c,
        authorisor_email_c,
        authorisor_name_c,
        certificate_expiry_date_c,
        certificate_holder_type_c,
        certificate_status_c,
        certificate_type_c,
        city_c,
        date_form_received_c,
        date_ordered_c,
        date_requested_c,
        date_terminated_c,
        express_post_tracking_number_c,
        express_post_c,
        order_status_c,
        postcode_c,
        previous_digital_certificate_c,
        primary_certificate_c,
        re_ordered_c,
        reason_for_fee_waiver_c,
        reason_for_termination_c,
        state_c,
        street_1_c,
        street_2_c,
        street_3_c,
        subscriber_id_c,
        verizon_apply_charge_c,
        verizon_certificate_required_c,
        verizon_portal_status_c,
        email_for_symantec_digital_ceriticate_c,
        comments_c,
        legacy_id_c,
        pexa_symantec_c,
        _fivetran_deleted
        
    from base
)

select *
from final
where not coalesce(is_deleted, false)