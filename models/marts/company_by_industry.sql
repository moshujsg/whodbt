select
count(industries) as amount,
industries
from {{ref('stg_company_data')}}
group by industries
order by count(industries) desc 