# Migrate to Azure Kubernetes Services (AKS)

Now that you have containerized versions of your applications, you can host them in several places in Azure. Here we explore Azure Kubernetes Service (AKS).

## Push images to Azure Container Registry

1. If they haven't already, push the images to the Azure Container Registry using the [Push Images to Acr](./../Misc/01_PushImagesToAcr.md) article.

## Run images in Azure Kubernetes Service (AKS)

1. Ensure kubectl is installed:

    ```powershell
    cd 04-aks

    az aks install-cli

    az aks get-credentials --name "mysqldevSUFFIX" --resource-group $resourceGroupName
    ```

2. Run the following commands to deploy the containers:

    ```powershell
    $acrName = "mysqldevSUFFIX";
    $resourceName = "mysqldevSUFFIX";
    $resourceGroupName = "RESOURCEGROUPNAME";

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

    #ensure that MSI is enabled
    az aks update -g $resourceGroupName -n $resourceName --enable-managed-identity

    #get the principal id
    az aks show -g $resourceGroupName -n $resourceName --query "identity"
    ```

3. Create a managed disk, copy its `id` for later use:

  ```powershell
  az disk create --resource-group $resourceGroupName --name "disk-store-db" --size-gb 200 --query id --output tsv
  ```

4. Create the following `storage-db.yaml` deployment file:

  ```yaml
  apiVersion: v1
  kind: PersistentVolumeClaim
  metadata:
    name: mysql-data
    namespace: mysqldev
  spec:
    accessModes:
    - ReadWriteOnce
    resources:
      requests:
        storage: 200Gi
  ```

4. Create the following `store-db.yaml` deployment file, be sure to replace the `<REGISTRY_NAME>` and `ID` tokens:

  ```yaml
  apiVersion: v1
  kind: Pod
  metadata:
    name: store-db
    namespace: mysqldev
  spec:
    volumes:
    - name: mysql-data
      persistentVolumeClaim:
        claimName: mysql-data
    containers:
      - name: store-db
        image: <REGISTRY_NAME>.azurecr.io/store-db:latest
        volumeMounts:
        - mountPath: "/var/lib/mysql/"
          name: mysql-data
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
    name: store-web
    namespace: mysqldev
  spec:
    containers:
      - name: store-web
        image: <REGISTRY_NAME>.azurecr.io/store-web:latest
        imagePullPolicy: IfNotPresent
        env:
        - name: DB_DATABASE
          value: "ContosoStore"
        - name: DB_USERNAME
          value: "root"
        - name: DB_PASSWORD
          value: "root"
        - name: DB_HOST
          value: "store-db"
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

## Test the images

1. Browse to the Azure Portal
2. Navigate to the AKS cluster and select it
3. Under **Kubernetes resources**, select **Service and ingresses**
4. For the **store-web-lb** service, select the external IP link. A new web browser tab should open to the web front end. Ensure that an order can be created without a database error.

## Create a deployment

Kubernetes deployments allow for the creation of multiple instances of pods and containers in case nodes or pods crash unexpectiantly.  

1. Create the following `store-deployment.yaml` file:

  ```yaml
  TODO
  ```

2. Deploy the deployment:

  ```powershell
  TODO
  ```