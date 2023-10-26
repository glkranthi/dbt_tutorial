{{
    config(
        tags=["piperider"]
    )
}}
with base as (

    select * 
    from {{ ref('stg_salesforce_subscription') }}
),

final as (
    
    select 
        id AS subscription_id,
        ps_acln_c AS subscription_ps_acln,
        ps_afin_c AS subscription_ps_afin,
        ps_arbn_c AS subscription_ps_arbn,
        ps_account_category_c AS subscription_ps_accountcategory,
        ps_account_c AS subscription_ps_account,
        ps_activation_date_c AS subscription_ps_activationdate,
        ps_active_digital_certificate_c AS subscription_ps_activedigitalcertificate,
        ps_approvedfor_soft_cert_c AS subscription_ps_approvedforsoftcert,
        ps_digital_signing_software_version_c AS subscription_ps_digitalsigningsoftwareversion,
        ps_digital_signing_software_c AS subscription_ps_digitalsigningsoftware,
        --ps_entity_type_c AS subscription_ps_entitytype,
        ps_microsoft_window_version_c AS subscription_ps_microsoftwindowversion,
        ps_non_adi_c AS subscription_ps_nonadi,
        --ps_numberofpexausers_c AS subscription_ps_numberofpexausers,
        ps_onboarding_id_c AS subscription_ps_onboardingid,
        ps_opportunity_id_c AS subscription_ps_opportunityid,
        ps_pexarevenue_c AS subscription_ps_pexarevenue,
        ps_reasonfor_suspension_c AS subscription_ps_reasonforsuspension,
        ps_reasonfor_termination_c AS subscription_ps_reasonfortermination,
        ps_settler_type_c AS subscription_ps_settlertype,
        ps_sponsor_c AS subscription_ps_sponsor,
        ps_status_c AS subscription_ps_status,
        ps_sub_category_c AS subscription_ps_subcategory,
        ps_subscriber_id_c AS subscription_ps_subscriberid,
        ps_subscription_type_c AS subscription_ps_subscriptiontype,
        ps_suspension_termination_date_c AS subscription_ps_suspensionterminationdate,
        ps_termination_other_c AS subscription_ps_terminationother,
        ps_two_factor_authentication_c AS subscription_ps_twofactorauthentication--,
        --sf18_subscription_id_c AS subscription_sf18_subscription_id
                
    from base
)

select *
from final