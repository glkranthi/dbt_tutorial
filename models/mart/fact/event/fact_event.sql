{{
    config(
        tags=["piperider"]
    )
}}
select
    {{ dbt_utils.generate_surrogate_key(["event_id"]) }}
    as sk_event_id,
    {{
        dbt_utils.generate_surrogate_key(
            [
                "int_salesforce_event.event_id"
            ]
        )
    }}
    as fk_event_id,
    {{
        dbt_utils.generate_surrogate_key(
            [
                "int_salesforce_event.EVENT_ACTIVITY_DATE"
            ]
        )
    }}
    as fk_event_activity_date,
    {{
        dbt_utils.generate_surrogate_key(
            [
                "date(int_salesforce_event.EVENT_OWNER_ID)"
            ]
        )
    }}
    as fk_owner_id, 
    EVENT_ACTIVITY_DATE_TIME,
    EVENT_DURATION_IN_MINUTES,
    EVENT_START_DATE_TIME,
    EVENT_END_DATE_TIME
from {{ ref("int_salesforce_event") }}
