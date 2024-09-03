/*
Question: What are the most optimal skills to learn (high demand and high pay)?

Objective: Identify skills that are both in high demand and associated with high average salaries
for Data Analyst roles.

Approach: Concentrate on remote positions with specified salaries to ensure relevance and applicability.

Purpose: Provide strategic insights into skills that offer both job security (due to high demand) and
financial benefits (high salaries), guiding professionals on the best skills to develop for career
advancement in data analysis.
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
        job_title_short = 'Data Analyst' 
        AND salary_year_avg IS NOT NULL
        AND job_work_from_home = True 
    GROUP BY
        skills_dim.skill_id
), 

-- Skills with high average salaries for Data Analyst roles
average_salary AS (
    SELECT 
        skills_job_dim.skill_id,
        ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst'
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
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = True 
GROUP BY
    skills_dim.skill_id
HAVING
    COUNT(skills_job_dim.job_id) > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 25;



/*
This dataset shows the demand and average salaries for various tech skills:

- **High Demand, Lower Pay**: Skills like Python, R, and Tableau have high demand but offer lower salaries
(around $100,000) due to their common use.
  
- **High Salary, Lower Demand**: Specialized skills like Go, Snowflake, and BigQuery offer higher salaries
(over $110,000) but are less in demand, reflecting their niche value.

- **Key Areas**: High-paying skills are mainly in cloud platforms (AWS, Azure), programming (Go, Java),
and data engineering (Hadoop, Spark).

- **Overall Insight**: Specialized skills in cloud, big data, and newer programming languages are highly
valued and better paid, while foundational skills have higher demand but lower pay.

Conclusion

The data suggests that specialization and proficiency in cloud platforms, newer programming languages,
and advanced data management tools can significantly increase earning potential. High demand for core
skills like Python and Tableau underscores their essential role in data-related roles, even if their
salaries are comparatively modest due to the large supply of professionals with these skills.


RESULTS:
"skill_id","skills","demand_count","avg_salary"
8,"go","27","115320"
234,"confluence","11","114210"
97,"hadoop","22","113193"
80,"snowflake","37","112948"
74,"azure","34","111225"
77,"bigquery","13","109654"
76,"aws","32","108317"
4,"java","17","106906"
194,"ssis","12","106683"
233,"jira","20","104918"
79,"oracle","37","104534"
185,"looker","49","103795"
2,"nosql","13","101414"
1,"python","236","101397"
5,"r","148","100499"
78,"redshift","16","99936"
187,"qlik","13","99631"
182,"tableau","230","99288"
197,"ssrs","14","99171"
92,"spark","13","99077"
13,"c++","11","98958"
186,"sas","63","98902"
7,"sas","63","98902"
61,"sql server","35","97786"
9,"javascript","20","97587"

*/
