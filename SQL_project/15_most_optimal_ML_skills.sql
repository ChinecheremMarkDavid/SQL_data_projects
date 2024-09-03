/*
Question: What are the most optimal skills to learn for Machine Learning Engineers
(high demand and high pay)?

Objective: Find skills that are both highly demanded and offer high average salaries for Machine
Learning Engineers.

Approach: Focus on remote positions with specified salaries to find relevant skills.

Purpose: Guide engineers toward skills that provide both job security and financial rewards,
offering a strategic approach to career development in machine learning.
*/


WITH skills_demand AS (
    SELECT
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) AS demand_count
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Machine Learning Engineer' 
        AND salary_year_avg IS NOT NULL
        AND job_work_from_home = True 
    GROUP BY
        skills_dim.skill_id
), 

-- Skills with high average salaries for Machine Learing roles roles
average_salary AS (
    SELECT 
        skills_job_dim.skill_id,
        ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Machine Learning Engineer'
        AND salary_year_avg IS NOT NULL
        AND job_work_from_home = True 
    GROUP BY
        skills_job_dim.skill_id
)
SELECT 
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Machine Learning Engineer'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = True 
GROUP BY
    skills_dim.skill_id
HAVING
    COUNT(skills_job_dim.job_id) > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC;



/*
INSIGHTS

1. **Top Salary**: AWS has the highest average salary at $168,402 despite having a lower demand count (12).
This suggests that AWS skills are highly valued and command a premium.

2. **Competitive Salaries**: SQL and Python also offer competitive salaries, with SQL at $152,983 and
Python at $150,570. This indicates strong financial rewards for expertise in these areas.

3. **Machine Learning**: PyTorch, while having a lower average salary of $122,893, is still a
sought-after skill, which reflects its importance in the machine learning field.

4. **Demand and Salary Correlation**: There is a noticeable difference in average salaries despite similar
demand counts for some skills. For example, AWS's higher salary compared to SQL and Python suggests
it is a specialized skill with a higher earning potential.

**Conclusion**: Skills in AWS, SQL, and Python are well-compensated and important for data professionals.
Although PyTorch has a lower salary compared to the others, it remains a valuable skill in the machine
learning domain. Specializing in high-demand areas like AWS could lead to significant salary benefits.


RESULTS:
"skill_id","skills","demand_count","avg_salary"
76,"aws","12","168402"
0,"sql","11","152983"
1,"python","33","150570"
101,"pytorch","11","122893"

*/
