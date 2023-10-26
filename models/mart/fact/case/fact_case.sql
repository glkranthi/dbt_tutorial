{{
    config(
        tags=["piperider"]
    )
}}
select
    {{ dbt_utils.generate_surrogate_key(["int_salesforce_case.case_id"]) }} as sk_fact_case_id,
    {{ dbt_utils.generate_surrogate_key(["int_salesforce_case.case_id"]) }} as fk_case_id,
    {{ dbt_utils.generate_surrogate_key(["int_salesforce_case.case_accountid"]) }} as fk_account_id,
    {{ dbt_utils.generate_surrogate_key(["int_salesforce_case.case_contactid"]) }} as fk_contact_id,
    {{ dbt_utils.generate_surrogate_key(["date(int_salesforce_case.created_date)"]) }} as fk_sf_created_date,
    {{ dbt_utils.generate_surrogate_key(["date(int_salesforce_case.last_modified_date)"]) }} as fk_sf_modified_date,
    is_closed,
    case_isescalated as is_escalated,
    is_deleted,
    case_work_around_available as is_workaround,
    case_isclosedoncreate as is_closed_on_create,
    case_case_reopened as is_case_reopened
from {{ ref("int_salesforce_case") }}
