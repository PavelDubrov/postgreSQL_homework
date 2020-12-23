-- task_7
SELECT city_name,
MIN(first_response) AS min_response,
MAX(first_response) AS max_response
FROM 
(
	SELECT city_name,
	vacancy_name,
	MIN(job_application.created_at - vacancy.created_at) AS first_response
	FROM job_application
	INNER JOIN vacancy ON vacancy.vacancy_id = job_application.vacancy_id
	INNER JOIN city ON city.city_id = vacancy.city_id
	GROUP BY city_name, vacancy_name
) AS table_response
GROUP BY city_name;
