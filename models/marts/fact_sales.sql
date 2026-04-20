{{ config(
    materialized='table',
    schema='analytics'
) }}
SELECT
    oi.order_id,
    o.customer_id,
    oi.product_id,
    o.order_date,
    o.order_status,

    1 AS quantity,
    oi.price AS total_price

FROM {{ ref('stg_order_items') }} oi
LEFT JOIN {{ ref('stg_orders') }} o
    ON oi.order_id = o.order_id