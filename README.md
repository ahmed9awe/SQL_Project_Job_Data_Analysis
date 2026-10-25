
# UK Data Analyst Job Market Analysis

## Introduction

This project explores the UK Data Analyst job market using SQL to identify high-paying job opportunities, the skills employers demand most, and the technical skills associated with higher average salaries.

By analysing job postings, I wanted to understand what employers are looking for and which skills could be most valuable to develop as I work towards becoming a Data Analyst.

The analysis focuses on five key questions:

1. What are the highest-paying Data Analyst job postings in the UK?
2. What skills are required for the highest-paying job postings?
3. Which skills are most in demand for Data Analysts in the UK?
4. Which skills are associated with the highest average salaries?
5. Which skills offer a balance between demand and salary?

## Background

As someone working towards a career in data analytics, I wanted to use real job-market data to understand the skills and opportunities available to Data Analysts in the UK.

Rather than relying only on general advice about which skills to learn, I used SQL to explore job postings, compare salary information, and identify patterns in employer demand.

The aim was to turn raw job-market data into insights that could help guide my learning priorities and career development.

## Tools I Used

- **SQL:** Queried, joined, filtered, aggregated, and ranked job-posting data.
- **PostgreSQL:** Used as the relational database management system.
- **Visual Studio Code:** Wrote and organised the SQL queries.
- **Git & GitHub:** Managed version control and documented the project.

## The Analysis

### 1. What are the highest-paying Data Analyst job postings in the UK?

To identify the highest-paying opportunities, I filtered job postings to include Data Analyst roles in the United Kingdom with reported annual salary information. I then sorted the results from highest to lowest salary.

**SQL file:** `1_top_paying_jobs.sql`

```sql
SELECT
    company_dim.name AS company_name,
    job_title AS job,
    salary_year_avg AS salary,
    job_location AS location,
    job_schedule_type AS schedule_type,
    job_posted_date AS posted_date
FROM job_postings_fact
LEFT JOIN company_dim
    ON job_postings_fact.company_id = company_dim.company_id
WHERE job_title_short = 'Data Analyst'
    AND job_location = 'United Kingdom'
    AND salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10;
```

**Key findings:**

- Deutsche Bank had the highest reported annual salary in the results, at **$180,000** for a Market Data Lead Analyst position.
- Shell followed with a reported salary of **$156,500** for a Data Architect – Trading and Supply position.
- Hasbro offered a reported **$118,140** for a Senior Data Analyst role.
- The top 10 results included a range of titles, including Data Analyst, Senior Data Analyst, and other data-related specialist positions.

These results show that some data-related roles can offer substantial salaries. However, the results are limited to postings with reported salary information and should not be treated as a complete picture of the UK job market.

### 2. What skills are required for the highest-paying job postings?

I joined the highest-paying job postings to the skills tables to identify the technical skills associated with each role.

**SQL file:** `2_top_paying_job_skills.sql`

**Key findings:**

- **Excel** appeared across several of the highest-paying postings.
- **SQL and Python** appeared in multiple roles, including the Senior Data Analyst position at Hasbro.
- **Tableau and Power BI** appeared in several postings involving reporting and business intelligence.
- Other skills included R, Azure, Databricks, Git, and VBA.

The results demonstrate that employers may seek a combination of programming, spreadsheet, business intelligence, and specialist technical skills. The exact combination varies by role.

### 3. Which skills are most in demand for Data Analysts in the UK?

I counted the number of job-skill associations for each skill and ranked the results to identify the five most frequently appearing skills in the dataset.

**SQL file:** `3_most_in_demand_skills.sql`

**Top 5 most in-demand skills:**

| Rank | Skill | Demand count |
|---:|---|---:|
| 1 | SQL | 4,480 |
| 2 | Excel | 4,281 |
| 3 | Power BI | 2,865 |
| 4 | Python | 2,129 |
| 5 | Tableau | 1,644 |

**Key findings:**

- SQL ranked first, making it the most frequently appearing skill in this analysis.
- Excel ranked second, showing that spreadsheet skills remain highly relevant.
- Power BI, Python, and Tableau completed the top five.
- SQL and Excel would be sensible priorities for building a foundation in data analytics, followed by business intelligence tools and Python.

These figures represent job-skill associations in the dataset, rather than necessarily counting unique job postings for each skill.

### 4. Which skills are associated with the highest average salaries?

I calculated the average reported annual salary for each skill and ranked the results from highest to lowest. Only postings with reported salary information were included.

**SQL file:** `4_total_paying_skills.sql`

**Top 10 skills by average reported salary:**

| Rank | Skill | Average salary (USD) |
|---:|---|---:|
| 1 | NumPy | $177,283 |
| 2 | C++ | $177,283 |
| 3 | PyTorch | $177,283 |
| 4 | TensorFlow | $177,283 |
| 5 | Pandas | $177,283 |
| 6 | Kafka | $165,000 |
| 7 | PostgreSQL | $165,000 |
| 8 | Elasticsearch | $165,000 |
| 9 | MongoDB | $165,000 |
| 10 | Aurora | $165,000 |

**Key findings:**

- Python-related data tools and machine learning libraries, including NumPy, Pandas, PyTorch, and TensorFlow, appeared among the highest-ranked skills.
- Database and data infrastructure technologies, including PostgreSQL, MongoDB, Kafka, and Elasticsearch, also ranked highly.
- Several skills shared identical average salaries. This may indicate that they appeared in the same small group of high-paying postings, rather than each independently leading to the same salary.

These figures describe associations in the available salary data. They do not mean that learning one of these skills guarantees a particular salary, and the results may be influenced by a small number of postings.

### 5. Which skills offer a balance between demand and salary?

For this analysis, I examined skills that appeared more than 10 times among postings with reported salary information. I then ranked the skills by average salary, using demand count as a secondary ranking criterion.

**SQL file:** `5_most_optimal_skills.sql`

**Results:**

| Rank | Skill | Demand count | Average salary (USD) |
|---:|---|---:|---:|
| 1 | Python | 25 | $95,306 |
| 2 | SQL | 33 | $87,156 |
| 3 | Excel | 29 | $83,362 |
| 4 | Tableau | 13 | $82,079 |

**Key findings:**

- Python had the highest average salary among these four results.
- SQL had the highest demand count, with 33 job-skill associations.
- Excel combined a relatively high demand count with a substantial average reported salary.
- Tableau also appeared in the results, although its demand count was lower than those of SQL, Python, and Excel.

SQL, Excel, and Python stand out as useful skills to prioritise because they appeared frequently in the salary-reported postings analysed. However, this query ranks by average salary first and demand second; it does not calculate a single combined score for salary and demand.

## What I Learned

Through this project, I developed a better understanding of how SQL can be used to investigate real-world job-market data.

- **Joining tables:** Connected job postings, company information, and skill data using `JOIN` operations.
- **Filtering data:** Used `WHERE` clauses to focus on UK Data Analyst roles and postings with reported salaries.
- **Aggregating results:** Used `COUNT()`, `AVG()`, and `ROUND()` to summarise demand and salary information.
- **Grouping data:** Applied `GROUP BY` to analyse skills individually.
- **Sorting and ranking:** Used `ORDER BY` and `LIMIT` to identify the highest-ranked results.
- **Common table expressions:** Used a CTE to organise the analysis of skills associated with the highest-paying postings.
- **Interpreting results:** Learned that high average salaries and high demand are different measures, and that salary results can be affected by the number and type of postings available.

## Conclusions

This project helped me explore the UK Data Analyst job market using SQL and identify several useful patterns.

1. **SQL and Excel are important foundations.** They ranked first and second in the most in-demand skills analysis.
2. **Business intelligence tools are relevant.** Power BI and Tableau both appeared among the most frequently requested skills.
3. **Python is worth developing.** It appeared among the most in-demand skills and ranked highly in the salary-reported skills analysis.
4. **Specialist technical skills can be associated with high salaries.** Libraries and technologies such as NumPy, Pandas, PostgreSQL, and Kafka appeared in the highest average salary results, although these results may reflect a limited number of postings.
5. **Skill priorities should consider more than salary.** Demand, the number of salary-reported postings, role requirements, and personal career goals all matter when deciding what to learn.

Overall, the analysis supports building a strong foundation in SQL and Excel, then developing skills in Python and business intelligence tools while continuing to explore the requirements of specific Data Analyst roles.

## Project Structure

```text
SQL_Project_Job_Data_Analysis/
└── Project_SQL/
    ├── 1_top_paying_jobs.sql
    ├── 2_top_paying_job_skills.sql
    ├── 3_most_in_demand_skills.sql
    ├── 4_total_paying_skills.sql
    └── 5_most_optimal_skills.sql
```

## Data Source

The project uses the job-posting dataset from Luke Barousse's SQL course project.

- [Original dataset and project repository](https://github.com/lukebarousse/SQL_Project_Data_Job_Analysis)
---
*This project was completed as part of my ongoing development in SQL and data analytics.*

