select 
cd.industries,
seniority,
count(cd.industries) as amount
from {{ref('stg_company_data')}} cd
left join {{ ref('job_postings__clean_titles') }} jp
    on cd.name = jp.company
where seniority is not null
group by cd.industries, seniority
order by cd.industries

