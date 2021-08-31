{{ config(materialized='table') }}

select 
name,
type,
staff_count,
follower_count,
founded_on,
headquarter_country,
headquarter_city,
industries
from {{ ref('raw_company_data')}}