select
    {{ dbt_utils.generate_surrogate_key(["int_salesforce_case.case_id"]) }} as sk_case_id,
    case_id,
    case_number,
    case_status,
    case_origin,
    case_priority,
    case_type,
    subject,
    case_internal_status as pexa_internal_status,
    case_reference_number as pexa_reference_no,
    case_impact as pexa_impact,
    case_sub_category as pexa_sub_category,
    case_sub_sub_category as pexa_sub_category2,
    case_assignment_group as pexa_assignment_group
from {{ ref("int_salesforce_case") }}
