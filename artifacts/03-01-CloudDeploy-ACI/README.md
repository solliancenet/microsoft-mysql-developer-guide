# Migrate to Azure Container Instances (ACI)

Now that you have containerized versions of your applications, you can host them in several places in Azure. Here we explore Azure Container Instances (ACI).

## Push images to Azure Container Registry

1. If you haven't already, be sure to push your images to your Azure Container Registry.

## Run images in ACI

1. Run the following commands to create two new container instances:

    ```PowerShell
    $resourceGroupName = "{RESOURCE_GROUP_NAME}";
    
    $containerName = "store-mysql";
    New-AzContainerGroup -ResourceGroupName $resourceGroupName -Name $containerName -Image {acrName}.azurecr.io/store-mysql -OsType Windows -DnsNameLabel mysql-dev-db

    $containerName = "store-php";
    New-AzContainerGroup -ResourceGroupName $resourceGroupName -Name $containerName -Image {acrName}.azurecr.io/store-php -OsType Windows -DnsNameLabel mysql-dev-php
    ```

## Test the images

1. TODO