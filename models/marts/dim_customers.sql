SELECT
    customer_id
FROM {{ ref('stg_customers') }}