{% macro generate_surrogate_key(field_list) %}
    {{ return(sha1(concat(field_list|join('||')))) }}
{% endmacro %}