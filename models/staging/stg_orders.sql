{{ config(
    materialized='table',
    schema='staging'
) }}

SELECT
    order_id,
    customer_id,
    DATE(order_purchase_timestamp) AS order_date,

    CASE
        WHEN LOWER(order_status) IN ('created','approved','processing','invoiced')
            THEN 'pending'
        WHEN LOWER(order_status) IN ('shipped','delivered')
            THEN 'completed'
        WHEN LOWER(order_status) IN ('canceled','unavailable')
            THEN 'cancelled'
        ELSE 'pending'
    END AS order_status

FROM {{ source('raw', 'raw_orders') }}