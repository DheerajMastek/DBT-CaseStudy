{{
    config(
        materialized='view'
    )
}}

with source as (
    select * from {{ source('raw', 'cust_mstr_kna1') }}
),

renamed as (
    select
        customernumber as customer_id,
        location as customer_location,
        country as country_name,
        current_timestamp() as ingestion_timestamp
    from source
    where customernumber is not null
)

select * from renamed