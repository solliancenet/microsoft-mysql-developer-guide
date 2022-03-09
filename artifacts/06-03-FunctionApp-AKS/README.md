# Deploy Azure Function App to Azure Kubernetes Service (AKS)

Function apps can be containerized and deployed to AKS.  These steps will walk through this process so it can be applied later if this is something the architecture demands.

## Setup AKS (KEDA)

- Switch to the terminal of Visual Studio Code
- Run the following command to install KEDA on the AKS cluster:

```PowerShell
func kubernetes install
```

## Configure Function App as Container

- Run the following command to setup the docker file

```PowerShell
func init --docker-only
```

- Deploy the function app using the following, be sure to replace the function name and `SUFFIX` value:

```PowerShell
func kubernetes deploy --name <name-of-function-deployment> --registry "mysqldevSUFFIX"
```

- After following the above steps, the function app has been turned into a container and pushed to the target registry.  It should also now be deployed to the AKS cluster.
