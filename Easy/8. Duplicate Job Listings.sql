SELECT COUNT(DISTINCT company_id) AS duplicate_companies 
FROM (
    SELECT company_id,
            title,
            description,
            COUNT(job_id) AS job_count
    FROM job_listings
    GROUP BY company_id, title, description
) as job_count_cte
WHERE job_count > 1