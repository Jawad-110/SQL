/*
skills req for these top paying data analyst jobs?

*/

WITH top_jobs AS(
    SELECT
        job_id, job_title, salary_year_avg, 
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
    LIMIT 10

)
SELECT 
    top_jobs.*,
    skills
FROM top_jobs
INNER JOIN skills_job_dim AS sj ON top_jobs.job_id = sj.job_id
INNER JOIN skills_dim AS s ON sj.skill_id = s.skill_id