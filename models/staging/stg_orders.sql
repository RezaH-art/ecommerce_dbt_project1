SELECT
    s.order_id,
    s.customer_id,
    s.product_id,
    s.order_date,

    CASE
        WHEN LOWER(o.order_status) IN ('created','approved','processing','invoiced')
            THEN 'pending'

        WHEN LOWER(o.order_status) IN ('shipped','delivered')
            THEN 'completed'

        WHEN LOWER(o.order_status) IN ('canceled','unavailable')
            THEN 'cancelled'

        ELSE 'pending'
    END AS order_status,

    s.quantity,
    s.total_price

FROM {{ source('analytics', 'fact_sales') }} s
LEFT JOIN {{ source('raw', 'raw_orders') }} o
    ON s.order_id = o.order_id
WHERE s.order_id IS NOT NULL