/*
most in demand skills for data analyst?

*/

SELECT
    count(sj.job_id) as demand, s.skills
from job_postings_fact as j
INNER JOIN skills_job_dim as sj ON j.job_id=sj.job_id
INNER JOIN skills_dim as s ON sj.skill_id=s.skill_id
WHERE 
    job_title_short = 'Data Analyst'
GROUP BY
    s.skills
ORDER BY demand DESC