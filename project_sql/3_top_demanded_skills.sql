/*
Question: What are the most in-demand skills for Data Analysts?
- Join jobpostings to inner join table similar to query 2.
- identify the top 5 in-demand skills for a Data Analyst.
- Focus on all job postings.
- Why? Retrieve the top 5 skills with the highest demand in the job market,
    providing insights into the most valued skills for job seekers.
*/

SELECT 
    COUNT(skills_job_dim.job_id) as skill_count,
    skills_dim.skills
FROM
    job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_work_from_home = TRUE
GROUP BY
    skills_dim.skills
ORDER BY
    skill_count DESC
LIMIT 5