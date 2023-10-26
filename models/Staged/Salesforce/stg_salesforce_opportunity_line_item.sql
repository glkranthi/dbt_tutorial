with
    base as (
        select *
        from {{ source('salesforce', 'opportunity_line_item')}}
    ),

final as (
    select
        cast(_fivetran_synced as {{ dbt.type_timestamp() }}) as _fivetran_synced,
        id as opportunity_line_item_id,
        opportunity_id,
        sort_order,
        pricebook_entry_id,
        product_2_id,
        product_code,
        name as opportunity_line_item_name,
        quantity,
        total_price,
        unit_price,
        list_price,
        service_date,
        description as opportunity_line_item_description,
        cast(created_date as {{ dbt.type_timestamp() }}) as created_date,
        created_by_id,
        cast(last_modified_date as {{ dbt.type_timestamp() }}) as last_modified_date,
        last_modified_by_id,
        system_modstamp,
        is_deleted as opportunity_line_item_is_deleted,
        cast(last_viewed_date as {{ dbt.type_timestamp() }}) as last_viewed_date,
        cast(last_referenced_date as {{ dbt.type_timestamp() }}) as last_referenced_date,
        subtotal,
        discount,
        _fivetran_deleted

    from base
)

select *
from final
where not coalesce(opportunity_line_item_is_deleted, false)
