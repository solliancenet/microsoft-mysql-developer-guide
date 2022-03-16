# Azure Data Factory with MySQL

## Setup

## Create Linked Services

- Switch to the Azure Portal, browse to the **mysqldevSUFFIX** Azure Data Factory instance
- Select **Open Azure Data Factory Studio**
- Select the **Manage** tab
- Select the **+ New** button
- For the type, select **Azure Database for MySQL**
- For the name, type **ContosoStore**
- For the account selection, select **From Azure Subscription**
- Select the subscription
- Select the lab MySQL server
- For the database name, type **ContosoStore**
- For the username, type **wsuser**
- For the password, type **Solliance123**
- Select **Create**

## Create Dataset (MySQL)

- Select the **+** button, then select **Data Set**
- For the type, select **Azure Database for MySQL**
- Select **Continue**
- For the name, type **Customers**
- For the linked service, select **ContosoStore**
- Select **Continue**
- For the table, select **users**
- Select **OK**

## Create Dataset (Storage)

- Select the **+** button, then select **Data Set**
- For the type, select **Azure Data Lake Storage Gen2**
- For the data format, select **JSON**
- Select **Continue**
- For the container, select **users**
- Select **OK**

## Create a Pipeline

- Select the **+** button, then select **Pipeline**
- For the name, type **MySQL_to_Storage**
- Expand **Move & transform**
- Drag the **Copy data** activity to the design surface
- For the name, type **MySQL_to_Storage**
- Select **Source**, then select the **Customers** data set
- For the **Use query**, select **Query**
- For the query text, type **@"select * from users where createdate >= pipeline().parameters.LastCreateDate"**
- Select **Sink**, then select the **Storage** data set
- Select the main pipeline canvas, then select **Parameters**
- Select **+ New**
- For the name, tyep **LastCreateDate**
- For the type, select **String**
- For the default value, type **@trigger().scheduledTime**

## Add a trigger

- Select the **Add trigger** button
- Select **New/Edit**
- Select **New**
- For the name, type **UserScheduleTrigger**
- For the recurrance, select **1 day**
- Select **Ok**
- For the pipeline parameter value, type **@trigger().scheduledTime**
- Select **OK**

## Publish

- Select **Publish all**
- Select **Publish**

## Test the pipeline

- TODO