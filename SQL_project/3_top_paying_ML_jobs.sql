SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    company.name as company_name
FROM
    job_postings_fact as jobs
LEFT JOIN
    company_dim AS company
ON
    company.company_id = jobs.company_id
WHERE
    job_title_short = 'Machine Learning Engineer' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC










LIMIT
    10