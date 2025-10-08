WITH skills_count AS (
    SELECT 
        skills_job_dim.skill_id,
        COUNT(skills_job_dim.job_id) AS job_count        
    FROM 
        skills_job_dim
    LEFT JOIN 
        job_postings_fact ON skills_job_dim.job_id = job_postings_fact.job_id
    WHERE
        job_postings_fact.job_location = 'Anywhere' AND
        job_postings_fact.job_title_short = 'Data Analyst'
    GROUP BY
        skill_id 
)
SELECT 
    skills_count.skill_id,
    skills_count.job_count,
    skills_dim.skills AS name
FROM 
    skills_dim
JOIN 
    skills_count ON skills_count.skill_id = skills_dim.skill_id
ORDER BY
    job_count DESC
LIMIT 5
--count of the number of remote jobs per skill
