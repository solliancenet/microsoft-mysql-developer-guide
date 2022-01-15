# Deploying a Laravel app backed by a Java REST API to AKS

## Provision the Database

Navigate to the `Database` directory within the `java-api` directory in the project root from a PowerShell terminal instance. Then, execute the `create-database.ps1` script, passing the parameters in the order shown below. The command will provision a new Flexible Server instance with the app database schema.

- Provide a unique `Suffix` to ensure that the Flexible Server instance's name is unique
- Provide a strong `Password` for the database admin user (`AppAdmin`)
- Provide the name of your lab `Resource Group`
- Provide the desired `Location` for your Azure resources

```powershell
.\create-database.ps1 'Suffix' 'Password' 'Resource Group' 'Location'
```

The Flexible Server instance will have 1 vCore, 2 GiB memory, 32 GiB storage, and it will allow all Azure resources to access it.

> Consult the [Microsoft documentation](https://docs.microsoft.com/azure/mysql/flexible-server/tutorial-deploy-springboot-on-aks-vnet) for information on how to configure private access for MySQL Flexible Server from Azure Kubernetes Service. This guide uses public access for simplicity.

## Create Docker Images

### API

Navigate to the `java-api` directory and enter the following command to create an optimized Docker image. Note that Maven does not need a Dockerfile to create this image, called `noshnowapi:0.0.1-SNAPSHOT`.

```
mvn spring-boot:build-image
```

### Laravel (TODO)

## Provision Azure Kubernetes Service (TODO)
