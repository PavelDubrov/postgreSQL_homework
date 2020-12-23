-- task_4
SELECT round(AVG(comp_from)) AS min_comp,
	round((AVG(comp_to) + AVG(comp_from))/2) AS mid_comp,
	round(AVG(comp_to)) AS max_comp
FROM
(
	SELECT
	CASE WHEN compensation_gross = 'false' THEN round(compensation_from / 0.87) ELSE compensation_from END as comp_from,
	CASE WHEN compensation_gross = 'false' THEN round(compensation_to / 0.87) ELSE compensation_to END as comp_to
	FROM vacancy
) AS tmp;
