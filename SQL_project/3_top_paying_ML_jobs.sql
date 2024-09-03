/*
Question: What are the top-paying Machine Learning Engineer jobs?

Objective: Identify the top 10 highest-paying Machine Learning Engineer roles available remotely.

Approach: Focus on job postings with defined salary ranges, excluding entries with null values.

Bonus: Include the company names for added context on where the best opportunities exist.

Purpose: Showcase the highest-paying opportunities for Machine Learning Engineers, with insights into
flexible job options and leading employers.

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
    job_title_short = 'Machine Learning Engineer' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT
    10;


/*
Sure, here’s a structured analysis based on the data:

### Observations:

- **Role-Specific Trends**: High-level machine learning roles, such as Principal Engineer and Director of Engineering,
are prominent, indicating a demand for senior expertise in the field.

- **High Earning Roles**: Positions like Principal Machine Learning Engineer and Senior Machine Learning Engineer are among
the highest paid, reflecting the value placed on advanced technical skills and leadership.

- **Salary Distribution**: Salaries range from \$200,000 to \$325,000, with several roles offering over \$300,000.
This suggests a competitive salary landscape for specialized and senior roles.

- **Company-Specific Trends**: Companies like Acceler8 Talent and MongoDB are actively hiring for these high-paying roles,
highlighting their focus on attracting top machine learning talent.






RESULTS:
[
  {
    "job_id": 1352714,
    "job_title": "Principal Machine Learning Engineer",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "325000.0",
    "job_posted_date": "2023-11-24 14:25:28",
    "company_name": "Storm5"
  },
  {
    "job_id": 1480102,
    "job_title": "Senior Machine Learning Engineer",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "325000.0",
    "job_posted_date": "2023-02-21 22:37:17",
    "company_name": "Harnham"
  },
  {
    "job_id": 901491,
    "job_title": "Machine Learning Engineer",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "300000.0",
    "job_posted_date": "2023-11-24 18:02:30",
    "company_name": "orbit"
  },
  {
    "job_id": 589335,
    "job_title": "Principal Machine Learning Research Scientist (Deep Learning)",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "262500.0",
    "job_posted_date": "2023-03-01 20:28:07",
    "company_name": "Acceler8 Talent"
  },
  {
    "job_id": 751285,
    "job_title": "Machine Learning Researcher",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "262500.0",
    "job_posted_date": "2023-03-13 14:28:34",
    "company_name": "Acceler8 Talent"
  },
  {
    "job_id": 367792,
    "job_title": "Director of Engineering, ML Platform",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "249000.0",
    "job_posted_date": "2023-12-21 22:37:50",
    "company_name": "MongoDB"
  },
  {
    "job_id": 67310,
    "job_title": "Machine Learning Engineer",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "240000.0",
    "job_posted_date": "2023-03-27 14:29:37",
    "company_name": "Acceler8 Talent"
  },
  {
    "job_id": 801317,
    "job_title": "Sr. Machine Learning Engineer",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "225000.0",
    "job_posted_date": "2023-01-06 14:33:20",
    "company_name": "Acceler8 Talent"
  },
  {
    "job_id": 303478,
    "job_title": "Director of Engineering, ML Platform",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "222000.0",
    "job_posted_date": "2023-12-04 20:13:08",
    "company_name": "MongoDB"
  },
  {
    "job_id": 282701,
    "job_title": "Lead AI / ML / Data Science Engineer - Co Founder",
    "job_location": "Anywhere",
    "job_schedule_type": "Part-time",
    "salary_year_avg": "200000.0",
    "job_posted_date": "2023-12-23 21:42:00",
    "company_name": "Founding Teams"
  }
]
/*