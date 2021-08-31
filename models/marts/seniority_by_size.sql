select
    case
        when staff_count < 100 then 'Small'
        when staff_count >= 100 and staff_count < 1000 then 'Medium'
        when staff_count >= 1000 and staff_count <10000 then 'Large'
        when staff_count >= 10000 then 'Very large'
        else 'No data' 
        end as Company_size,
    seniority,
    count(seniority)
from {{ref('stg_company_data')}} cd
left join {{ ref('job_postings__clean_titles') }} jp
    on cd.name = jp.company
where seniority is not null
group by Company_size, seniority
order by company_size
