-- skills required for the top 10 remote data analyst jobs
WITH top_paying_jobs as(
    SELECT
        job_id,
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
    LIMIT 10
)

SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim USING(job_id)
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY salary_year_avg DESC