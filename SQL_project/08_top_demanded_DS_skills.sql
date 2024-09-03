/*
Question: What are the most in-demand skills for Data Scientists?

Objective: Identify the top 5 in-demand skills for Data Scientists across all job postings.

Approach: Perform an analysis similar to the previous query to highlight highly sought-after skills.

Purpose: Provide insights into the most valuable skills in the market, helping job seekers target their
learning efforts toward in-demand competencies.


*/


SELECT skills,
    COUNT(job_postings_fact.job_id) as jobs_demanded
FROM job_postings_fact
INNER JOIN skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
WHERE
job_title_short = 'Data Scientist'
GROUP BY
    skills
ORDER BY
    jobs_demanded DESC
LIMIT 5;

/*
RESULT:

"skills","jobs_demanded"
"python","114016"
"sql","79174"
"r","59754"
"sas","29642"
"tableau","29513"
*/