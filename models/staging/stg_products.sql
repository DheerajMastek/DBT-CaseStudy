{{
    config(
        materialized='view'
    )
}}

with source as (
    select * from {{ source('raw', 'prod_mstr_pna1') }}
),

renamed as (
    select
        product_id,
        product_pricing,
        product_margin,
        to_date(prod_date, 'DD-MM-YYYY') as production_date,
        category_code
    from source
    where product_id is not null
)

select * from renamed