/*
Question: What are the most optimal skills to learn for Data Scientists (high demand and high pay)?

Objective: Pinpoint skills that are both in high demand and associated with high average salaries in
Data Scientist roles.

Approach: Concentrate on remote positions with specified salaries for greater relevance.

Purpose: Highlight skills that provide both job security (high demand) and financial benefits
(high salaries), offering strategic insights for career growth in data science.
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
        job_title_short = 'Data Scientist' 
        AND salary_year_avg IS NOT NULL
        AND job_work_from_home = True 
    GROUP BY
        skills_dim.skill_id
), 

-- Skills with high average salaries for Data Scientist roles
average_salary AS (
    SELECT 
        skills_job_dim.skill_id,
        ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Scientist'
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
    job_title_short = 'Data Scientist'
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

INSIGHTS:
Here are some key insights from the data on the most optimal data science skills:

1. **High Demand and Salary**: Python has the highest demand with 763 counts and an average salary of
$143,828, making it a critical skill in data science. Similarly, skills like TensorFlow and PyTorch 
have high demand and competitive salaries, highlighting their importance in machine learning.


2. **Emerging Tools**: Skills related to data processing and cloud platforms, such as Snowflake, AWS,
and Google Cloud Platform (GCP), show strong demand and relatively high salaries. This indicates the
growing importance of cloud-based data solutions.


3. **Data Visualization**: Tableau, with high demand (219 counts) and a substantial salary, underlines
the significance of data visualization in communicating insights effectively.


4. **Complementary Skills**: Skills like SQL-based tools (e.g., Redshift, BigQuery) and data manipulation
libraries (e.g., Pandas, NumPy) are also in demand, suggesting a well-rounded skill set is essential for
data science roles.


**Conclusion**: Python remains the most crucial skill for data scientists, but proficiency in machine
learning frameworks (TensorFlow, PyTorch), cloud platforms (AWS, GCP), and data visualization tools
(Tableau) can significantly enhance career prospects and salary potential. Balancing these skills with
foundational data processing and manipulation capabilities is key to staying competitive in the
field.



RESULTS:
"skill_id","skills","demand_count","avg_salary"
26,"c","48","164865"
8,"go","57","164691"
187,"qlik","15","164485"
185,"looker","57","158715"
96,"airflow","23","157414"
77,"bigquery","36","157142"
3,"scala","56","156702"
81,"gcp","59","155811"
80,"snowflake","72","152687"
101,"pytorch","115","152603"
78,"redshift","36","151708"
99,"tensorflow","126","151536"
233,"jira","22","151165"
92,"spark","149","150188"
76,"aws","217","149630"
94,"numpy","73","149089"
106,"scikit-learn","81","148964"
95,"pyspark","34","147544"
182,"tableau","219","146970"
2,"nosql","31","146110"
4,"java","64","145706"
196,"powerpoint","23","145139"
93,"pandas","113","144816"
213,"kubernetes","25","144498"
1,"python","763","143828"


*/