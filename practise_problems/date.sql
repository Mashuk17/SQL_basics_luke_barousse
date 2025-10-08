SELECT 
    job_title_short as title,
    job_location AS location,
    job_posted_date :: date AS date
FROM 
    job_postings_fact
LIMIT 
    100

SELECT 
    job_title_short AS title,
    job_location AS location,
    job_posted_date at time zone 'utc' at time zone 'est'  AS date
FROM 
    job_postings_fact
LIMIT    
    10

SELECT 
    job_title_short as title,
    job_location AS location,
    job_posted_date as date,
    EXTRACT(day FROM job_posted_date) AS job_day,
    EXTRACT(month FROM job_posted_date) AS job_month
FROM 
    job_postings_fact
LIMIT   
    10


SELECT
    count(job_id)  as job_count,
    extract(month from job_posted_date) as month
from
    job_postings_fact
where
    job_title_short = 'Data Analyst'
group by 
    month
order by    
    job_count desc
