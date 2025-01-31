{{
    config(
        materialized='table',
        unique_key='customer_id'
    )
}}

with customers as (
    select * from {{ ref('stg_customers') }}
),

country_codes as (
    select * from {{ ref('stg_country_codes') }}
)

select
    c.customer_id,
    c.customer_location,
    c.country_name,
    cc.dialingcode,
    cc.formatted_code,
    c.ingestion_timestamp
from customers c
left join country_codes cc
    on c.country_name = cc.country_name