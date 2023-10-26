with
    base as (select * from {{ ref('stg_salesforce_product_2') }}),

    final as (

        select
            product_id,
            product_description,
            display_url as product_display_url,
            external_data_source_id as product_external_data_source_id,
            product_external_id,
            product_family,
            product_is_active,
            product_name,
            product_code,
            product_quantity_unit_of_measure,
            stock_keeping_unit as product_stock_keeping_unit

        from base
    )

select *
from final
