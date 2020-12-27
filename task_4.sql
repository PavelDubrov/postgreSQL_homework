-- task_4
SELECT ROUND(AVG(comp_from)) AS min_comp,
	ROUND((AVG(comp_to) + AVG(comp_from))/2) AS mid_comp,
	ROUND(AVG(comp_to)) AS max_comp
FROM
(
	SELECT
	CASE WHEN compensation_gross = 'false' THEN ROUND(compensation_from / 0.87) ELSE compensation_from END AS comp_from,
	CASE WHEN compensation_gross = 'false' THEN ROUND(compensation_to / 0.87) ELSE compensation_to END AS comp_to
	FROM vacancy
) AS tmp;
