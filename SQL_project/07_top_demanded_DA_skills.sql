/*

Objective: Determine the top 5 most in-demand skills for Data Analysts using job postings data.

Approach: Analyze job postings by performing an inner join similar to the second query, considering all
available positions.

Purpose: Identify the skills with the highest demand, offering valuable insights into which competencies
are most sought after in the job market.


*/


SELECT
    skills,
    COUNT(job_postings_fact.job_id) AS job_demamded
FROM job_postings_fact
INNER JOIN skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    skills
ORDER BY
    job_demamded DESC
LIMIT 5;

/*
RESULT:

"skills","job_demamded"
"sql","92628"
"excel","67031"
"python","57326"
"tableau","46554"
"power bi","39468"








*/