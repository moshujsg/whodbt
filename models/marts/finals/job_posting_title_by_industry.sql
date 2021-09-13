{{ config(materialized='view') }}

with job_postings__clean_titles as (

    select * from {{ ref('job_postings__clean_titles') }}

)

select
cd.industries,
cleaned_title, 
count(cleaned_title) as job_postings_amount
from {{ref('stg_company_data')}} cd
left join job_postings__clean_titles
    on job_postings__clean_titles.company = cd.name
where cleaned_title is not null
group by cd.industries, cleaned_title
order by cd.industries
    
