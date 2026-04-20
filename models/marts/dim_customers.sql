{{ config(
    materialized='table',
    schema='analytics'
) }}

SELECT
    customer_id
FROM {{ ref('stg_customers') }}