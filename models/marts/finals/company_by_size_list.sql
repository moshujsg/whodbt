select
    case
        when cd.staff_count < 100 then '1. Small'
        when cd.staff_count >= 100 and cd.staff_count < 1000 then '2. Medium'
        when cd.staff_count >= 1000 and cd.staff_count <10000 then '3. Large'
        when cd.staff_count >= 10000 then '4. Very large'
        else 'No data'
    end as company_size,
    cd.name,
    cd.staff_count,
    cd.industries,
    cd.headquarter_country,
    cd.headquarter_city,
    jp.seniority
from {{ref('stg_company_data')}} cd
left join {{ ref('job_postings__clean_titles') }} jp
    on cd.name = jp.company
where seniority is not null


