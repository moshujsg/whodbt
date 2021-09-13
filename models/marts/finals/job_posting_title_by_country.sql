{{ config(materialized='view') }}

with job_postings__clean_titles as (

    select * from {{ ref('job_postings__clean_titles') }}
)

select
    headquarter_country,
    cleaned_title, 
    count(cleaned_title) as job_postings_amount
    from {{ref('stg_company_data')}}
    left join job_postings__clean_titles
        on job_postings__clean_titles.company = {{ref ('stg_company_data')}}.name
    where cleaned_title is not null
    group by cleaned_title, headquarter_country, seniority
    order by headquarter_country
