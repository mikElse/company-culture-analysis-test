-- 📊 QUERY: Correlating Quarterly Engagement Scores with Customer Onboarding Completion
-- This query aggregates employee engagement data and customer CRM data by quarter
-- and joins them to explore potential correlations between internal team sentiment
-- and external customer outcomes (onboarding duration).

-- 🔹 CTE 1: Aggregate average engagement scores by quarter and manager
WITH engagement AS (
    SELECT
        DATE_TRUNC('quarter', "survey_date"::timestamp) AS quarter,         -- Normalize survey dates to quarterly periods
        "manager_id",                                             -- Manager ID associated with each team
        AVG("engagement_score_avg") AS avg_engagement_score      -- Average score across all survey responses
    FROM "employee_engagement"
    WHERE "engagement_score_avg" IS NOT NULL                     -- Exclude missing scores
    GROUP BY 1, 2
),

-- 🔹 CTE 2: Aggregate average onboarding duration by quarter
crm AS (
    SELECT
        DATE_TRUNC('quarter', "renewal_date"::timestamp) AS quarter,        -- Normalize renewal dates to quarterly periods
        AVG("onboarding_completion_days") AS avg_onboarding_days           -- Average onboarding time
    FROM "customer_crm"
    WHERE "onboarding_completion_days" IS NOT NULL                         -- Ensure onboarding data is present
      AND "renewal_date" IS NOT NULL                                       -- Ensure date exists for time bucketing
    GROUP BY 1
)

-- 🔗 Re-enable join to bring engagement data back into the analysis
SELECT
    crm.quarter,
    crm.avg_onboarding_days,
    engagement.avg_engagement_score
FROM crm
LEFT JOIN engagement
    ON crm.quarter = engagement.quarter
ORDER BY crm.quarter;