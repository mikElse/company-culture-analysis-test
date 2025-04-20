select
    crm.sales_rep_id as sales,
    crm.cs_manager_id as cs,
    ROUND(AVG(crm.csat_score_last_6mo)::numeric,2) AS avg_csat_score

from customer_crm as crm
group by crm.sales_rep_id, crm.cs_manager_id
order by avg_csat_score desc

limit 50