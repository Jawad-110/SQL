/*
    most optimal skills to learn(high demand , high pay)
    concentrated on remote jobs
*/

SELECT
    s.skill_id, s.skills,
    Count(sj.job_id) as job_count,
    Round(Avg(salary_year_avg),2) as avg_salary
FROM
    job_postings_fact as j
INNER JOIN
    skills_job_dim as sj ON j.job_id = sj.job_id
INNER JOIN
    skills_dim as s ON sj.skill_id = s.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_work_from_home = TRUE AND
    salary_year_avg IS NOT NULL
GROUP BY
    s.skill_id
HAVING
    count(sj.job_id) > 10
ORDER BY
    avg_salary DESC, job_count DESC