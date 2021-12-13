# Push images to Azure Container Registry

1. If you haven't already, be sure to push your images to your Azure Container Registry.

    ```Powershell
    $acrName = "mysqldevSUFFIX";
    $resourceGroupName = "";
    $subscriptionName = "";

    Connect-AzAccount

    Select-AzSubscription $subscriptName;

    $acr = Get-AzContainerRegistry -Name $acrName -ResourceGroupName $resourceGroupName;

    $creds = $acr | Get-AzContainerRegistryCredential

    $acrPassword = $creds.password;
    $acrurl = $acr.loginserver;
    
    docker login -u $ACRNAME -p $ACRPASSWORD $ACRURL

    docker tag store-php "$ACRNAME.azurecr.io/store-php"

    docker tag store-db "$ACRNAME.azurecr.io/store-db"

    docker push "$ACRNAME.azurecr.io/store-php"

    docker push "$ACRNAME.azurecr.io/store-db"

    ```