/*
Question: What are the most optimal skills to learn (aka its inn high demand and a high-paying skill)?
-Identify skills in high demand and associated with high average salaries for dat analyst roles
-Concentrates on remote positions with specified salaries
-why? Targets skills that offer job security (high demand) and financiqal benefits (high salaries), offering strategic insights for career development in data analysis
*/
SELECT
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS Demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg),0) AS AVG_SALARY
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    and salary_year_avg is NOT NULL
    AND job_work_from_home = TRUE
GROUP BY
 skills_dim.skill_id
HAVING
 COUNT(skills_job_dim.job_id) > 10
ORDER BY
 AVG_SALARY DESC,
 demand_count DESC
LIMIT 25;