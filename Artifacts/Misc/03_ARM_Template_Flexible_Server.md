# Flexible Server deployment sample ARM template

Utilize the ARM template provided in this directory (`mysql-flexible-server-template.json`) to quickly deploy a MySQL Flexible Server instance to Azure. You simply need to provide a `serverName`, `administratorLogin`, and `administratorLoginPassword` for the template to deploy. You can edit these values in the provided parameter file (`mysql-flexible-server-template.parameters.json`).

Once you have done so, use the Azure CLI to deploy the template.

```bash
az deployment group create --resource-group [RESOURCE GROUP] --template-file ./mysql-flexible-server-template.json --parameters @mysql-flexible-server-template.parameters.json
```
