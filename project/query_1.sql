/* top paying data analyst jobs
- Identify top 10 highest paying data analyst roles available remotely
- focus on job_postings with specific salary (remove null)
- Why? Highlight top-paying oppurtunities for data analyst
*/

SELECT
    job_id, job_title, job_location, job_schedule_type,
    salary_year_avg, job_posted_date,
    c.name as company_name
FROM
    job_postings_fact as j
LEFT JOIN
    company_dim as c ON j.company_id=c.company_id
WHERE
    job_title_short= 'Data Analyst' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10;
