with
    base as (select * from {{ ref('stg_salesforce_opportunity_team_member') }}),

    final as (

        select
            opportunity_team_member_id,
            opportunity_access_level as opportunity_team_member_opportunity_access_level,
            opportunity_id as opportunity_team_member_opportunity_id,
            team_member_role as opportunity_team_member_team_member_role,
            user_id as opportunity_team_member_user_id

        from base
    )

select *
from final
