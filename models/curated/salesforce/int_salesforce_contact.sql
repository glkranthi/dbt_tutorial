{{
    config(
        tags=["piperider"]
    )
}}
with base as (

    select * 
    from {{ ref('stg_salesforce_contact') }}
),

final as (
    
    select 
        contact_id AS contact_id,
        account_id AS contact_accountid,
        contact_exchange_access_c AS contact_contact_exchange_access,
        contacts_status_c AS contact_contacts_status,
        department AS contact_department,
        contact_description AS contact_description,
        email AS contact_email,
        exchange_last_login_c AS contact_exchange_last_login,
        exchange_subscriber_id_c AS contact_exchange_subscriber_id,
        finance_contact_c AS contact_finance_contact,
        individual_id AS contact_individualid,
        lead_source AS contact_leadsource,
        mobile_phone AS contact_mobilephone,
        contact_name AS contact_name,
        owner_id AS contact_ownerid,
        ps_business_unit_area_c AS contact_ps_business_unit_area,
        ps_dateof_voi_c AS contact_ps_dateofvoi,
        ps_method_c AS contact_ps_method,
        ps_organisation_c AS contact_ps_organisation,
        ps_pexacertified_date_c AS contact_ps_pexacertifieddate,
        ps_pexacertified_status_c AS contact_ps_pexacertifiedstatus,
        ps_pexadivision_c AS contact_ps_pexadivision,
        ps_registration_date_c AS contact_ps_registrationdate,
        ps_registration_status_c AS contact_ps_registrationstatus,
        ps_secondary_email_c AS contact_ps_secondaryemail,
        ps_voicomplete_c AS contact_ps_voicomplete,
        ps_voiprovider_c AS contact_ps_voiprovider,
        phone AS contact_phone,
        preferred_name_c AS contact_preferred_name,
        primary_subscriber_manager_c AS contact_primary_subscriber_manager,
        requires_additional_digital_certificate_c AS contact_requires_additional_digital_certificate,
        role_c AS contact_role,
        --sf18_contact_id_c AS contact_sf18_contact_id,
        subscriber_id_c AS contact_subscriber_id,
        subscriber_manager_c AS contact_subscriber_manager,
        subscriber_role_c AS contact_subscriber_role
                
    from base
)

select *
from final