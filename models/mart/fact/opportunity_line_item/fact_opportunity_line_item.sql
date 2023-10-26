{{
    config(
        tags=["piperider"]
    )
}}
select
    {{ dbt_utils.generate_surrogate_key(["opportunity_line_item_id"]) }}
    as sk_opportunity_line_item_id,
    {{
        dbt_utils.generate_surrogate_key(
            [
                "int_salesforce_opportunity_line_item.opportunity_line_item_id"
            ]
        )
    }}
    as fk_opportunity_line_item_id,
    {{
        dbt_utils.generate_surrogate_key(
            [
                "int_salesforce_opportunity_line_item.opportunity_line_item_product_2_id"
            ]
        )
    }}
    as fk_opportunity_product_2_id,
    {{
        dbt_utils.generate_surrogate_key(
            [
                "date(int_salesforce_opportunity_line_item.opportunity_line_item_service_date)"
            ]
        )
    }}
    as fk_date_day, 

     {{
        dbt_utils.generate_surrogate_key(
            [
                "int_salesforce_opportunity_line_item.opportunity_line_item_opportunity_id"
            ]
        )
    }}
    as fk_opportunity_id,
    opportunity_line_item_discount as discount,
    opportunity_line_item_list_price as list_price,
    opportunity_line_item_quantity as quantity,
    opportunity_line_item_subtotal as subtotal,
    opportunity_line_item_total_price as total_price,
    opportunity_line_item_unit_price as unit_price
from {{ ref("int_salesforce_opportunity_line_item") }}
