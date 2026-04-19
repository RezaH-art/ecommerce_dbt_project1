SELECT
    customer_id
FROM {{ source('analytics', 'dim_customers') }}
WHERE customer_id IS NOT NULL