SELECT
    company_dim.name AS company_name,
    job_title AS job,
    salary_year_avg AS salary,
    job_location AS location,
    job_schedule_type AS schedule_type,
    job_posted_date AS posted_date
FROM job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE job_title_short = 'Data Analyst' AND
    job_location = 'United Kingdom' AND
    salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10