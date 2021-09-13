select 
headquarter_country,
seniority,
count(seniority) as amount
from {{ref('stg_company_data')}} cd
left join {{ ref('job_postings__clean_titles') }} jp
    on cd.name = jp.company
where seniority is not null
group by headquarter_country, seniority
order by headquarter_country

