select 
count(headquarter_country) as amount,
headquarter_country
from {{ref('stg_company_data')}}
group by headquarter_country
order by count(headquarter_country) desc
