select
    {{ dbt_utils.generate_surrogate_key(["int_salesforce_contact.contact_id"]) }} as sk_contact_id,
    contact_id,
    contact_accountid,
    contact_contact_exchange_access,
    contact_contacts_status,
    contact_department,
    contact_description,
    contact_email,
    contact_exchange_last_login,
    contact_exchange_subscriber_id,
    contact_finance_contact,
    contact_individualid,
    contact_leadsource,
    contact_mobilephone,
    contact_name,
    contact_ownerid,
    contact_ps_business_unit_area,
    contact_ps_dateofvoi,
    contact_ps_method,
    contact_ps_organisation,
    contact_ps_pexacertifieddate,
    contact_ps_pexacertifiedstatus,
    contact_ps_pexadivision,
    contact_ps_registrationdate,
    contact_ps_registrationstatus,
    contact_ps_secondaryemail,
    contact_ps_voicomplete,
    contact_ps_voiprovider,
    contact_phone,
    contact_preferred_name,
    contact_primary_subscriber_manager,
    contact_requires_additional_digital_certificate,
    contact_role,
    contact_subscriber_id,
    contact_subscriber_manager,
    contact_subscriber_role
from {{ ref('int_salesforce_contact') }}
