param([string]$suffix, [string]$password, [string]$resourceGroup, [string]$location)

$serverName = "mysqlflexapp$suffix"

az mysql flexible-server create `
    --admin-user AppAdmin `
    --admin-password $password `
    --database-name app `
    --location $location `
    --resource-group $resourceGroup `
    --name $serverName `
    --public-access all `
    --tier Burstable `
    --sku-name Standard_B1ms `
    --version 8.0.21

az mysql flexible-server execute `
    -n $serverName `
    -u AppAdmin `
    -p $password `
    -d app `
    -f './app-database.sql'
