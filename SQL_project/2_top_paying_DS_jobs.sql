/*
Question: What are the top-paying Data Scientist jobs?

Objective: Identify the top 10 highest-paying Data Scientist roles that offer remote work options.
Approach: Focus on job postings with specified salaries, excluding any with missing data.
Bonus: Include the names of companies offering these top-paying roles for a detailed overview.
Purpose: Highlight the most lucrative opportunities for Data Scientists, providing insights into flexible work arrangements and potential employers.

*/


SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
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
    10;


/*


### Observations:

- **Role-Specific Trends**: High-level and specialized data science roles, especially those involving quantitative research or business analytics, command significantly higher salaries.
- **High Earning Roles**: Staff Data Scientist positions at Selby Jennings top the salary list, emphasizing that specialized data science roles, particularly those involving quantitative research, are highly compensated.
- **Salary Distribution**: The salaries range from \$300,000 to \$550,000, with a mean salary of approximately \$365,850 and a standard deviation of \$93,799. This indicates a generally high salary level with moderate variability.
- **Company-Specific Trends**: Companies with a strong focus on technology and data, such as Mantys and Selby Jennings, are leading in salary offerings, emphasizing their investment in top data talent.

QUERY RESULTS:
[
  {
    "job_id": 40145,
    "job_title": "Staff Data Scientist/Quant Researcher",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "550000.0",
    "job_posted_date": "2023-08-16 16:05:16",
    "company_name": "Selby Jennings"
  },
  {
    "job_id": 1714768,
    "job_title": "Staff Data Scientist - Business Analytics",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "525000.0",
    "job_posted_date": "2023-09-01 19:24:02",
    "company_name": "Selby Jennings"
  },
  {
    "job_id": 1131472,
    "job_title": "Data Scientist",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "375000.0",
    "job_posted_date": "2023-07-31 14:05:21",
    "company_name": "Algo Capital Group"
  },
  {
    "job_id": 1742633,
    "job_title": "Head of Data Science",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "351500.0",
    "job_posted_date": "2023-07-12 03:07:31",
    "company_name": "Demandbase"
  },
  {
    "job_id": 551497,
    "job_title": "Head of Data Science",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "324000.0",
    "job_posted_date": "2023-05-26 22:04:44",
    "company_name": "Demandbase"
  },
  {
    "job_id": 126218,
    "job_title": "Director Level - Product Management - Data Science",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "320000.0",
    "job_posted_date": "2023-03-26 23:46:39",
    "company_name": "Teramind"
  },
  {
    "job_id": 1161630,
    "job_title": "Director of Data Science & Analytics",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "313000.0",
    "job_posted_date": "2023-08-23 22:03:48",
    "company_name": "Reddit"
  },
  {
    "job_id": 129924,
    "job_title": "Director of Data Science",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "300000.0",
    "job_posted_date": "2023-01-21 11:09:36",
    "company_name": "Storm4"
  },
  {
    "job_id": 226011,
    "job_title": "Distinguished Data Scientist",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "300000.0",
    "job_posted_date": "2023-08-06 11:00:43",
    "company_name": "Walmart"
  },
  {
    "job_id": 38905,
    "job_title": "Principal Data Scientist",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "300000.0",
    "job_posted_date": "2023-11-24 14:08:44",
    "company_name": "Storm5"
  }
]



*/