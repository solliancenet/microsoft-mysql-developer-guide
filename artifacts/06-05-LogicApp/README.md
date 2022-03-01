# Logic Apps with MySQL

Logic Apps can be used to connect to Azure Database for MySQL Flexible Server instances and perform actions such as SELECT, INSERT, DELETE and UPDATE.  However, Logic Apps do not have any direct integrations that allow for triggers that fire from MySQL DDL or DML events.  In order for the MySQL actions to connect to the MySQL instance, you will have to install a Logic Apps Gateway.  This can be done with Azure instances, but the Azure Database for MySQL will need private endpoints enabled and the gateway will need to run in a virtual machine that can access that private endpoint.

## Create a Private Endpoint Flexible Server

- Open the Azure Portal
- Browse to your lab resource group and select **+Create**
- Search for **Azure Database for MySQL**
- Select **Create**
- Under **Flexible Server**, select **Create**

  ![This image demonstrates the first provisioning screen for Azure Database for MySQL Flexible Server.](./media/az-mysql-db-create.png "First provisioning screen for Flexible Server")

- Select your subscription and your resource group
- For the name, type **mysqldevflexSUFFIXpriv**
- Select the resource group region (it must be in the region that your VNet is in)
- For **Workload type**, select **Development** to save costs
- For **Availability zone**, select **No preference**
  - Co-locating the VM and the Flexible Server instance would improve network performance, but it is not strictly necessary
- For the **MySQL Version**, select **8.0.x**

  ![This image demonstrates the server parameters provided to the Flexible Server instance in the Azure portal.](./media/server-details-port.png "Server parameters")

- Do not enable high availability
- For the admin username, type **s2admin**
- For the password, type **S0lliance123**
- Select **Next: Networking >**
- Select **Private access (VNet Integration)**
- Select the lab subscription
- Select the **mysqldev[SUFFIX]-db** vnet
- Select the **default** subnet, which is delegated to hold just Flexible Server instances

  ![This image demonstrates the Azure VNet integration.](./media/vnet-integration.png "Flexible Server VNet integration")

- Do not alter the parameters for the **Private DNS integration**
- Select **Review + create**
- Select **Create**
- Navigate to the new Azure Database for MySQL Flexible Server instance
- Under **Settings** select **Server parameters**
- Search for the `require_secure_transport` setting
- Change the value to **OFF**
- Select **Save**

  ![This image demonstrates how to disable SSL transport for Flexible Server.](./media/disable-secure-transport.png "Disable SSL transport")

> **NOTE** The Log App Gateway can currently only do non-SSL connections to MySQL

> **NOTE** You can also use the Azure CLI [`az mysql flexible-server create`](https://docs.microsoft.com/cli/azure/mysql/flexible-server?view=azure-cli-latest#az-mysql-flexible-server-create) command to provision a Flexible Server instance in a virtual network.

TODO: Link private DNS zone to VM (hub) VNet

## Configure the new Flexible Server instance

- Open a command prompt window and enter the following command to initiate a connection to the Flexible Server instance. Provide `S0lliance123` as the password, when prompted.

  ```cmd
  "C:\Program Files\MySQL\MySQL Workbench 8.0 CE\mysql.exe" -h mysqldevflex[SUFFIX]priv.mysql.database.azure.com -u s2admin -p
  ```

- Create a new database, titled `noshnowapp`. Then, create a new table for orders. It is a simplified version of the table used by the Contoso NoshNow application.

  ```sql
  CREATE DATABASE noshnowapp;
  USE noshnowapp;

  CREATE TABLE orders (
    id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name varchar(20) NOT NULL,
    address varchar(80) NOT NULL
  );
  ```

## Install the MySQL .NET Connector

- Log in to the **mysqldevSUFFIX-paw-1** virtual machine using **wsuser** and **Solliance123**
- [Download](https://go.microsoft.com/fwlink/?LinkId=278885) the connector
- Run the **mysql-installer...** installer
- Click through all the default values of all dialogs
- Select **Next**
- Select **Finish**

## Install the Logic Apps Gateway

- [Download](https://www.microsoft.com/en-us/download/details.aspx?id=53127) the Logic Apps Gateway
- Install the Logic Apps Gateway by running the **gatewayinstall.exe**
- Select **I accept the terms...** checkbox
- Select **Install**
- Enter your Azure user email, then select **Sign in**
- When prompted, log in to your Azure account
- Select **Register a new gateway on this computer**
- Select **Next**
- For the name, type **gateway-mysql**
- For the recovery key, type **Solliance123**
- Ensure that the region is the same as where the virtual network for the database instance is located
- Select **Configure**

  ![This image demonstrates the configuration for the on-premises data gateway.](./media/on-premises-data-gateway-config.png "On-premises data gateway configuration")

## Configure the Logic Apps Gateway

- Select **Create a gateway in Azure**
- Select the subscription and the resource group
- For the name, type **logic-app-gateway**
- Select the region you used above
- Select the **gateway-mysql** gateway
- Select **Review + create**
- Select **Create**

  ![This image demonstrates how to configure the on-premises data gateway Azure connection.](./media/logic-apps-gateway-azure-config.png "Azure connection for data gateway")

## Configure the Logic App

We have already created a Logic App that uses a timer trigger to check for new Orders in the database and then send an email.

- Select **Blank template**
- For the trigger, select **Recurrence**. Keep the default values

  ![This image demonstrates the recurrence trigger parameters for the Logic Apps instance.](./media/recurrence-logic-apps-trigger.png "Recurrence trigger parameters")

- Select **+ New step**, search for **MySQL**
- Select **Get Rows**
- Update the step variables:
  - For the name, type **mysqlflex**
  - For the server, type **mysqldevflexSUFFIXpriv.mysql.database.azure.com**.  Note you may need to put the private IP address if DNS resolution does not kick in in a reasonable amount of time.
  - For the database, type **noshnowapp**
  - For username, type **s2admin**
  - For password, type **S0lliance123**
  - For the gateway, select **gateway-mysql**
- Select **Create**
- For the table name, enter **noshnowapp.orders**
- Add the **Filter Query** and the **Select Query** parameters
- Set the following:
  - Filter Query = `name eq 'John'`
  - Leave Select Query blank
- Search for the **Office 365 Outlook : Send an email** action
- Select **Sign in**
- Sign in with your lab credentials
- For the `To`, type your lab email
- For the subject, enter **New Order**
- Now, populate the body (TODO)
- For the logic app, select **Save**

## Test Trigger

- Browse back to the Contoso Store
- Create a new order
- Switch to your email (https://outlook.office.com), wait for an email to show up with the order details.
