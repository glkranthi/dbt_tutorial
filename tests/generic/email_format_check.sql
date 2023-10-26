{% test email_format_check(model, column_name) %}

with validation as (
    select
       {{ column_name }} as checked_email_field

    from {{ model }}
),

validation_errors as (

    select
        checked_email_field

    from validation
    where NOT REGEXP_LIKE(checked_email_field,'^[a-zA-Z0-9_\\.+-]+@[a-zA-Z0-9-]+\\.[a-zA-Z0-9\\-\\.]+$')
)

select *
from validation_errors

{% endtest %}