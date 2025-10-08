--CTEs basic example
WITH january_jobs AS (
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
)
SELECT * 
FROM january_jobs
ORDER BY job_posted_date;

--companies with most job openings

WITH company_job_count AS (
SELECT
    company_id,
    count(*) AS job_count
FROM 
    job_postings_fact
GROUP BY
    company_id
)

SELECT
    company_dim.name,
    company_job_count.job_count
FROM 
    company_dim
LEFT JOIN company_job_count ON company_job_count.company_id = company_dim.company_id
ORDER BY
    job_count DESC
