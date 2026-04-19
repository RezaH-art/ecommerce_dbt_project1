WITH ranked AS (
    SELECT *,
        ROW_NUMBER() OVER (PARTITION BY order_id ORDER BY order_date DESC) AS rn
    FROM {{ ref('stg_orders') }}
)

SELECT
    order_id,
    customer_id,
    product_id,
    order_date,
    order_status,
    quantity,
    total_price
FROM ranked
WHERE rn = 1