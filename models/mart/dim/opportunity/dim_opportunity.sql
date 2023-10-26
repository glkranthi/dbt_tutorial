{{
    config(
        tags=["piperider"]
    )
}}
select
    {{ dbt_utils.generate_surrogate_key(["s.opportunity_id"]) }} as sk_opportunity_id,
    s.opportunity_id,
    s.opportunity_name as name,
    s.opportunity_stagename as stage,
    s.opportunity_type as type,
    case
        when s.is_won
        then 'Won'
        when not s.is_won and s.is_closed
        then 'Lost'
        when
            not s.is_closed
            and lower(s.forecast_category) in ('pipeline', 'forecast', 'bestcase')
        then 'Pipeline'
        else 'Other'
    end as opp_status,
    s.opportunity_description as description,
    s.opportunity_probability as probability,
    s.opportunity_totalopportunityquantity as total_opportunity_quantity,
    u.user_name as owner_name
from {{ ref("int_salesforce_opportunity") }} as s
inner join {{ ref("int_salesforce_user") }} as u on s.opportunity_ownerid = u.user_id
where s.is_deleted = false
