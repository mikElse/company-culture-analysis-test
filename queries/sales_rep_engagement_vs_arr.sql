-- 🎯 PURPOSE: Aggregate total ARR per sales rep and pair with their engagement responses
-- Includes only sales reps from engagement data who appear in CRM data

SELECT
    ee.employee_id AS sales_rep_id,
    AVG(CAST(ee.q1_expectations AS FLOAT)) AS avg_q1_expectations,
    AVG(CAST(ee.q2_tools AS FLOAT)) AS avg_q2_tools,
    AVG(CAST(ee.q3_best_work AS FLOAT)) AS avg_q3_best_work,
    AVG(CAST(ee.q4_recognition AS FLOAT)) AS avg_q4_recognition,
    AVG(CAST(ee.q5_care_about_me AS FLOAT)) AS avg_q5_care_about_me,
    AVG(CAST(ee.q6_dev_support AS FLOAT)) AS avg_q6_dev_support,
    AVG(CAST(ee.q7_my_opinions_count AS FLOAT)) AS avg_q7_my_opinions_count,
    AVG(CAST(ee.q8_mission_importance AS FLOAT)) AS avg_q8_mission_importance,
    AVG(CAST(ee.q9_team_quality AS FLOAT)) AS avg_q9_team_quality,
    AVG(CAST(ee.q10_best_friend AS FLOAT)) AS avg_q10_best_friend,
    AVG(CAST(ee.q11_progress_feedback AS FLOAT)) AS avg_q11_progress_feedback,
    AVG(CAST(ee.q12_learning_growth AS FLOAT)) AS avg_q12_learning_growth,
    COALESCE(SUM(CAST(crm."contract_value_ARR" AS FLOAT)), 0) AS total_contract_arr

FROM employee_engagement ee
INNER JOIN customer_crm crm
    ON crm.sales_rep_employee_id = ee.employee_id

GROUP BY ee.employee_id;