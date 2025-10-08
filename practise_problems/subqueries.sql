SELECT *
FROM (
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
) AS january_jobs
--THIS CREATES A TEMPORARY TABLE FOR JANUARY JOBS WITHOUT CREATEING A REAL IN TABLE IN THE DATABASE





SELECT
    company_id,
    name as company_name
FROM
    company_dim
WHERE company_id IN 
    (
SELECT 
    company_id,
FROM
    job_postings_fact
WHERE
    job_no_degree_mention = true
    ) 