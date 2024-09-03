WITH top_paying_skills AS (
    SELECT
        job_id,
        job_title,
        salary_year_avg,
        company.name AS company_name
    FROM
        job_postings_fact as jobs
    LEFT JOIN
        company_dim AS company
    ON
        company.company_id = jobs.company_id


    WHERE
        job_title_short = 'Data Analyst' AND
        job_location = 'Anywhere' AND
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT
        10
)

select top_paying_skills.*,
skills
FROM top_paying_skills
INNER JOIN skills_job_dim ON top_paying_skills.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY salary_year_avg DESC

/*
### Insights on Skills from the Analysis:

1. **High Salary Correlation**: The job titled "Associate Director- Data Insights" at AT&T has a very high average yearly salary of $255,829.5. This suggests that positions at higher levels within data-related fields, particularly those involving insights and decision-making, command significant salaries.

2. **Key Skills Identified**:
   - **SQL**: This skill is consistently requested, highlighting its fundamental role in data manipulation, querying, and database management. It's a core skill for many data-related roles.
   - **Python**: Python's appearance underlines its dominance in data analysis, machine learning, and automation tasks, making it a valuable skill for high-paying roles.
   - **R**: The inclusion of R suggests that statistical analysis and specialized data modeling are valuable for this role, especially in companies focused on data insights.
   - **Azure**: This skill reflects the increasing importance of cloud computing and data storage solutions. Employers value cloud skills, particularly for data-related roles, as companies continue to migrate data workloads to the cloud.
   - **Databricks**: Databricks emphasizes the demand for skills related to big data and analytics platforms. Expertise in handling and processing large datasets efficiently is highly valuable, especially for strategic roles.

3. **Skill Combination Strategy**: The combination of SQL, Python, R, Azure, and Databricks suggests a strategic alignment of skills that cater to advanced data analysis, cloud data engineering, and insights generation. Professionals looking to attain top-paying jobs should focus on these skills, particularly the integration of programming, statistical analysis, and cloud technologies.

4. **Demand for Versatile Skill Sets**: The skills listed span multiple domains (data querying, programming, cloud computing, and big data platforms), indicating that versatility is highly rewarded in the data job market. It reinforces the importance of being well-rounded in various technical skills to qualify for higher-level roles.

These insights highlight the critical skills needed to secure top-paying jobs in the data field, especially in roles focused on insights and decision-making. The emphasis is on a blend of programming, cloud, and analytical skills, illustrating the multi-disciplinary nature of high-value data roles.

/*
