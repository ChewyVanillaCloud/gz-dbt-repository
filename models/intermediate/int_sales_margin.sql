-- models/intermediate/int_sales_margin.sql

SELECT
    p.products_id,
    s.date_date,
    s.orders_id,
    s.revenue,
    s.quantity,
    p.purchase_price,
    ROUND(CAST(s.quantity AS FLOAT64) * CAST(p.purchase_price AS FLOAT64), 2) AS purchase_cost,
    ROUND(CAST(s.revenue AS FLOAT64) - (CAST(s.quantity AS FLOAT64) * CAST(p.purchase_price AS FLOAT64)), 2) AS margin
FROM {{ ref('stg_raw__sales') }} s
LEFT JOIN {{ ref('stg_raw__product') }} p
    ON s.pdt_id = p.products_id
