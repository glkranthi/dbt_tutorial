{{
    config(
        tags=["piperider"]
    )
}}
with
    base as (select * from {{ source('salesforce', 'opportunity_team_member') }}),

    final as (
        select
            cast(_fivetran_synced as {{ dbt.type_timestamp() }}) as _fivetran_synced,
            id as opportunity_team_member_id,
            opportunity_id,
            user_id,
            name as opportunity_team_member_name,
            photo_url,
            title,
            team_member_role,
            opportunity_access_level,
            cast(created_date as {{ dbt.type_timestamp() }}) as created_date,
            created_by_id,
            cast(
                last_modified_date as {{ dbt.type_timestamp() }}
            ) as last_modified_date,
            last_modified_by_id,
            system_modstamp,
            is_deleted,
            _fivetran_deleted

        from base
    )

select *
from final
where not coalesce(is_deleted, false)

