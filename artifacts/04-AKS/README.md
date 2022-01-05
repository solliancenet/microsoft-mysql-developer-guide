# Migrate to Azure Kubernetes Services (AKS)

Now that you have containerized versions of your applications, you can host them in several places in Azure. Here we explore Azure Kubernetes Service (AKS).

## Push images to Azure Container Registry

1. If you haven't already, be sure to push your images to your Azure Container Registry using the [Push Images to Acr](./../Misc/01_PushImagesToAcr.md) article.

## Run images in Azure Kubernetes Service (AKS)

1. Ensure kubectl is installed:

    ```powershell
    az aks install-cli

    az aks get-credentials --name "mysqldevSUFFIX" --resource-group $resourceGroupName
    ```

2. Run the following commands to deploy your containers:

    ```powershell
    $acrName = "mysqldevSUFFIX";
    $resourceGroupName = "";

    $acr = Get-AzContainerRegistry -Name $acrName -ResourceGroupName $resourceGroupName;
    $creds = $acr | Get-AzContainerRegistryCredential;
    
    kubectl create namespace mysqldev

    $ACR_REGISTRY_ID=$(az acr show --name $ACRNAME --query "id" --output tsv);
    $SERVICE_PRINCIPAL_NAME = "acr-service-principal";
    $PASSWORD=$(az ad sp create-for-rbac --name $SERVICE_PRINCIPAL_NAME --scopes $ACR_REGISTRY_ID --role acrpull --query "password" --output tsv)
    $USERNAME=$(az ad sp list --display-name $SERVICE_PRINCIPAL_NAME --query "[].appId" --output tsv)

    kubectl create secret docker-registry acr-secret `
    --namespace mysqldev `
    --docker-server="https://$($acr.loginserver)" `
    --docker-username=$username `
    --docker-password=$password
    ```

3. Create the following `store-db.yaml` deployment file, be sure to replace the `<REGISTRY_NAME>` token:

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
      env:
      - name: MYSQL_DATABASE
        value: "ContosoStore"
      - name: MYSQL_ROOT_PASSWORD
        value: "root"
  imagePullSecrets:
    - name: acr-secret
```

4. Run the deployment:

    ```powershell
    kubectl create -f store-db.yaml
    ```

5. Create the following `store-web.yaml` deployment file, be sure to replace the `<REGISTRY_NAME>` token:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: mysql-web
  namespace: mysqldev
spec:
  containers:
    - name: store-web
      image: <REGISTRY_NAME>.azurecr.io/store-web
      imagePullPolicy: IfNotPresent
      env:
      - name: DB_DATABASE
        value: "ContosoStore"
      - name: DB_USERNAME
        value: "root"
      - name: DB_PASSWORD
        value: "root"
      - name: DB_HOST
        value: "db"
  imagePullSecrets:
    - name: acr-secret
```

6. Run the deployment:

    ```powershell
    kubectl create -f store-web.yaml
    ```

## Add services

1. Create the following `store-db-service.yaml` yaml file:

```yaml
apiVersion: v1
kind: Service
metadata:
  name: store-db
spec:
  ports:
  - port: 3306
  selector:
    app: store-db
```

2. Create the following `store-web-service.yaml` yaml file:

```yaml
apiVersion: v1
kind: Service
metadata:
  name: store-web
spec:
  ports:
  - port: 80
  selector:
    app: store-web
```

## Test your images

1. Browse to the Azure Portal
2. Navigate to your AKS cluster and select it
3. In the 