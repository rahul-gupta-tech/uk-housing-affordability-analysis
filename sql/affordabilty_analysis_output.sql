CREATE VIEW affordability_analysis AS

WITH housing_medians AS (
    SELECT
        district,
        COUNT(*) AS transaction_count,
        PERCENTILE_CONT(0.5)
            WITHIN GROUP (ORDER BY price) AS median_price
    FROM price_paid pp 
    WHERE EXTRACT(YEAR FROM pp.date_of_transfer) = 2025
      AND pp.property_type IN ('D', 'S', 'T', 'F')
    GROUP BY district
)

SELECT
    h.district,
    h.transaction_count,
    h.median_price,
    s.median_salary,
    ROUND((h.median_price / s.median_salary)::numeric, 2) AS affordability_ratio
FROM housing_medians h
LEFT JOIN salary_data s
    ON h.district = s.local_authority;