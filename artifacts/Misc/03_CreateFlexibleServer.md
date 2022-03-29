# Flexible Server deployment sample ARM template

## Create public network Flexible Server

Utilize the ARM template provided in this directory (`mysql-flexible-server-template.json`) to quickly deploy a MySQL Flexible Server instance to Azure. When deploying, simply provider the `serverName`, `administratorLogin`, and `administratorLoginPassword` for the template to deploy successfully. It is possible to edit these values in the provided parameter file (`mysql-flexible-server-template.parameters.json`).

Once completed, use the Azure CLI to deploy the template.

```bash
az deployment group create --resource-group [RESOURCE GROUP] --template-file ./mysql-flexible-server-template.json --parameters @mysql-flexible-server-template.parameters.json
```

## Create private network Flexible Server

- Browse to the Azure Portal
- Select your lab resource group
- Select **Create**
- Search for **MySQL**, then select **Azure Database for MySql**
- Select **Create**
- In the drop down, select **Flexible Server**
- Select **Create**
- Select your lab subscription and resource group
- For the name, type **mysqldevSUFFIXflex**
- For the MySQL version, select **8.0.x**
- For the admin username, type **wsuser**
- For the password and confirm password, type **Solliance123**
- Select **Next: Networking>**
- Select **Private Network access**
- Select the lab subscription
- Select the **mysqldevSUFFIX-db** virtual network
- Select the **default** subnet
- For the private dns zone, select **private.mysql.database.azure.com**
- Select **Review + create**
- Select **Create**
