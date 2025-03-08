/*
    top skills based on salary for data analyst?
*/

SELECT
    skills,
    ROUND(AVG(salary_year_avg), 3) AS avg_salary
FROM
    job_postings_fact AS j
INNER JOIN
    skills_job_dim AS sj ON j.job_id = sj.job_id
INNER JOIN 
    skills_dim AS s ON sj.skill_id = s.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL
GROUP BY
    skills
ORDER BY
    avg_salary DESC