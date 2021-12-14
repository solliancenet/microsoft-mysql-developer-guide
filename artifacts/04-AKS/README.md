# Migrate to Azure Kubernetes Services (AKS)

Now that you have containerized versions of your applications, you can host them in several places in Azure. Here we explore Azure Kubernetes Service (AKS).

## Push images to Azure Container Registry

1. If you haven't already, be sure to push your images to your Azure Container Registry using the [Push Images to Acr](./../Misc/01_PushImagesToAcr.md) article.

## Run images in Azure Kubernetes Service (AKS)

1. Ensure kubectl is installed:

    ```powershell
    az aks install-cli
    ```

2. Run the following commands to deploy your containers:

    ```powershell
    $acrName = "mysqldevSUFFIX";
    $resourceGroupName = "";

    $acr = Get-AzContainerRegistry -Name $acrName -ResourceGroupName $resourceGroupName;
    $creds = $acr | Get-AzContainerRegistryCredential;
    
    kubectl create namespace mysqldev

    kubectl create secret docker-registry acr-secret \
    --namespace mysqldev \
    --docker-server=$acr.loginserver \
    --docker-username=$creds.username \
    --docker-password=$creds.password
    ```

3. Create the following `store-db.yaml` deployment file:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: mysql-db
  namespace: mysqldev
spec:
  containers:
    - name: mysql-db
      image: <REGISTRY_NAME>.azurecr.io/store-db
      imagePullPolicy: IfNotPresent
  imagePullSecrets:
    - name: acr-secret
```

4. Run the deployment:

    ```powershell
    kubectl create -f store-db.yaml
    ```

5. Create the following `store-php.yaml` deployment file:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: mysql-php
  namespace: mysqldev
spec:
  containers:
    - name: mysql-php
      image: <REGISTRY_NAME>.azurecr.io/store-php
      imagePullPolicy: IfNotPresent
  imagePullSecrets:
    - name: acr-secret
```

6. Run the deployment:

    ```powershell
    kubectl create -f store-php.yaml
    ```
