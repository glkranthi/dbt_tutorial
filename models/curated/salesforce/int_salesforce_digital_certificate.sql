{{
    config(
        tags=["piperider"]
    )
}}
with base as (

    select * 
    from {{ ref('stg_salesforce_digital_certificate') }}
),

final as (
    
    select 
        digital_certificate_id AS digital_certificate_id,
        account_c AS digital_certificate_account,
        authorisor_email_c AS digital_certificate_authorisor_email,
        authorisor_name_c AS digital_certificate_authorisor_name,
        certificate_expiry_date_c AS digital_certificate_certificate_expiry_date,
        certificate_holder_type_c AS digital_certificate_certificate_holder_type,
        certificate_status_c AS digital_certificate_certificate_status,
        certificate_type_c AS digital_certificate_certificate_type,
        contact_c AS digital_certificate_contact,
        date_form_received_c AS digital_certificate_date_form_received,
        date_ordered_c AS digital_certificate_date_ordered,
        date_requested_c AS digital_certificate_date_requested,
        date_terminated_c AS digital_certificate_date_terminated,
        --email_for_digital_certificate_c AS digital_certificate_email_for_digital_certificate,
        --email_for_digital_certificate_c_c AS digital_certificate_email_for_digital_certificate_c,
        email_for_symantec_digital_ceriticate_c AS digital_certificate_email_for_symantec_digital_ceriticate,
        --email_for_symantec_digital_certificate__c AS digital_certificate_email_for_symantec_digital_certificate,
        legacy_id_c AS digital_certificate_legacy_id,
        order_status_c AS digital_certificate_order_status,
        pexa_symantec_c AS digital_certificate_pexa_symantec,
        previous_digital_certificate_c AS digital_certificate_previous_digital_certificate,
        primary_certificate_c AS digital_certificate_primary_certificate,
        re_ordered_c AS digital_certificate_re_ordered,
        reason_for_fee_waiver_c AS digital_certificate_reason_for_fee_waiver,
        reason_for_termination_c AS digital_certificate_reason_for_termination,
        related_application_c AS digital_certificate_related_application,
        --requires_additional_digital_certificate_c AS digital_certificate_requires_additional_digital_certificate,
        requires_a_new_digital_certificate_c AS digital_certificate_requires_a_new_digital_certificate,
        subscriber_id_c AS digital_certificate_subscriber_id,
        symantec_digital_certificate_c AS digital_certificate_symantec_digital_certificate,
        symantec_digital_certificate_suitable_fo_c AS digital_certificate_symantec_digital_certificate_suitable_fo,
        verizon_certificate_required_c AS digital_certificate_verizon_certificate_required,
        verizon_portal_status_c AS digital_certificate_verizon_portal_status
                
    from base
)

select *
from final