select
    cd.name,
    cd.type,
    cd.staff_count,
    cd.follower_count,
    cd.founded_on,
    cd.headquarter_country,
    cd.headquarter_city,
    cd.industries,
    jp.cleaned_title,
    jp.location,
    jp.seniority,
    jp.job_id    
from {{ ref('job_postings__clean_titles') }} jp
left join {{ref('stg_company_data')}} cd
    on cd.name = jp.company

