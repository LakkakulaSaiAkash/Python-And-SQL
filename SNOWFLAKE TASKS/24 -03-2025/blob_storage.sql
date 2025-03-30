--- created a storage integration object for azure -------------------


create or replace storage integration azure_integration
type = EXTERNAL_STAGE
storage_provider = AZURE
enabled = TRUE
AZURE_TENANT_ID = '18c3b4f7-e526-4f98-939a-19118361cac0'
storage_allowed_locations = ('azure://snflkblob1.blob.core.windows.net/snowflake/nested_data.csv');

desc storage integration azure_integration;

create or replace stage azure_connect
url ='azure://snflkblob1.blob.core.windows.net/snowflake/nested_data.csv'
credentials = (azure_sas_token = 'sp=racwdli&st=2025-03-30T17:45:45Z&se=2025-04-04T01:45:45Z&spr=https&sv=2024-11-04&sr=c&sig=KTFj2Gge8HJz7fyLldGyfttQzC%2FLISnO5phuQBPYIDc%3D');


list @ASSESSMENTS.PUBLIC.AZURE_CONNECT;

create or replace table assessments.public.nested_data_parsing
(
id number,
name string,
orders variant
);

select * from assessments.public.nested_data_parsing;
/*
The FIELD_OPTIONALLY_ENCLOSED_BY parameter in Snowflake's COPY INTO command is used to handle special characters or nested data (like JSON) inside a CSV file.*/

COPY INTO assessments.public.nested_data_parsing
FROM @ASSESSMENTS.PUBLIC.AZURE_CONNECT
FILE_FORMAT = (TYPE = 'CSV' FIELD_OPTIONALLY_ENCLOSED_BY = '"' SKIP_HEADER = 1);

----------- successfully loaded ------------------------------

----- now parsing the CSV file -------------------------



--------------- as we can access the data but the orders column is in array so flatten may work---------------
select id,
       name,
       orders[0]:order_id :: integer as Order_id,
       orders[0]:amount :: float as Order_amount 
from assessments.public.nested_data_parsing;

------------ flattening -------------------------------------

select id,
       name,
       cleaned_order_data.value:order_id :: integer as order_id,
       cleaned_order_data.value:amount :: float as order_amount
from assessments.public.nested_data_parsing,
lateral flatten(parse_json(orders)) cleaned_order_data;
/*The LATERAL keyword ensures that the FLATTEN() function is applied to each row individually,*/


                                                                                                                                                                    




