select
    {{ dbt_utils.generate_surrogate_key(["s.product_id"]) }} as sk_product_id,
    s.product_id,
    s.product_description as description,
    s.product_display_url as display_url,
    s.product_external_data_source_id as external_data_source_id,
    s.product_external_id as external_id,
    s.product_family as family,
    s.product_is_active as is_active,
    s.product_name as name,
    s.product_code as code,
    s.product_quantity_unit_of_measure as quantity_unit_of_measure,
    s.product_stock_keeping_unit as stock_keeping_unit
from {{ ref("int_salesforce_product_2") }} as s
