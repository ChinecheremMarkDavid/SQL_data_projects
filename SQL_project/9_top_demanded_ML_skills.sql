/*
Question: What are the most in-demand skills for Machine Learning Engineers?

Objective: Identify the top 5 most in-demand skills for Machine Learning Engineers from job postings.

Approach: Perform a comprehensive analysis of all job postings to find the most sought-after skills.

Purpose: Highlight the skills that are critical in the market, helping engineers understand which areas
to focus on for career advancement.


*/

SELECT skills,
    COUNT(job_postings_fact.job_id) as jobs_demanded
FROM job_postings_fact
INNER JOIN skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
WHERE
job_title_short = 'Machine Learning Engineer'
GROUP BY
    skills
ORDER BY
    jobs_demanded DESC
LIMIT 5;

/*
RESULT:

"skills","jobs_demanded"
"python","9685"
"pytorch","4389"
"tensorflow","4307"
"aws","3780"
"sql","3497"

*/