
with base as (

    select * 
    from {{ ref('stg_salesforce_account') }}
),

final as (
    
    select 
    id AS account_id,
    account_number AS account_number,
    account_source AS account_source,
    annual_revenue AS account_annual_revenue,
    behavioural_segment_c AS account_behavioural_segment,
    company_number_uk_c AS account_company_number_uk,
    competitor_c AS account_competitor,
    description AS account_description,
    financial_institution_type_c AS account_financial_institution_type,
    industry AS account_industry,
    name AS account_name,
    number_of_employees AS account_numberofemployees,
    other_organisation_type_c AS account_other_organisation_type,
    owner_id AS account_ownerid,
    ownership AS account_ownership,
    record_type_id,
    billing_state AS account_bill_state,
    pexa_shareholder_c AS account_pexa_shareholder,
    ps_abn_c AS account_ps_abn,
    ps_acn_c AS account_ps_acn,
    ps_account_management_segment_c AS account_ps_accountmanagementsegment,
    ps_activation_date_c AS account_ps_activationdate,
    ps_business_unit_name_c AS account_ps_businessunitname,
    ps_channel_c AS account_ps_channel,
    ps_customer_segment_level_0_c AS account_ps_customersegmentlevel0,
    ps_customer_segment_level_1_c AS account_ps_customersegmentlevel1,
    ps_customer_segment_level_2_c AS account_ps_customersegmentlevel2,
    ps_customer_status_c AS account_ps_customerstatus,
    ps_entity_type_c AS account_ps_entitytype,
    ps_external_id_c AS account_ps_externalid,
    ps_ficategory_c AS account_ps_ficategory,
    ps_focusand_structureof_business_c AS account_ps_focusandstructureofbusiness,
    ps_industry_market_share_c AS account_ps_industrymarketshare,
    ps_industry_partner_type_other_c AS account_ps_industrypartnertypeother,
    ps_industry_partner_type_c AS account_ps_industrypartnertype,
    ps_information_broker_other_c AS account_ps_information_broker_other,
    ps_information_broker_c AS account_ps_information_broker,
    ps_institution_type_c AS account_ps_institutiontype,
    ps_legal_entity_name_c AS account_ps_legalentityname,
    ps_likelihood_c AS account_ps_likelihood,
    ps_operational_1_c AS account_ps_operational1,
    ps_operational_2_c AS account_ps_operational2,
    ps_operational_3_c AS account_ps_operational3,
    ps_pexacertified_date_c AS account_ps_pexacertifieddate,
    ps_pexacertified_status_c AS account_ps_pexacertifiedstatus,
    ps_pexamarket_share_c AS account_ps_pexamarketshare,
    ps_pmsother_c AS account_ps_pmsother,
    ps_pms_c AS account_ps_pms,
    ps_panel_lawyer_c AS account_ps_panellawyer,
    ps_peopleinvolvedin_property_c AS account_ps_peopleinvolvedinproperty,
    ps_primary_sourceof_business_c AS account_ps_primarysourceofbusiness,
    ps_sizeof_loan_book_c AS account_ps_sizeofloanbook,
    ps_status_c AS account_ps_status,
    ps_strategic_1_c AS account_ps_strategic1,
    ps_strategic_2_c AS account_ps_strategic2,
    ps_strategic_3_c AS account_ps_strategic3,
    panel_details_c AS account_panel_details,
    parent_id AS account_parentid,
    remortgage_volume_estimate_c AS account_remortgage_volume_estimate,
    sales_purchase_volume_estimate_c AS account_sales_purchase_volume_estimate,
    send_fx_rego_c AS account_send_fx_rego,
    subscriber_manager_c AS account_subscriber_manager,
    --tier AS account_tier,
    type AS account_type,
    what_type_is_your_trustee_c AS account_what_type_is_your_trustee
                
    from base
)

select *
from final