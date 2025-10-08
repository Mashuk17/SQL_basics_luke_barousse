SELECT 
    COUNT(job_id) as job_count,
    job_title_short, 
    --job_location,
    CASE
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
        ELSE 'Onsite'
    END AS location_catagory
FROM
     job_postings_fact
GROUP BY
    location_catagory,
    job_title_short
ORDER BY 
    job_title_short,
    job_count DESC