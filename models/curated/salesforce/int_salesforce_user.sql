{{
    config(
        tags=["piperider"]
    )
}}
with base as (

    select * 
    from {{ ref('stg_salesforce_user') }}
),

final as (
    
    select 
        ID AS USER_ID,
        ALIAS AS USER_ALIAS,
        CALL_CENTER_ID AS USER_CALLCENTERID,
        COMMUNITY_NICKNAME AS USER_COMMUNITYNICKNAME,
        COMPANY_NAME AS USER_COMPANYNAME,
        CONTACT_ID AS USER_CONTACTID,
        DEPARTMENT AS USER_DEPARTMENT,
        DIVISION AS USER_DIVISION,
        EMAIL AS USER_EMAIL,
        EMPLOYEE_NUMBER AS USER_EMPLOYEENUMBER,
        INDIVIDUAL_ID AS USER_INDIVIDUALID,
        IS_ACTIVE AS USER_ISACTIVE,
        --USER_ISSYSTEMCONTROLLED,
        MANAGER_ID AS USER_MANAGERID,
        NAME AS USER_NAME,
        PORTAL_ROLE AS USER_PORTALROLE,
        TITLE AS USER_TITLE,
        USER_ROLE_ID AS USER_USERROLEID,
        --USER_USERSUBTYPE,
        USER_NAME AS USER_USERNAME--,
        --USER_WORKSPACEID
                
    from base
)

select *
from final