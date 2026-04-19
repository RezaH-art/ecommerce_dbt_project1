SELECT
    p.product_category_name,
    SUM(f.total_price) AS revenue
FROM {{ ref('fact_sales') }} f
JOIN {{ ref('dim_products') }} p
    ON f.product_id = p.product_id
WHERE f.order_date >= (
    SELECT DATEADD(DAY, -30, MAX(order_date))
    FROM {{ ref('fact_sales') }}
)
GROUP BY p.product_category_name
ORDER BY revenue DESC
LIMIT 5