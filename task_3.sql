-- task_3
SELECT vacancy_name, city_name, company_name FROM vacancy
INNER JOIN city ON  city.city_id = vacancy.city_id
INNER JOIN company ON company.company_id = vacancy.company_id
WHERE compensation_from IS NULL AND compensation_to IS NULL
ORDER BY created_at DESC
LIMIT 10;
