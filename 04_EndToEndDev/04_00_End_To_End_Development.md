# End to End Development

Now that you have a development environment setup, its time to explore the various options you have to deploy your application and its corredsponding MySQL database.  

This will start with a typical classic deployment where you deploy your application to a web server and a database server on a physical or virtualized host operating system and then explore the evolution of the potential deployment options in a simple to complex progression ending with your application running as containers in Azure Kubernetes Service (AKS) with Azure Database for MySQL hosting your database.

## Development Evolution

The following scenerios will be discussed and demonstrated as part of this Azure MySQL developer's guide.  All of the following deployments will utilize the same application and database backend and what is needed to modify the application in order to support the targets.  Topics will be discussed in the following simple to complex ordering.

- Classic deployment
- Azure VM Deployment
- Simple App Service Deployment with Azure Database for My SQL Single Server
- App Service with InApp MySQL
- Continous Integration / Continous Delivery
- Containerizing your layers with Docker
- Azure Container Instances (ACI)
- App Service Containers
- Azure Kubernetes Service (AKS)
- AKS with MySQL Flexible Server

It is recommeded that you follow each of the scenarios in the order shown so that you get a full pictures of the steps involved in the development evolution and have the necessary pre-req items you need to move on to the more complex deployments.

## Classic Deployment

In a classic deployment, you will typically setup your web server (such as Internet Information Services (IIS), Apache or NGIX) on physical or virtualized on-premises hardware.  Most applications using MySQL as the backend are using PHP as the front end (which is the case for the sample application in this guide); as such, you must ensure that you configure the web server to support PHP.  This includes configuring and enabling any PHP extensions and installing the required software to supporte those extensions.

Some web servers are relatively easier to setup than others.  The complexity depends on what the target operating system is and what features your application and database are using, for example SSL/TLS.

In addition to the web server, you will need to also install and configure the physical MySQL database server.  This includes creating the schema and the application users that will be used to access the target database(s).

As part of our sample application and supporting Azure Landing zone created by the ARM templates, most of this gets setup for you.  Once the software has been installed and configured, it is up to you to deploy your application and database on the system.  Classical deployments tend to be manual in nature such that you copy the files to the target production web server and then deploy the database schema and supported data via MySQL tools or the MySQL workbench.

To following the steps to perform a simulated classical deployment in Azure, reference the [Classic Deployment to PHP enabled IIS server](./../artifacts/01-ClassicDeploy/README.md) article.

## Azure VM Deployment

An Azure VM Deployment is very similar to a classical deployment but rather than deploying to phsical hardware, you are deploying to virtualized hardware in the Azure cloud.  The operating system and software will be the same as your classic deployment, but in order to open the system up, you'll need to modify the virtual networking to allow access to your web server.

The advantages of using Azure to host your virtual machines include the ability to enable backup and restore services, disk encryption and scaling up options that require no upfront costs and provide flexiblity in configuration options with just a few clicks of the mouse.  This is in contrast to the relatively complex and extra work needed to enable these types of services on-premises.

To following the steps to perform an Azure VM deployment, reference the [Cloud Deployment to Azure VM](./../artifacts/02-01-CloudDeploy-Vm/README.md) article.

## Simple App Service Deployment with Azure Database for MySQL Single Server

If supporting the operating system and the various other software is not a preferred approach, the next evolutionary path is to remove the operating system and web server from the list of setup and configuration steps. This can be accomplished by utilizing the Platform as a Service (Paas) offerings of Azure App Service and Azure Database for MySQL.

However, modernizing your application and migrating them to these services may introduce some relatively small application changes in order to migrate them to these cloud services.

To following the steps to perform an App Service and MySQL Single Server deployment, reference the [Cloud Deployment to Azure App Service](./../artifacts/02-02-CloudDeploy-AppSvc/README.md) article.

## App Service with InApp MySQL

TODO

## Continous Integration (CI) and Continous Delivery (CD)

TODO

## Containerizing your layers with Docker

TODO

## Azure Container Instances (ACI)

TODO

## App Service Containers

TODO

## Azure Kubernetes Service (AKS)

TODO

## AKS with MySQL Flexible Server

TODO