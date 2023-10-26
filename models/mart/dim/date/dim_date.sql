{{
    config(
        tags=["piperider"]
    )
}}
with
    date_dimension as (select * from {{ ref("dates") }}),
    fiscal_periods as (
        {{
            dbt_date.get_fiscal_periods(
                ref("dates"), year_end_month=1, week_start_day=1, shift_year=1
            )
        }}
    
    ),
    default_row AS (
        SELECT 
            CAST('1900-01-01' AS DATE) AS DATE_DAY,
            CAST('1900-01-01' AS DATE) AS PRIOR_DATE_DAY,
            CAST('1900-01-01' AS DATE) AS NEXT_DATE_DAY,
            CAST('1900-01-01' AS DATE) AS PRIOR_YEAR_DATE_DAY,
            CAST('1900-01-01' AS DATE) AS PRIOR_YEAR_OVER_YEAR_DATE_DAY,
            0 AS DAY_OF_WEEK,
            0 AS DAY_OF_WEEK_ISO,
            'UNKNOWN' AS DAY_OF_WEEK_NAME,
            'UNK' AS DAY_OF_WEEK_NAME_SHORT,
            0 AS DAY_OF_MONTH,
            0 AS DAY_OF_YEAR,
            CAST('1900-01-01' AS DATE) AS WEEK_START_DATE,
            CAST('1900-01-01' AS DATE) AS WEEK_END_DATE,
            CAST('1900-01-01' AS DATE) AS PRIOR_YEAR_WEEK_START_DATE,
            CAST('1900-01-01' AS DATE) AS PRIOR_YEAR_WEEK_END_DATE,
            0 AS WEEK_OF_YEAR,
            CAST('1900-01-01' AS DATE) AS ISO_WEEK_START_DATE,
            CAST('1900-01-01' AS DATE) AS ISO_WEEK_END_DATE,
            CAST('1900-01-01' AS DATE) AS PRIOR_YEAR_ISO_WEEK_START_DATE,
            CAST('1900-01-01' AS DATE) AS PRIOR_YEAR_ISO_WEEK_END_DATE,
            0 AS ISO_WEEK_OF_YEAR,
            0 AS PRIOR_YEAR_WEEK_OF_YEAR,
            0 AS PRIOR_YEAR_ISO_WEEK_OF_YEAR,
            0 AS MONTH_OF_YEAR,
            'UNKNOWN' AS MONTH_NAME,
            'UNK' AS MONTH_NAME_SHORT,
            CAST('1900-01-01' AS DATE) AS MONTH_START_DATE,
            CAST('1900-01-01' AS DATE) AS MONTH_END_DATE,
            CAST('1900-01-01' AS DATE) AS PRIOR_YEAR_MONTH_START_DATE,
            CAST('1900-01-01' AS DATE) AS PRIOR_YEAR_MONTH_END_DATE,
            0 AS QUARTER_OF_YEAR,
            CAST('1900-01-01' AS DATE) AS QUARTER_START_DATE,
            CAST('1900-01-01' AS DATE) AS QUARTER_END_DATE,
            0 AS YEAR_NUMBER,
            CAST('1900-01-01' AS DATE) AS YEAR_START_DATE,
            CAST('1900-01-01' AS DATE) AS YEAR_END_DATE,
            0 AS FISCAL_WEEK_OF_YEAR,
            0 AS FISCAL_WEEK_OF_PERIOD,
            0 AS FISCAL_PERIOD_NUMBER,
            0 AS FISCAL_QUARTER_NUMBER,
            0 AS FISCAL_PERIOD_OF_QUARTER
        FROM DUAL
)

select
    {{ dbt_utils.generate_surrogate_key(["d.date_day"]) }} as sk_date_day,
    d.*,
    f.fiscal_week_of_year,
    f.fiscal_week_of_period,
    f.fiscal_period_number,
    f.fiscal_quarter_number,
    f.fiscal_period_of_quarter
from date_dimension d
left join fiscal_periods f on d.date_day = f.date_day
UNION ALL
SELECT 
    {{ dbt_utils.generate_surrogate_key(["dr.date_day"]) }} as sk_date_day,
    dr.*
FROM default_row dr


