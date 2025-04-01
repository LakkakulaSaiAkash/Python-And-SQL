# import streamlit as st
# import pandas as pd
# import snowflake.connector


# # UI header
# st.write('''# SIMPLE UI FOR EMPLOYEE TABLE''')

# conn_params = {
#     'account' : "",
#     'user' : "",
#     'authenticator' : "externalbrowser",
#     'role' : "ACCOUNTADMIN",
#     'warehouse' : "COMPUTE_WH",
#     'database' : "ASSESSMENTS",
#     'schema' : "PUBLIC"
# }

# # established a connection with the snowflake
# conn = snowflake.connector.connect(**conn_params)

# # now we need to fetch the data from snowflake to the APP
# table_name = 'assessments.public.employee'
# data_query = f'select * from {table_name}'



# # ttl : time to live 
# # fetched_data = connection_with_snowflake.query(data_query,ttl=200)

# st.write("### Employee Data:")
# st.dataframe(fetched_data)

# ''''''

import streamlit as st
from snowflake.snowpark.context import get_active_session

# Initialize Streamlit App
st.title("Watch your employees here!")

try:
    # Get Snowflake session
    session = get_active_session()
    session.use_warehouse("COMPUTE_WH")

    # Fetch employee data
    sql = "SELECT * FROM ASSESSMENTS.PUBLIC.EMPLOYEE"
    results = session.sql(sql).collect()

    if results:
        # Convert to DataFrame format
        import pandas as pd
        df = pd.DataFrame(results)

        # Select a column for dropdown filtering (e.g., 'DEPARTMENT')
        column_name = "DEPARTMENT"  # Change to the column you want
        extra_add_column = ['Benched','Transport']
        if column_name in df.columns:
            unique_values = df[column_name].unique()
            selected_value = st.selectbox(f"Filter by {column_name}:", ["Select Any Option"] +extra_add_column+list(unique_values))

            if selected_value == extra_add_column[0]:
                st.warning(f'No employee is in {extra_add_column[0]}')

            elif selected_value==extra_add_column[1]:
                st.warning(f'No employee is in {extra_add_column[1]}')
                           
            # Filter table based on dropdown selection
            # elif selected_value != "SELECT ANY OPTION":
            else:
                df = df[df[column_name] == selected_value]
                st.dataframe(df)
                
            
                
        
                


        

    else:
        st.warning("No data found in the Employee table.")

except Exception as e:
    st.error(f"Error: {str(e)}")



# Execute the SQL using a different warehouse





