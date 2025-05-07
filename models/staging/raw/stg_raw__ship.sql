WITH source AS (
    SELECT * 
    FROM {{ source('raw', 'ship') }}
),

renamed AS (
    SELECT
        orders_id,
        shipping_fee,
        CAST(logCost AS FLOAT64) AS log_cost,         -- ✅ correct casing from BigQuery
        CAST(ship_cost AS FLOAT64) AS ship_cost
    FROM source
    WHERE shipping_fee = shipping_fee_1  -- keep only rows where they match (optional)
)

SELECT * 
FROM renamed
