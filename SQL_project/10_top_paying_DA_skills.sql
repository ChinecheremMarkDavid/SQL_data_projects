/*
Question: What are the top skills based on salary?

Objective: Assess the average salary associated with each skill for Data Analyst positions.

Approach: Focus on roles with specified salaries, regardless of location, to understand the financial
value of each skill.

Purpose: Highlight how specific skills influence salary levels, helping professionals pinpoint the
most rewarding skills to acquire or improve.

*/

SELECT skills,
    ROUND(AVG(salary_year_avg), 0) as average_salary
FROM job_postings_fact
INNER JOIN skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
WHERE
job_title_short = 'Data Analyst' AND
salary_year_avg IS NOT NULL AND
job_work_from_home = TRUE
GROUP BY
    skills
ORDER BY
    average_salary DESC
LIMIT 25;

/*
### Key Insights on the Top 25 Highest-Paying Data Analyst Skills

1. **High Salaries for Specialized Skills**:
   - The data reveals that specialized skills command the highest salaries in the data analyst market,
   with **PySpark** topping the list at an impressive average salary of $208,172. This suggests that
   expertise in data processing and large-scale data manipulation is highly valued.

2. **Emerging Tools and Technologies**:
   - Skills like **Bitbucket ($189,155)** and **Couchbase ($160,515)** indicate that version control and
   NoSQL databases are becoming crucial for high-paying roles. The demand for these tools highlights the
   industry's shift towards modern data management and software development practices.

3. **Machine Learning and AI Integration**:
   - Technologies such as **Watson ($160,515)** and **DataRobot ($155,486)** showcase the growing
   integration of AI and machine learning into data analysis. These tools, designed for automating
   data science workflows, are valuable for roles that involve predictive analytics and machine
   learning operations.

4. **DevOps and Data Engineering Skills**:
   - Skills like **GitLab ($154,500)**, **Jenkins ($125,436)**, and **Kubernetes ($132,500)** emphasize
   the importance of DevOps in data analytics. These tools help in automating CI/CD pipelines, deploying
   models, and managing containerized applications, crucial for modern data analyst roles.

5. **Programming Languages and Frameworks**:
   - **Swift ($153,750)**, **Golang ($145,000)**, and **Scala ($124,903)** appear in the list, reflecting
   the value of versatile programming languages in data analysis, especially those that support
   high-performance computing and backend data processes.

6. **Popular Data Analysis and Visualization Tools**:
   - **Jupyter ($152,777)**, **Pandas ($151,821)**, and **Numpy ($143,513)** are widely recognized as
   fundamental tools in data analysis and visualization, showing that mastery of these tools can
   significantly enhance earning potential.

7. **Cloud and Big Data Platforms**:
   - Skills in platforms such as **Databricks ($141,907)** and **GCP ($122,500)** highlight the importance
   of cloud-based big data processing. These platforms are integral for large-scale data analytics, machine
   learning, and efficient data handling.

8. **Database Management and Analytics Tools**:
   - Proficiency in **Elasticsearch ($145,000)**, **PostgreSQL ($123,879)**, and **MicroStrategy ($121,619)
   ** reflects the value of strong database management and business intelligence skills. They are critical
   for data retrieval, storage, and insightful data analysis.

9. **Versatile Workflow Automation Tools**:
   - **Airflow ($126,103)** shows up as a high-paying skill, underscoring the growing need for orchestrating
   complex data workflows, especially in ETL processes, which are pivotal in data pipeline management.

10. **Collaboration and Productivity Tools**:
    - Skills like **Notion ($125,000)** and **Atlassian ($131,162)** suggest that collaborative and project
    management tools are not only in demand but also contribute to higher salaries, likely due to their role
    in enhancing team efficiency and project oversight.


### Overall Analysis:
- **Core Insight**: The skills that command the highest salaries are those that enable data analysts to work
effectively with large-scale data, automate workflows, engage in cloud computing, and integrate machine
learning into analytics.

- **Strategic Career Growth**: For data analysts seeking to maximize their earning potential, focusing on
gaining expertise in high-demand, high-impact tools and technologies like PySpark, Bitbucket, and advanced
AI platforms is critical. Moreover, developing proficiency in programming languages and data engineering
tools will position them at the forefront of the market.

- **Market Evolution**: The prevalence of DevOps, cloud, and AI/ML skills in the list indicates that the
data analyst role is evolving beyond traditional analytics towards a more integrated tech-driven discipline.
Keeping up with these trends is essential for career advancement and securing top-paying roles in the
industry.





QUERY RESULTS:
"skills","average_salary"
"pyspark","208172"
"bitbucket","189155"
"couchbase","160515"
"watson","160515"
"datarobot","155486"
"gitlab","154500"
"swift","153750"
"jupyter","152777"
"pandas","151821"
"elasticsearch","145000"
"golang","145000"
"numpy","143513"
"databricks","141907"
"linux","136508"
"kubernetes","132500"
"atlassian","131162"
"twilio","127000"
"airflow","126103"
"scikit-learn","125781"
"jenkins","125436"
"notion","125000"
"scala","124903"
"postgresql","123879"
"gcp","122500"
"microstrategy","121619"


*/