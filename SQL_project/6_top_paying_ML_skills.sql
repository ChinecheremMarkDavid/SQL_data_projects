/*
Question: What skills are required for the top-paying Machine Learning Engineer jobs?

Objective: Use the top 10 highest-paying Machine Learning Engineer jobs identified in the previous analysis.

Approach: Determine the specific skills required for these roles to identify key qualifications.

Purpose: Provide a detailed understanding of which skills are linked to high-paying jobs,
guiding professionals on which skills to prioritize.



*/

WITH top_paying_ml_skills AS (

SELECT
    job_id,
    job_title,
    salary_year_avg,
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
)

SELECT top_paying_ml_skills.*,
skills
FROM top_paying_ml_skills
INNER JOIN skills_job_dim ON top_paying_ml_skills.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY salary_year_avg DESC 

/*
### Key Insights from the Data:

1. **High-Paying Roles**: The dataset primarily lists roles for Senior Machine Learning Engineers, with a high average salary of $325,000. This indicates that specialized machine learning roles are highly valued and well-compensated.

2. **Skills in Demand**:
   - **Python**: A crucial skill for machine learning, emphasizing its importance in data processing, modeling, and deployment.
   - **Scala**: Often used for big data processing, highlighting the need for proficiency in languages beyond Python.
   - **AWS**: Cloud computing expertise is essential, suggesting that machine learning engineers must be adept at deploying models and managing data in cloud environments.
   - **Excel**: Despite being a basic tool, Excel remains relevant, particularly for data analysis and reporting.
   - **Terraform**: Infrastructure-as-code skills like Terraform are valued, reflecting the need for automation in managing cloud resources.

3. **Top-Paying Company**: Harnham is consistently listed, suggesting it's a key player offering competitive salaries to attract top talent in machine learning engineering.

These insights underscore the importance of a strong technical skill set in both programming and cloud computing for those pursuing high-paying roles in machine learning.


/*
