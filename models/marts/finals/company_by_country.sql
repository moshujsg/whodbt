select
    headquarter_country,
    count(headquarter_country) as amount
from {{ref('stg_company_data')}}
group by headquarter_country
order by count(headquarter_country) desc
