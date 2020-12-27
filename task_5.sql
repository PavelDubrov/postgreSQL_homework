-- task_5
WITH person_per_vac AS(
	SELECT company_id, vacancy_name, COUNT(person_id) person_on_vac
	FROM job_application
	INNER JOIN vacancy ON vacancy.vacancy_id = job_application.vacancy_id
	GROUP BY company_id, vacancy.vacancy_id
	ORDER BY company_id
), person_per_vac2 AS(
	SELECT company_id, MAX(person_on_vac) AS max_person
	FROM person_per_vac
	GROUP BY company_id
	ORDER BY max_person DESC
)
SELECT company_name, max_person
FROM person_per_vac2
RIGHT JOIN company ON company.company_id = person_per_vac2.company_id
ORDER BY max_person DESC NULLS LAST, company_name ASC
LIMIT 5;
