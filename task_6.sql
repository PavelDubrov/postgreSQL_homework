-- task_6
select percentile_disc(0.5) within group (order by tmp.num_of_vac) as median
from 
(select company_id, count(vacancy_id) num_of_vac
from vacancy
group by company_id) as tmp;
