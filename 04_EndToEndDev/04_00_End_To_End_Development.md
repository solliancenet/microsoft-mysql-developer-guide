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

In a classic deployment, you will typically setup your web server (such as Internet Information Services (IIS), Apache or NGIX) on physical hardware.  As most applications using MySQL as the backend are commonly using PHP as the front end (which is the case for the sampel application in this guide), you must ensure that you configure the web server to support PHP.

Some web servers are respectively easier to setup than others.  The complexity depends on what the target operating system is and what features your application and database are using, for example SSL/TLS.

In addition to the web server, you will need to also install and configure the physical MySQL database server.  This includes creating the schema and the application users that will be used to access the target database(s).

As part of our sample application and supporting Azure Landing zone created by the ARM templates, most of this gets setup for you.  Once the software has been installed and configured, it is up to you to deploy your application and database on the system.  Classical deployments tend to be manual in nature such that you copy the files to the target production web server and then deploy the database schema and supported data via MySQL tools or the MySQL workbench.

To following the steps to perform a classical deployment, refrence the [Classic Deployment to PHP enabled IIS server](./../artifacts/01-ClassicDeploy/README.md) article.

## Azure VM Deployment

An Azure VM Deployment is very similar to a classical deployment but rather than deploying to phsical hardware, you are deploying to virtualized hardware in the Azure cloud.  The operating system and software will be the same as your classic deployment, but in order to open the system up, you'll need to modify the virtual networking to allow access to your web server.

The advantages of using Azure to host your virtual machines include the ability to utilize simple setup backup and restores, disk encryption and scaling up options that require no upfront costs and provide flexiblity in configuration options.

## Simple App Service Deployment with Azure Database for My SQL Single Server

TODO

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