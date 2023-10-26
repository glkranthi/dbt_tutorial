{% test salesforce_phone_length_check(model, column_name) %}

with validation as (
    select
       {{ column_name }} as checked_digit_field

    from {{ model }}
),

validation_errors as (

    select
        checked_digit_field

    from validation

    --where NOT REGEXP_LIKE(checked_digit_field,'\\d{1,2}\\-\\d{1,2}-\\d{4,4}')
    where NOT REGEXP_LIKE(checked_digit_field,'\\([0-9][0-9]\\)\\s[0-9][0-9][0-9][0-9]\\s[0-9][0-9][0-9][0-9]')
)

select *
from validation_errors

{% endtest %}