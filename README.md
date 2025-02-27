# Introduction

Dive into the data job market! Focusing on data analyst roles, this project explores top-paying jobs, in-demand skilss, and ehre high demand meets high salary in data analytics.

Sql Queries? check them out here: [project_sql](/Project_Sql/)

# Background

Driven bye a quest to navigate the data analyst job market more effectively, this project was born from desire to pinpoijnt top-paid job and in-demand skills, streamlining others work to find optimal jobs.

### The questions I wanted to answer through my SQL queries were:

1. What are the top-paying data analyst jobs?
2. What skills are required for these top-paying jobs?
3. What skills are most in demand for data analysts?
4. which skills are associated with higher salaries?
5. What are the most optimal skills to learn?

# Tools I Used

For my deep dive into the data analyst job market, I harnesses the power of several key tools:

- SQL: The backbone of my analysis, allowing me to query the database and unearth critical insight.
- **PostgreSQL:** The chose datbase management system, ideal for handling the job posting data.
- **Visual Studio Code:** My go-to for database management and execting SQL queries.
- **Git& GitHub:** Essential for version control and sharing my SQL scripts and analysis, ensutring collaberation and project tracking.

# The Analysis

Each query for this project aimed at investigating specific aspects of the dat analyst job market. here's how i approached each question:

### What are the top-paying data analyst jobs?

To identify the highest-paying roles, I filtered data analyst positions by average yearly salary and location, focusing on remote jobs. this query highlights the high paying opportunitties int he field.

```sql
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
```

Here's the breakdown of the top data analyst jobs in 2023:

- **Wide Salary Range:** Top 10 paying data analyst roles span from $184,000 to 650,000, indicationg significant salary potiential int he field.
- **Diverse Employers:** Companies like SmartAsset, Meta, AT&T are among those offering high salaries, showing a broad interest across different industries.
- **Job Title Variety:** There's a high diversity in job titles, from data Analyst to Director of Analytics, reflecting varied roles and specializations within data analytics.

### What skills are required for these top-paying jobs?

```sql
WITH top_Paying_jobs AS (
    SELECT
        job_id,
        job_title,
        salary_year_avg AS Salary,
        job_posted_date,
        name AS company_name
    FROM
        job_postings_fact
    LEFT JOIN
        company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        salary_year_avg IS NOT NULL
        AND job_title_short = 'Data Analyst'
        AND job_location = 'Anywhere'
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)

SELECT
    top_Paying_jobs.*,
    skills
FROM
    top_Paying_jobs
INNER JOIN
    skills_job_dim ON top_Paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    Salary DESC;

```

Analysis of Top-Paying Remote Data Analyst Jobs

This analysis highlights the key insights, skills, and trends shaping the top-paying remote Data Analyst job market. The data is based on job postings with salaries exceeding $180,000.

---

## **Key Insights**

#### 1. **Top-Paying Roles**

- The highest-paying role is **"Associate Director- Data Insights"** at **AT&T**, with a salary of **$255,829.5**.
- Other high-paying roles include:
  - **"Data Analyst, Marketing"** at **Pinterest** ($232,423).
  - **"Data Analyst (Hybrid/Remote)"** at **Uclahealthcareers** ($217,000).

---

#### 2. **Most In-Demand Skills**

- **SQL** is a **universal requirement** across all top-paying Data Analyst jobs.
- **Python** is the second most common skill, required in almost all high-paying roles.
- **Tableau** is frequently required for data visualization, appearing in most job postings.
- Other notable skills include **R**, **Excel**, **Pandas**, **Snowflake**, and **Power BI**.

---

#### 3. **Emerging Trends**

- **Cloud platforms** like **Azure**, **AWS**, and **Snowflake** are increasingly important for data storage and processing.
- Tools like **Databricks**, **PySpark**, and **Hadoop** indicate a growing demand for **big data processing** skills.
- **Version control tools** like **Git**, **GitLab**, and **Bitbucket** are becoming essential for collaboration in data teams.

---

#### 4. **Company Insights**

- Companies like **AT&T**, **Pinterest**, and **SmartAsset** are offering the highest salaries for Data Analysts.
- Roles at **AT&T** require the most diverse skill set, including advanced tools like **Databricks**, **PySpark**, and **Jupyter**.

---

#### 5. **Salary Range**

- Salaries for top-paying remote Data Analyst roles range from **$184,000** to **$255,829.5**.
- The average salary for these top roles is approximately **$215,000**.

---

#### 6. **Key Takeaways**

- To secure a high-paying Data Analyst role, focus on mastering **SQL**, **Python**, and **Tableau**.
- Familiarity with **cloud platforms** (Azure, AWS, Snowflake) and **big data tools** (Databricks, Hadoop) can give you a competitive edge.
- Remote Data Analyst roles are highly lucrative, with salaries exceeding **$200,000** for senior positions.

### What skills are most in demand for data analysts?

```sql
SELECT
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM
    job_postings_fact
INNER JOIN
    skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND job_location = 'Anywhere'
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5;
```

## Data Analyst Skills Demand Analysis

#### Most In-Demand Skills for Data Analysts

1. **SQL**

   - **Demand Count**: 7,291
   - **Reason**: SQL is essential for querying and managing data in relational databases, a core task for data analysts.

2. **Excel**

   - **Demand Count**: 4,611
   - **Reason**: Excel remains a fundamental tool for data manipulation, analysis, and visualization, especially for quick analyses or in smaller organizations.

3. **Python**

   - **Demand Count**: 4,330
   - **Reason**: Python's versatility in data analysis, machine learning, and automation makes it a critical skill for modern data analysts.

4. **Tableau**

   - **Demand Count**: 3,745
   - **Reason**: Tableau is a leading tool for data visualization, enabling the creation of interactive and shareable dashboards.

5. **Power BI**
   - **Demand Count**: 2,609
   - **Reason**: Power BI is a popular tool for data visualization and business intelligence, particularly in organizations that use Microsoft products.

#### Summary

- **Top Skills**: SQL, Excel, and Python are the most in-demand skills, reflecting the need for strong data querying, manipulation, and programming capabilities.
- **Visualization Tools**: Tableau and Power BI are also highly sought after, emphasizing the importance of presenting data insights effectively.

This analysis highlights the key skills required for data analysts in today's job market.

### which skills are associated with higher salaries?

```sql
SELECT
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM
    job_postings_fact
INNER JOIN
    skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND job_work_from_home = TRUE
    AND salary_year_avg IS NOT NULL
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25;
```

# Skills and Salary Analysis

### Top 5 Highest-Paying Skills

1. **PySpark**: $208,172
2. **Bitbucket**: $189,155
3. **Couchbase** and **Watson**: $160,515
4. **DataRobot**: $155,486
5. **GitLab**: $154,500

#### Key Observations

- **Big Data & AI/ML**: PySpark, Couchbase, Watson, and DataRobot dominate, reflecting high demand for big data and AI/ML expertise.
- **DevOps Tools**: Bitbucket and GitLab highlight the importance of DevOps and collaboration skills.
- **Data Science Libraries**: Pandas, NumPy, and Scikit-learn are well-compensated, emphasizing demand for data science skills.
- **Cloud & Infrastructure**: GCP and Kubernetes are associated with competitive salaries, showing the value of cloud and container skills.

#### Summary

The highest-paying skills are in **big data (PySpark)**, **AI/ML (Watson, DataRobot)**, and **DevOps (Bitbucket, GitLab)**. Data science libraries and cloud skills also command high salaries, reflecting their importance in the tech industry.

### What are the most optimal skills to learn?

```sql
SELECT
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
FROM
    job_postings_fact
INNER JOIN
    skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = TRUE
GROUP BY
    skills_dim.skill_id
HAVING
    COUNT(skills_job_dim.job_id) > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 25;
```

## Optimal Skills to Learn for Data Analysts

### Key Metrics:

- **Demand Count**: Number of job postings requiring the skill.
- **Average Salary**: Average yearly salary for jobs requiring the skill.

### Top Optimal Skills to Learn

#### 1. **Python**

- **Demand Count**: 236
- **Average Salary**: $101,397
- **Why Learn?**: Python is the most in-demand skill with a high average salary, making it essential for data analysis, automation, and machine learning.

#### 2. **Tableau**

- **Demand Count**: 230
- **Average Salary**: $99,288
- **Why Learn?**: Tableau is highly sought after for data visualization, with a strong demand and competitive salary.

#### 3. **R**

- **Demand Count**: 148
- **Average Salary**: $100,499
- **Why Learn?**: R is widely used for statistical analysis and data science, offering a good balance of demand and salary.

#### 4. **Looker**

- **Demand Count**: 49
- **Average Salary**: $103,795
- **Why Learn?**: Looker is a powerful BI tool with a high average salary, making it valuable for data visualization and business intelligence roles.

#### 5. **Snowflake**

- **Demand Count**: 37
- **Average Salary**: $112,948
- **Why Learn?**: Snowflake is a leading cloud data platform with a high salary and growing demand.

#### 6. **Azure**

- **Demand Count**: 34
- **Average Salary**: $111,225
- **Why Learn?**: Azure is a key cloud platform with high demand and a strong salary, essential for cloud-based data solutions.

#### 7. **AWS**

- **Demand Count**: 32
- **Average Salary**: $108,317
- **Why Learn?**: AWS is another critical cloud platform, offering high salaries and strong demand.

#### 8. **Hadoop**

- **Demand Count**: 22
- **Average Salary**: $113,193
- **Why Learn?**: Hadoop is valuable for big data processing, with a high salary and moderate demand.

#### 9. **Go**

- **Demand Count**: 27
- **Average Salary**: $115,320
- **Why Learn?**: Go (Golang) is a high-paying skill with growing demand, especially for backend and data engineering roles.

#### 10. **SQL Server**

- **Demand Count**: 35
- **Average Salary**: $97,786
- **Why Learn?**: SQL Server is a foundational skill for database management, with steady demand and a good salary.

### Summary of Optimal Skills

| Skill          | Demand Count | Average Salary | Why Learn?                                                                |
| -------------- | ------------ | -------------- | ------------------------------------------------------------------------- |
| **Python**     | 236          | $101,397       | Most in-demand skill for data analysis, automation, and machine learning. |
| **Tableau**    | 230          | $99,288        | Essential for data visualization and business intelligence.               |
| **R**          | 148          | $100,499       | Widely used for statistical analysis and data science.                    |
| **Looker**     | 49           | $103,795       | High-paying BI tool for data visualization and analytics.                 |
| **Snowflake**  | 37           | $112,948       | Leading cloud data platform with high demand and salary.                  |
| **Azure**      | 34           | $111,225       | Key cloud platform for data solutions.                                    |
| **AWS**        | 32           | $108,317       | Critical cloud platform with strong demand.                               |
| **Hadoop**     | 22           | $113,193       | Valuable for big data processing.                                         |
| **Go**         | 27           | $115,320       | High-paying skill for backend and data engineering.                       |
| **SQL Server** | 35           | $97,786        | Foundational skill for database management.                               |

## Conclusion

The most **optimal skills to learn** are **Python**, **Tableau**, and **R**, due to their high demand and competitive salaries. Additionally, cloud platforms like **Snowflake**, **Azure**, and **AWS**, as well as tools like **Looker** and **Hadoop**, are highly valuable for specialized roles. Learning these skills will position you well for high-paying and in-demand Data Analyst roles.

# What I Learned

Throughout this adventure, I've turbocharged my SQL toolkit with some serious firepower:

- **Complex Query Crafting:** Mastered the art of advanced SQL, merging table like a pro and wielding WITH cluases for ninja-level temp table maneuvers.
- **Data Aggregation:** Got cozy with GROUP BY and turned aggregate function like COUNT()and AVG() into my dat-summarizing sidekicks.
- **Analytical Wizardry** Leveled up my real-world puzzle-sovleing skills, turing questions into actionable, insightful SQL quries.

## **Closing Thoughts**

This project significantly enhanced my **SQL skills** and provided **valuable insights** into the data analyst job market. The findings from the analysis serve as a **practical guide** for prioritizing skill development and job search efforts.

For **aspiring data analysts**, focusing on **high-demand, high-salary skills** such as Python, Tableau, and cloud platforms (e.g., Snowflake, Azure) can help position them competitively in the job market. This exploration underscores the importance of **continuous learning** and **adaptation to emerging trends** in the ever-evolving field of data analytics.

By leveraging these insights, individuals can make informed decisions about which skills to develop and align their career paths with the demands of the industry.
