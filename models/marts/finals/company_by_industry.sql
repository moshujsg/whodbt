select
    industries,
    count(industries) as amount
from {{ref('stg_company_data')}}
group by industries
order by count(industries) desc
