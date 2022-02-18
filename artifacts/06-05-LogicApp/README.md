# Logic Apps with MySQL

Logic Apps can be used to connect to Azure Database for MySQL instances and perform actions such as SELECT, INSERT, DELETE and UPDATE.  However Logics Apps do not have any direct integration that allow for triggers that fire from MySQL DDL or DML events.  In order for the MySQL actions to connect to the MySQL instance, you will have to install a Logic Apps Gateway.  This can be done with Azure instances, but the Azure Database for MySQL will need private endpoints enabled and the gateway will need to run in a virtual machine that can access that private endpoint.

## Create a Private Endpoint Flexible Server

- Open the Azure Portal
- Browse to your lab resource group and select **+Create**
- Search for **Azure Database for MySQL**
- Select **Create**
- Under **Flexible Server**, select **Create**
- Select your subscription and your resource group
- For the name, type **mysqldevflexSUFFIXpriv**
- Select the resource group region (import that it is in the region that your vnet is in)
- For the **MySQL Version**, select **8.0.x**
- For the admin username, type **s2admin**
- For the password, type **S0lliance123**
- Select **Next: Networking >**
- Select **Private access (VNet Integration)**
- Select the lab subscription
- Select the **mysqldevmbsjnv3m0-db** vnet
- Select the **Default** subnet
- Select **Review + create**
- Select **Create**
- Navigate to the new Azure Database for MySQL
- Under **Settings** select **Server parameters**
- Search for the `require_secure_transport` setting
- Change the value to **OFF**
- Select **Save**

> **NOTE** The Log App Gateway can currently only do non-ssl connections to MySQL

## Install the MySQL .Net Connector

- [Download](https://go.microsoft.com/fwlink/?LinkId=278885) the connector
- Run the **mysql-installer...** installer
- Click through all the default values of all dialogs
- Select **Next**
- Select **Finish**

## Install the Logic Apps Gateway

- Login to the **mysqldevSUFFIX-paw-1** virtual machine using **wsuser** and **Solliance123**
- [Download](https://www.microsoft.com/en-us/download/details.aspx?id=53127) the Logic Apps Gateway
- Install the Logic Apps Gateway by running the **gatewayinstall.exe**
- Select **I accept the terms...** checkbox
- Select **Install**
- Enter your azure user email, then select **Sign in**
- When prompted, login to your azure account.
- Select **Register a new gateway on this computer**
- Select **Next**
- For the name, type **gateway-mysql**
- For the recovery key, type **Solliance123**
- Ensure that the region is the same as where the virtual network for the database instance is located
- Select **Configure**

## Configure the Logic Apps Gateway

- Select **Create a gateway in Azure**
- Select the subscription and the resource group
- For the name, type **logic-app-gateway**
- Select the region you used above
- Select the **gateway-mysql** gateway
- Select **Review + create**
- Select **Create**

## Conifigure the Logic App

We have already created a Logic App that uses a timer trigger to check for new Orders in the database and then send an email.

- Create a new Logic App
- Select **Blank template**
- For the trigger, select **Schedule**
- Select **+ New step**, search for **MySQL**
- Select **Get Rows**
- Update the step variables:
  - Fore the name, type **mysqlflex**
  - For the server, type **mysqldevflexSUFFIX.private.mysql.database.azure.com**.  Note you may need to put the private IP address if DNS resolution does not kick in in a resonable amount of time.
  - For the database, type **ContosoStore**
  - For username, type **s2admin**
  - For password, type **Solliance123**
  - For the gateway, select **gateway-mysql**
- Select **Create**
- For the table name, select **Orders**
- Add the **Filter Query** and the **Select Query** parameters
- Set the following:
  - Filter Query = ``
  - Select Query = ``
- Search for the **Office 365 Outlook : Send an email** action
- Select **Sign in**
- Sign in with your lab credentials
- For the `To`, type your lab email
- For the subject, enter **New Customer**
- For the body, type **TODO**
- For the logic app, select **Save**

## Test Trigger

- Browse back to the Contoso Store
- Create a new order
- Switch to your email (https://outlook.office.com), wait for an email to show up with the order details.