{{
    config(
        tags=["piperider"]
    )
}}
with base as (

    select * 
    from {{ ref('stg_salesforce_opportunity') }}
),

final as (
    
    select 
        id AS opportunity_id,
        is_deleted,
        account_id AS opportunity_accountid,
        amount AS opportunity_amount,
        budget_confirmed_c AS opportunity_budget_confirmed,
        campaign_id AS opportunity_campaignid,
        close_date AS opportunity_closedate,
        contract_id AS opportunity_contractid,
        description AS opportunity_description,
        discovery_completed_c AS opportunity_discovery_completed,
        expected_revenue AS opportunity_expectedrevenue,
        is_private AS opportunity_isprivate,
        lead_source AS opportunity_leadsource,
        is_closed,
        is_won,
        forecast_category,
        pricebook_2_id,
        loss_reason_c AS opportunity_loss_reason,
        name AS opportunity_name,
        next_step AS opportunity_nextstep,
        owner_id AS opportunity_ownerid,
        created_by_id AS created_by_user_id,
        last_modified_by_id AS modified_by_user_id,
        has_open_activity,
        --ps_acln_c AS opportunity_ps_acln,
        ps_demonstration_completed_c AS opportunity_ps_demonstrationcompleted,
        --ps_leadvalueifknown_c AS opportunity_ps_leadvalueifknown,
        ps_loss_reason_c AS opportunity_ps_lossreason,
        ps_mouissued_c AS opportunity_ps_mouissued,
        ps_moureturned_c AS opportunity_ps_moureturned,
        ps_mousigned_c AS opportunity_ps_mousigned,
        ps_non_adi_c AS opportunity_ps_nonadi,
        --ps_onboardingid_c AS opportunity_ps_onboardingid,
        --ps_opportunityrecordtypename_c AS opportunity_ps_opportunityrecordtypename,
        ps_other_reason_c AS opportunity_ps_otherreason,
        ps_shared_sales_collateral_c AS opportunity_ps_sharedsalescollateral,
        ps_subscriber_id_c AS opportunity_ps_subscriber_id,
        ps_subscription_name_c AS opportunity_ps_subscriptionname,
        probability AS opportunity_probability,
        roi_analysis_completed_c AS opportunity_roi_analysis_completed,
        stage_name AS opportunity_stagename,
        total_opportunity_quantity AS opportunity_totalopportunityquantity,
        type AS opportunity_type
                
    from base
)

select *
from final