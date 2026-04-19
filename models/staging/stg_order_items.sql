SELECT
    order_id,
    product_id,
    price,
    freight_value
FROM {{ source('raw', 'raw_order_items') }}