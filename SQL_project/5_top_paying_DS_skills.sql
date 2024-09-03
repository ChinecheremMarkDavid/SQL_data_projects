WITH top_paying_ds_skills AS(



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
        job_title_short = 'Data Scientist' AND
        job_location = 'Anywhere' AND
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT
        10
)
SELECT top_paying_ds_skills.*,
skills
FROM top_paying_ds_skills
INNER JOIN skills_job_dim ON top_paying_ds_skills.job_id = skills_job_dim.job_id
INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY salary_year_avg DESC

/*

### Insights on the Skills from the Data:

1. **Top-Paying Job Titles and Associated Skills**:
   - The highest paying jobs, such as "Staff Data Scientist/Quant Researcher" and "Staff Data Scientist - Business Analytics," are consistently associated with key skills like `SQL` and `Python`.
   - These skills are essential in data science roles, especially for high-level positions where advanced data manipulation and statistical analysis are crucial.

2. **Skill Frequency**:
   - Both `SQL` and `Python` are prominently featured across the top-paying job listings, highlighting their critical role in data science and analytics.
   - This consistency suggests that mastering these skills can significantly impact earning potential in data-related roles.

3. **Company-Specific Preferences**:
   - Different companies, like Selby Jennings and Algo Capital Group, prioritize similar technical skills (`SQL` and `Python`) for their high-paying positions, indicating industry-wide recognition of these competencies as valuable.

4. **Economic Value of Skills**:
   - The data reinforces the economic value of developing advanced proficiency in `SQL` and `Python`, as these skills not only align with job demand but also command some of the highest salaries in the market.

This analysis underscores the importance of focusing on these core technical skills if you're aiming to secure top-paying roles in the data analytics and data science fields.



/*