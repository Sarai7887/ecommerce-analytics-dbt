WITH raw_customers AS (
    SELECT * 
    FROM `analytics-project-ecommerce.raw_data.raw_customers`
)

SELECT 
    customer_id,
    TRIM(name) AS customer_name,
    LOWER(TRIM(email)) AS email,
    country,
    created_at
FROM raw_customers