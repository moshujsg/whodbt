select 
    case
        when founded_on > 2010 then '4'
        when founded_on <= 2010 and founded_on > 2000 then '3'
        when founded_on <= 2000 and founded_on > 1970 then '2'      
        when founded_on <= 1970 then '1'
        else '5' 
        end as ind,
    case
        when founded_on > 2010 then '2011 - present'
        when founded_on <= 2010 and founded_on > 2000 then '2001 - 2010'
        when founded_on <= 2000 and founded_on > 1970 then '1971 - 2000'      
        when founded_on <= 1970 then '< 1970'
        else 'no_data'  
        end as founded_on_period,
        seniority,
        count(cd.industries) as amount
from {{ ref('job_postings__clean_titles') }} jp
right join {{ref('stg_company_data')}} cd
    on cd.name = jp.company
where seniority is not null
group by ind,seniority, founded_on_period
order by ind