{{
    config(
        materialized='table'
    )
}}

select
    country as country_name,
    dialingcode,
    country_dialingcode as formatted_code
from {{ ref('country_code') }}
where country is not null