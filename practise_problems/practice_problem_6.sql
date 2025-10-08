-- January
CREATE TABLE january_jobs AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 1;

-- February
CREATE TABLE february_jobs AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 2;

-- March
CREATE TABLE march_jobs AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 3;

SELECT *
from  march_jobs


-- January 
CREATE TABLE january_jobs_trial AS
SELECT job_posted_date
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 1;
-- includes only the job_posted_month in the new table