-- 🧠 QUERY: Feature-Ready Dataset for Predicting ARR
-- This query pulls cleaned, numeric-friendly fields from customer_crm
-- and joins them to engagement data for model training

SELECT
    "crm"."account_id",
    "crm"."contract_value_ARR",
    "crm"."avg_weekly_usage_rate",
    "crm"."feature_adoption_index",
    "crm"."support_tickets_last_qtr",
    "crm"."onboarding_completion_days",
    "crm"."csat_score_last_6mo",
    "ee"."engagement_score_avg",
    "ee"."nps_style_score",
    "crm"."region",
    "crm"."segment"

FROM "customer_crm" AS "crm"
LEFT JOIN "employee_engagement" AS "ee"
    ON "crm"."cs_manager_id" = "ee"."manager_id"

WHERE "crm"."contract_value_ARR" IS NOT NULL
  AND "crm"."csat_score_last_6mo" IS NOT NULL;