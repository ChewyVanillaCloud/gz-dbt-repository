with source as (
    select * from {{ source('raw', 'ship') }}
),

renamed as (
    select
        ship_id,
        order_id,
        shipping_fee,
        CAST(ship_cost AS FLOAT64) AS ship_cost
    from source
    where shipping_fee = shipping_fee_1  -- keep only rows where they match (optional)
)

select * from renamed
