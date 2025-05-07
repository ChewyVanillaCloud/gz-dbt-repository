/*
    Welcome to your first dbt model!
    This model generates a simple dataset with an intentional NULL value
    to demonstrate testing and filtering concepts in dbt.
    
    By default, this materializes as a table, but you can switch it to a view if needed.
*/

{{ config(materialized='table') }}

-- Create a CTE (Common Table Expression) to simulate source data
with source_data as (

    select 1 as id
    union all
    select null as id

),

-- Filter out rows where id is null, so that the 'not_null' test passes
cleaned_data as (

    select *
    from source_data
    where id is not null

)

-- Final SELECT outputs only rows with non-null IDs
select *
from cleaned_data
