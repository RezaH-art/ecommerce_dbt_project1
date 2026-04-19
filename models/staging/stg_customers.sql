SELECT
    customer_id
FROM {{ source('raw', 'raw_customers') }}
WHERE customer_id IS NOT NULL