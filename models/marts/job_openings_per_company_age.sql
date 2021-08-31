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
        count(jp.job_id) as number_of_openings,
        count(cd.name) as number_of_companies,
        number_of_openings / number_of_companies as companies_to_jobs_ratio
from {{ ref('stg_job_postings') }} jp
right join stg_company_data cd 
    on cd.name = jp.company
group by ind, founded_on_period
order by ind