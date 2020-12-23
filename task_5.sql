-- task_5
SELECT company_name, max_person
FROM
(
	SELECT company_id, MAX(person_on_vac) AS max_person
	FROM
	(
		SELECT company_id, vacancy_name, COUNT(person_id) person_on_vac
		FROM job_application
		INNER JOIN vacancy ON vacancy.vacancy_id = job_application.vacancy_id
		GROUP BY company_id, vacancy_name
		ORDER BY company_id
	) AS tmp

	GROUP BY company_id
	ORDER BY max_person DESC
) AS tmp2

RIGHT JOIN company ON company.company_id = tmp2.company_id
ORDER BY max_person DESC NULLS LAST, company_name ASC
LIMIT 5;
