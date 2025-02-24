 /*
 Questions: What Skills are required for The top-paying data analyst jobs?
 -Use the top 10 highest-paying Data Analyst jobs from first query
 -Add the specific skills required for these roles
 -Why? it provides a detailed look at which high-paying jobs demand certain skills, helping job seekers understand which skills to develop that align with top salaries
 */
 WITH top_Paying_jobs AS (
 SELECT
    job_id,
    job_title,
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
 )

 SELECT
  top_Paying_jobs.*,
  skills
 FROM top_Paying_jobs
 INNER JOIN skills_job_dim on top_Paying_jobs.job_id = skills_job_dim.job_id 
 INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id 
 ORDER BY Salary DESC


 /*SQL is a must-have skill for all data analyst roles.

Python is highly preferred, appearing in almost all job postings.

Tableau is the most popular data visualization tool, followed by Power BI and Excel.

Cloud platforms like AWS, Azure, and Snowflake are increasingly important for data analysts.

Advanced data processing tools like Pandas, PySpark, and Databricks are also in demand.

Collaboration and version control tools like Git, Jira, and Confluence are becoming more relevant, especially in hybrid or remote roles*/