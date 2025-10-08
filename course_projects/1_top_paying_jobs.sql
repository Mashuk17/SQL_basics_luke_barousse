-- Top 10 highest paying remote Data Analyst jobs
SELECT
    job_title, 
    company_dim.name AS company_name, 
    salary_year_avg
FROM 
    job_postings_fact 
    LEFT JOIN company_dim  using(company_id)
WHERE  
    job_title_short = 'Data Analyst'
    AND job_location = 'Anywhere'
    AND salary_year_avg IS NOT NULL
ORDER BY 
    salary_year_avg desc
LIMIT 10;


