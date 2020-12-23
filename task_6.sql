-- task_6
SELECT percentile_disc(0.5) WITHIN group (ORDER BY tmp.num_of_vac) AS median
FROM 
(SELECT company_id, COUNT(vacancy_id) num_of_vac
FROM vacancy
GROUP BY company_id) AS tmp;
