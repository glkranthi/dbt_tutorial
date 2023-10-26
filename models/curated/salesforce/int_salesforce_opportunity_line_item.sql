with
    base as (

        select *
        from {{ ref('stg_salesforce_opportunity_line_item') }}
    ),

    final as (
        select
            opportunity_line_item_id,
            opportunity_id as opportunity_line_item_opportunity_id,
            opportunity_line_item_description as opportunity_line_item_description,
            discount as opportunity_line_item_discount,
            list_price as opportunity_line_item_list_price,
            opportunity_line_item_name as opportunity_line_item_name,
            product_2_id as opportunity_line_item_product_2_id,
            product_code as opportunity_line_item_product_code,
            quantity as opportunity_line_item_quantity,
            coalesce(service_date, '1900-01-01') as opportunity_line_item_service_date,
            subtotal as opportunity_line_item_subtotal,
            total_price as opportunity_line_item_total_price,
            unit_price as opportunity_line_item_unit_price

        from base
    )

select *
from final
