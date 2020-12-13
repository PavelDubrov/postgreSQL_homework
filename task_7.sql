-- task_7
SELECT city_name,
	MIN(job_application.created_at - vacancy.created_at) as min_response,
	MAX(job_application.created_at - vacancy.created_at) as max_response
FROM job_application
INNER JOIN vacancy ON vacancy.vacancy_id = job_application.vacancy_id
INNER JOIN city ON city.city_id = vacancy.city_id
GROUP BY city_name;
