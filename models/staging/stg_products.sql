SELECT
    product_id,
    product_category_name,
FROM {{ source('analytics', 'dim_products') }}
WHERE product_id IS NOT NULL