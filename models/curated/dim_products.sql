{{
    config(
        materialized='incremental',
        unique_key='product_id'
    )
}}

select
    product_id,
    product_pricing,
    product_margin,
    production_date,
    category_code,
    product_pricing * (1 + product_margin) as selling_price
from {{ ref('stg_products') }}
{% if is_incremental() %}
where production_date > (select max(production_date) from {{ this }})
{% endif %}