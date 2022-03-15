## Introduction to Azure Database for MySQL

As mentioned previously, developers can deploy MySQL on Azure through Virtual Machines (IaaS) or Azure Database for MySQL (PaaS). Though PaaS offerings do not support direct management of the OS and the database engine, they have built-in support for high availability, automating backups, and meeting compliance requirements. Moreover, Azure Database for MySQL supports MySQL Community Editions 5.6, 5.7, and 8.0, making it flexible for most migrations. Reference the [Migrating to Azure Database for MySQL](https://docs.microsoft.com/en-us/azure/mysql/migrate/mysql-on-premises-azure-db/01-mysql-migration-guide-intro) guide for in-depth information and examples on how to successfully migrate to Microsoft Azure.

For most use cases, Azure Database for MySQL is the preferred offering that allows developers to focus on application development and deployment, instead of OS and RDBMS management, patching, and security.

As the image below demonstrates, Azure Resource Manager handles resource configuration, meaning that standard Azure management tools, such as the CLI, PowerShell, and ARM templates, are still applicable. This is commonly referred to as the *control plane*.

For managing database objects and access controls at the server and database levels, standard MySQL management tools, such as [MySQL Workbench](https://www.mysql.com/products/workbench/), still apply. This is known as the *data plane*.

![This image demonstrates the control plane for Azure Database for MySQL.](./media/mysql-conceptual-diagram.png "Control plane for Azure Database for MySQL")

### Azure Database for MySQL deployment options

Azure Database for MySQL provides two options for deployment: Single Server and Flexible Server. Below is a summary of these offerings. For a more comprehensive comparison table, please consult the article [Choose the right MySQL Server option in Azure](https://docs.microsoft.com/azure/mysql/select-right-deployment-type).

#### Flexible Server

Flexible Server is also a PaaS service fully managed by the Azure platform, but it exposes more control to the user than Single Server.

Cost management is one of the major advantages of Flexible Server: it supports a *burstable* tier, which is based on the B-series Azure VM tier and is optimized for workloads that do not continually use the CPU. [Flexible Server instances can also be paused](https://docs.microsoft.com/azure/mysql/flexible-server/how-to-restart-stop-start-server-cli). The image below shows how Flexible Server works for a non-high availability arrangement.

> *Locally-redundant storage* replicates data within a single *availability zone*. *Availability zones* are present within a single Azure region (such as East US) and are geographically isolated. All Azure regions that support availability zones have at least three.

![This image demonstrates how MySQL Flexible Server works, with compute, storage, and backup storage.](./media/flexible-server.png "Operation of MySQL Flexible Server")

Here are a few other notable advantages of Flexible Server.

- [User-scheduled service maintenance:](https://docs.microsoft.com/azure/mysql/flexible-server/concepts-maintenance) Flexible Server allows database administrators to set a day of the week and a time for Azure to perform service maintenance and upgrades. Providing notifications five days before a planned maintenance event, Flexible Server caters to the needs of IT operations personnel.

- [Network security:](https://docs.microsoft.com/azure/mysql/flexible-server/concepts-networking) Applications access Flexible Server through the public Internet (though access is governed by firewall ACLs), or through private IP addresses in an Azure Virtual Network. Moreover, TLS support keeps traffic encrypted, irrespective of the chosen network access model.

- [Automatic backups:](https://docs.microsoft.com/azure/mysql/flexible-server/overview) Azure automates database backups, encrypts them, and stores them for a configurable period.

- [Read replicas:](https://docs.microsoft.com/azure/mysql/flexible-server/concepts-read-replicas) Read replicas help teams scale their applications by providing read-only copies of the data updated on the master node. Often, applications that run on elastic, autoscaling services, like Azure App Service, couple well with read replicas.

Some of these features are not exclusive to Flexible Server. However, as further sections of the guide demonstrate, Flexible Server exposes far more versatility and is the preferred PaaS MySQL choice in Azure for new and existing apps.  

##### Flexible Server video introduction

Watch [this video by Data Exposed](https://docs.microsoft.com/shows/data-exposed/top-3-reasons-to-consider-azure-database-for-mysql-flexible-server/) to learn more about Flexible Server's advantages.

> ![](media/tip.png) Tip: [Data Exposed](https://docs.microsoft.com/shows/data-exposed/) touches on a wide range of Azure data content. It is a good resource for developers.

##### Flexible Server pricing & TCO

The MySQL Flexible Server tiers offer a storage range between 20 GiB and 16 TiB and the same backup retention period range of 1-35 days. However, they differ in core count and memory per vCore. Choosing a compute tier affects the database IOPS and pricing.

- **Burstable**: This tier corresponds to a B-series Azure VM. Instances provisioned in this tier have 1-2 vCores. It is ideal for applications that do not utilize the CPU consistently.
- **General Purpose**: This tier corresponds to a Ddsv4-series Azure VM. Instances provisioned in this tier have 2-64 vCores and 4 GiB memory per vCore. It is ideal for most enterprise applications requiring a strong balance between memory and vCore count.
- **Memory Optimized**: This tier corresponds to an Edsv4-series Azure VM. Instances provisioned in this tier have 2-64 vCores and 8 GiB memory per vCore. It is ideal for high-performance or real-time workloads that depend on in-memory processing.

To estimate the TCO for Azure Database for MySQL, use the [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/). Note that the [Azure TCO Calculator](https://azure.microsoft.com/pricing/tco/calculator/) can be used to estimate the cost savings of deploying PaaS Azure MySQL over the same deployment in an on-premises data center. Simply indicate the configuration of on-premises hardware and the Azure landing zone, adjust calculation parameters, like the cost of electricity, and observe the potential savings.

##### Flexible Server Unsupported Features

Azure provides a [detailed list of the limitations of Flexible Server](https://docs.microsoft.com/azure/mysql/flexible-server/concepts-limitations). Here are a few notable ones.

- Support for only the InnoDB and MEMORY storage engines; MyISAM is unsupported
- The DBA role and the `SUPER` privilege are unsupported
- `SELECT ... INTO OUTFILE` statements to write query results to files are unsupported, as the filesystem is not directly exposed by the service

#### Single Server

Single Server is suitable when apps do not need extensive database customization. Single Server will manage patching, high availability, and backups on a predetermined schedule (though developers can set the backup retention times between a week and 35 days). To reduce compute costs, developers can [pause the Single Server offering](https://docs.microsoft.com/azure/mysql/how-to-stop-start-server). Single Server offers an [SLA of 99.99%](https://azure.microsoft.com/updates/azure-database-for-mysql-general-availability/). For a refresher on how the SLAs of individual Azure services affect the SLA of the total deployment, review the associated [Microsoft Learn Module.](https://docs.microsoft.com/learn/modules/choose-azure-services-sla-lifecycle/)

> **Note:** Single servers are best suited for existing applications already leveraging Single Server. For all new developments or migrations, Flexible Server is the recommended deployment option.
