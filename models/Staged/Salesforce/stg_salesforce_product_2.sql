{{
    config(
        tags=["piperider"]
    )
}}
with
    base as (select * from {{ source("salesforce", "product_2") }}),

    final as (
        select
            cast(_fivetran_synced as {{ dbt.type_timestamp() }}) as _fivetran_synced,
            id as product_id,
            name as product_name,
            product_code as product_code,
            description as product_description,
            is_active as product_is_active,
            cast(created_date as {{ dbt.type_timestamp() }}) as created_date,
            created_by_id,
            cast(
                last_modified_date as {{ dbt.type_timestamp() }}
            ) as last_modified_date,
            last_modified_by_id,
            system_modstamp,
            family as product_family,
            external_data_source_id,
            external_id as product_external_id,
            display_url,
            quantity_unit_of_measure as product_quantity_unit_of_measure,
            is_deleted as product_is_deleted,
            is_archived as product_is_archived,
            cast(last_viewed_date as {{ dbt.type_timestamp() }}) as last_viewed_date,
            cast(
                last_referenced_date as {{ dbt.type_timestamp() }}
            ) as last_referenced_date,
            stock_keeping_unit,
            _fivetran_deleted

        from base
    )

select *
from final
where not coalesce(product_is_deleted, false)
