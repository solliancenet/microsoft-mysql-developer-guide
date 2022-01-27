# End to End development

Now that you have a development environment setup, it is time to explore the various options you have to deploy your application and its corresponding MySQL database.  

This will start with a typical classic deployment where you deploy your application to a web server and a database server on a physical or virtualized host operating system and then explore the evolution of the potential deployment options in a simple to complex progression ending with your application running as containers in Azure Kubernetes Service (AKS) with Azure Database for MySQL hosting your database.

## Development evolution

The following scenarios will be discussed and demonstrated as part of this Azure MySQL developer's guide.  All of the following deployments will utilize the same application and database backend and what is needed to modify the application to support the targets. Topics will be discussed in the following simple to complex ordering.

TODO: Links to the headers

- Classic deployment
- Azure VM Deployment
- Simple App Service Deployment with Azure Database for My SQL Single Server
- App Service with InApp MySQL
- Continuous Integration / Continuous Delivery
- Containerizing your layers with Docker
- Azure Container Instances (ACI)
- App Service Containers
- Azure Kubernetes Service (AKS)
- AKS with MySQL Flexible Server

It is recommended that you follow each of the scenarios in the order shown so that you get a full picture of the steps involved in the development evolution and have the necessary pre-requisite items you need to move on to the more complex deployments.

## Classic deployment

TODO: Pros and Cons

In a classic deployment, you will typically set up your web server (such as Internet Information Services (IIS), Apache, or NGINX) on physical or virtualized on-premises hardware.  Most applications using MySQL as the backend are using PHP as the frontend (which is the case for the sample application in this guide); as such, you must ensure that you configure the web server to support PHP.  This includes configuring and enabling any PHP extensions and installing the required software to support those extensions.

Some web servers are relatively easier to set up than others.  The complexity depends on what the target operating system is and what features your application and database are using, for example SSL/TLS.

In addition to the web server, you will need to also install and configure the physical MySQL database server.  This includes creating the schema and the application users that will be used to access the target database(s).

As part of our sample application and supporting Azure Landing zone created by the ARM templates, most of this gets set up for you.  Once the software has been installed and configured, it is up to you to deploy your application and database on the system.  Classical deployments tend to be manual such that you copy the files to the target production web server and then deploy the database schema and supported data via MySQL tools or the MySQL Workbench.

To perform a simulated classical deployment in Azure, reference the [Classic Deployment to PHP-enabled IIS server](./../artifacts/01-ClassicDeploy/README.md) article.

## Azure VM deployment

An Azure VM Deployment is very similar to a classical deployment but rather than deploying to physical hardware, you are deploying to virtualized hardware in the Azure cloud.  The operating system and software will be the same as your classic deployment, but to open the system up, you'll need to modify the virtual networking to allow access to your web server.

The advantages of using Azure to host your virtual machines include the ability to enable backup and restore services, disk encryption, and scaling options that require no upfront costs and provide flexibility in configuration options with just a few clicks of the mouse.  This is in contrast to the relatively complex and extra work needed to enable these types of services on-premises.

To perform an Azure VM deployment, reference the [Cloud Deployment to Azure VM](./../artifacts/02-01-CloudDeploy-Vm/README.md) article.

## Simple App Service deployment with Azure Database for MySQL Single Server

If supporting the operating system and the various other software is not a preferred approach, the next evolutionary path is to remove the operating system and web server from the list of setup and configuration steps. This can be accomplished by utilizing the Platform as a Service (PaaS) offerings of Azure App Service and Azure Database for MySQL.

However, modernizing your application and migrating them to these services may introduce some relatively small application changes.

To implement this deployment, reference the [Cloud Deployment to Azure App Service](./../artifacts/02-02-CloudDeploy-AppSvc/README.md) article.

## App Service with InApp MySQL

If you have a small database that you would like to be integrated with your application hosting environment, you can utilize a feature of Azure App Service that will allow you to deploy your database to the same App Service and connect through `localhost`.

Integration is accomplished through a built-in **myphpadmin** interface in the Azure Portal.  From this admin portal, you can run any supported SQL commands to import or export your database.

The limits of the MySQL instance are primarily driven by the size of your corresponding [App Service Plan](https://azure.microsoft.com/en-us/pricing/details/app-service/windows/).  The biggest factor about limits is normally the disk space allocated to any App Services in the Plan.  App Service Plan storage sizes range from 1GB to 1TB; therefore, if you have a database that will grow past 1TB, you will need to host it in Flexible Server.  For a list of other limitations, reference [Announcing Azure App Service MySQL in-app](https://azure.microsoft.com/en-us/blog/mysql-in-app-preview-app-service/).

To implement this deployment, reference the [Cloud Deployment to Azure App Service with MySQL InApp](./../artifacts/02-03-CloudDeploy-InApp/README.md) article.

## Continous Integration (CI) and Continous Delivery (CD)

Doing manual deployments every time you make a change can be a very time-consuming endeavor.  Utilizing an automated deployment approach can save a lot of time and effort.  You can utilize both Azure DevOps and Github Actions to automatically deploy your code and database each time you perform a new commit to your codebase.

Whether you choose to use DevOps or Github, you will need to do some setup work to support your deployments.  This typically includes creating credentials that can connect to your target environment and deploy the release artifacts.

TODO: Need to replace all relative path links.

To perform deployments using Azure DevOps and GitHub Actions, reference the [Deployment via CI/CD](./../artifacts/02-04-CloudDeploy-CICD/README.md) article.

## Containerizing your layers with Docker

By building your application and database with a specific target environment in mind, you will need to assume that your operations team will have deployed and configured that same environment to support your application and data workload.  If they missed any items, your application will either not load or may error during runtime.

Containers solve the potential issue of misconfiguration of the target environment.  By containerizing your application and data, you are ensured that your application will run exactly as you intended it. Containers can also more easily be scaled using tools such as Kubernetes.

Containerizing your application and data layer can be relatively complex, but once you have the build environment setup and working, you can push container updates very quickly to multi-region load-balanced environments.

To perform deployments using Docker, reference the [Migrate to Docker Containers](./../artifacts/03-00-Docker/README.md) article.

## Azure Container Instances (ACI)

After you have migrated your application and data layers to containers, you must then select a hosting target for your containers.  A simple way to deploy a container is to use Azure Container Instances (ACI).

Azure Container Instances can deploy one container at a time or multiple containers to keep the application, API, and data contained in the same resource.

To implement this deployment, reference the [Migrate to Azure Container Instances (ACI)](./../artifacts/03-01-CloudDeploy-ACI/README.md) article.

## App Service Containers

TODO

To perform deployments using Azure App Service containers, reference the [Migrate to Azure App Service Containers](./../artifacts/03-02-CloudDeploy-AppService-Container/README.md) article.

## Azure Kubernetes Service (AKS)

ACI and App Service Container hosting are effective ways to run containers, but they do not provide many enterprise features: deployment across nodes that live in multiple regions, load balancing, automatic restarts, redeployment, and more.

Moving to Azure Kubernetes Service (AKS) will enable your application to inherit all the enterprise features provided by AKS.

To perform deployments using AKS, reference the [Migrate to Azure Kubernetes Services (AKS)](./../artifacts/04-AKS/README.md) article.

## AKS with MySQL Flexible Server

Running your database layer in a container is better than running it in a VM, but not as great as removing all the operating system and software management components.

To implement this deployment, reference the [Utilize AKS and Azure Database for MySQL Flexible Server](./../artifacts/05-CloudDeploy-MySQLFlex/README.md) article.
