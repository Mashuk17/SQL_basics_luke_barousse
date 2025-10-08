--JOB POSTING FROM FIRST 3 qUARTERS WITH SALARY GREATER THAN 70K

SELECT *
FROM (
    SELECT *
    FROM january_jobs
    UNION ALL
    SELECT *
    FROM february_jobs
    UNION ALL
    SELECT *
    FROM march_jobs
) AS first_quarter

WHERE salary_year_avg > 70000 AND
    job_title_short = 'Data Analyst'
ORDER BY salary_year_avg
