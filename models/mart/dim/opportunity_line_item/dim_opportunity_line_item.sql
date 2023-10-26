{{
    config(
        tags=["piperider"]
    )
}}
select
    {{ dbt_utils.generate_surrogate_key(["s.opportunity_line_item_id"]) }} as sk_opportunity_line_item_id,
    s.opportunity_line_item_id,
    s.opportunity_line_item_description as description,
    s.opportunity_line_item_discount as discount,
    s.opportunity_line_item_list_price as list_price,
    s.opportunity_line_item_name as name,
    s.opportunity_line_item_opportunity_id as opportunity_id,
    s.opportunity_line_item_product_2_id as product_2_id,
    s.opportunity_line_item_product_code as product_code,
    s.opportunity_line_item_quantity as quantity,
    s.opportunity_line_item_service_date as service_date,
    s.opportunity_line_item_subtotal as subtotal,
    s.opportunity_line_item_total_price as total_price,
    s.opportunity_line_item_unit_price as unit_price
from {{ ref("int_salesforce_opportunity_line_item") }} as s
