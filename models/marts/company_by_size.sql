select
case
    when staff_count < 100 then 'Small'
    when staff_count >= 100 and staff_count < 1000 then 'Medium'
    when staff_count >= 1000 and staff_count <10000 then 'Large'
    when staff_count >= 10000 then 'Very large'
    else 'No data' 
    end as Company_size,
count(Company_size) as Number_of_companies
from {{ref('stg_company_data')}}
group by Company_size
