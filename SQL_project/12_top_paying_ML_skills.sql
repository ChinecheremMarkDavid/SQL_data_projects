/*
Question: What are the top skills based on salary for Machine Learning Engineers?

Objective: Analyze the average salary associated with each skill for Machine Learning Engineer roles.

Approach: Consider job postings with defined salaries to see which skills are most lucrative.

Purpose: Show how specific skills can significantly impact earnings, allowing engineers to identify
high-value skills.
*/




SELECT skills,
    ROUND(AVG(salary_year_avg), 0) as average_salary
FROM job_postings_fact
INNER JOIN skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
WHERE
job_title_short = 'Machine Learning Engineer' AND
salary_year_avg IS NOT NULL AND
job_work_from_home = TRUE
GROUP BY
    skills
ORDER BY
    average_salary DESC
LIMIT 25;

/*
The list highlights the top-paying skills related to machine learning and general software development, emphasizing the value of expertise in DevOps, data engineering, and backend development. Key insights from the data include:

1. **DevOps and Automation Skills**: Skills like Chef, Ansible, Docker, and Kubernetes dominate the top
spots, reflecting high demand and salaries for automation, deployment, and orchestration expertise in
machine learning pipelines and software infrastructure.

2. **Programming Languages**: Go (Golang), Scala, C#, and Python are among the top-paying languages,
showing the importance of versatile programming skills across different development needs, especially
in backend and data-focused roles.

3. **Data Management and Big Data**: Tools and platforms like MongoDB, BigQuery, Spark, and Hadoop are
highly valued, highlighting the demand for skills in handling, analyzing, and processing large datasets—key
components in machine learning applications.

4. **Cloud Platforms and Services**: Expertise in cloud platforms such as AWS and GCP, as well as tools
like Terraform for infrastructure as code, are highly compensated, emphasizing the shift toward
cloud-based machine learning and data solutions.

5. **Open Source and Version Control**: Skills in GitHub and GitLab suggest that proficiency in version
control systems and open-source collaboration is a valuable asset, reflecting the collaborative nature
of modern machine learning and software development projects.


Overall, the list indicates a strong demand for skills that enhance automation, cloud integration, and the
ability to handle complex data tasks, which are critical in the machine learning and data-driven development
landscape.


RESULTS:
"skills","average_salary"
"chef","325000"
"ansible","325000"
"golang","300000"
"excel","283333"
"scala","252500"
"mongodb","235500"
"docker","194331"
"c#","180000"
"kubernetes","174102"
"airflow","174064"
"java","171429"
"matplotlib","170000"
"github","170000"
"aws","168402"
"spark","168386"
"hadoop","167659"
"c","165318"
"gitlab","165318"
"flask","165318"
"bigquery","165000"
"gcp","163974"
"terraform","161875"
"typescript","160000"
"sql","152983"
"python","150570"

*/