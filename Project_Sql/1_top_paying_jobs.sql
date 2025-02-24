/*
Questions: What are the top-paying Data Analyst?
-Identify the top 10 highest-paying Data Analyst Roles THAT are available remotely.
-Focus on job posting with specified salaries (remove nulls).
-Why? Highlight the top-paying opportunities for Data Analysts
 */ 
 SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg AS Salary,
    job_posted_date,
    name as company_name
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
  salary_year_avg IS NOT NULL AND job_title_short = 'Data Analyst' AND job_location = 'Anywhere'
ORDER BY
   salary_year_avg DESC
LIMIT
    10