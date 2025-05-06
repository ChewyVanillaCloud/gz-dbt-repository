with source as (
    select * from {{ source('raw', 'product') }}
),

renamed as (
    select
        product_id,
        product_name,
        CAST(purchse_price AS FLOAT64) AS purchase_price
    from source
)

select * from renamed
