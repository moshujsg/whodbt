with job_postings__clean_titles as (

    select * from {{ ref('job_postings__clean_titles') }}

)

select
seniority,
count(cleaned_title)
from {{ ref('job_postings__clean_titles') }} jp
left join {{ref('stg_company_data')}} cd
    on cd.name = jp.company
group by seniority
