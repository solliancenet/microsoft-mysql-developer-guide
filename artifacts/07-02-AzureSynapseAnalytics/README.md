# Azure Synapse Analytics with MySQL

## Create MySQL Linked Service

- Create a new Azure Synapse Analytics workspace
- Navigate to the **mysqldevSUFFIX** Azure Synapce Analytics Workspace
- Select the **Open Synapse Studio** link
- Select the **Manage** tab
- Under **External connections** select **Linked services**
- Select **+ New**
- For the type, select **Azure Database for MySQL**, select **Continue**
- For the name, type **ContosoStore**
- For the account selection, select **From Azure Subscription**
- Select the subscription
- Select the **mysqldevSUFFIX** Azure Database for MySQL server
- For the database name, type **ContosoStore**
- For the username, type **wsuser@mysqldevSUFFIX**
- For the password, type **Solliance123**
- Select **Test connection**, ensure that you get a success message.
- Select **Create**

## Create PowerBI Workspace

- Open the Power BI Portal, https://powerbi.microsoft.com
- Sign in with your lab credentials
- In the left navigation, expand **Workspaces**
- Select **Create a workspace**
- For the name, type **MySQL**
- Select **Save**

## Create PowerBI Linked Service

- Select the **Manage** tab
- Under **External connections** select **Linked services**
- Select **+ New**
- For the type, select **Power BI**, select **Continue**
- For the name, type **PowerBI**
- Select the lab tenant
- Select the **MySQL** workspace
- Select **Create**

## Create Integration Dataset

- Select the **Data** tab
- Select the **+** button
- Select **Integration Dataset**
- For the type, select **Azure Database for MySQL**, select **Continue**
- For the name, type **ContosoStore_Orders**
- For the linked service **Contoso**
- Select **OK**
- Select **Publish all**, then select **Publish**

## Create PowerBI Report

- Select the **Develop** tab
- Select the **+** button
- Select **Power BI report**
- TODO
