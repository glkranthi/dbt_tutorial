{{
    config(
        tags=["piperider"]
    )
}}
select
    {{ dbt_utils.generate_surrogate_key(["int_salesforce_opportunity.opportunity_id"]) }} as sk_opportunity_id,
    {{ dbt_utils.generate_surrogate_key(["int_salesforce_opportunity.opportunity_id"]) }} as fk_opportunity_id,
    {{ dbt_utils.generate_surrogate_key(["int_salesforce_opportunity.opportunity_accountid"]) }} as fk_opportunity_accountid,
    {{ dbt_utils.generate_surrogate_key(["int_salesforce_opportunity.opportunity_ownerid"]) }} as fk_opportunity_ownerid,
    pricebook_2_id,
    {{ dbt_utils.generate_surrogate_key(["int_salesforce_opportunity.created_by_user_id"]) }} as fk_created_by_user_id,
    {{ dbt_utils.generate_surrogate_key(["int_salesforce_opportunity.modified_by_user_id"]) }} as fk_modified_by_user_id,
    has_open_activity,
    is_deleted,
    opportunity_isprivate as is_private,
    opportunity_budget_confirmed as pexa_is_buget_confirmed,
    opportunity_discovery_completed as pexa_is_discovery_completed,
    opportunity_roi_analysis_completed AS pexa_is_ROI_analysis_done,
    opportunity_ps_demonstrationcompleted AS pexa_demo_done
from {{ ref("int_salesforce_opportunity")}}