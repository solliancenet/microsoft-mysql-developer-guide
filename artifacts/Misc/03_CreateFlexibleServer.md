# Flexible Server deployment sample ARM template

## Create public network Flexible Server

Utilize the ARM template provided in this directory (`mysql-flexible-server-template.json`) to quickly deploy a MySQL Flexible Server instance to Azure. When deploying, simply provider the `serverName`, `administratorLogin`, and `administratorLoginPassword` for the template to deploy successfully. It is possible to edit these values in the provided parameter file (`mysql-flexible-server-template.parameters.json`).

Once completed, use the Azure CLI to deploy the template.

```bash
az deployment group create --resource-group [RESOURCE GROUP] --template-file ./mysql-flexible-server-template.json --parameters @mysql-flexible-server-template.parameters.json
```

## Create private network Flexible Server

TODO
