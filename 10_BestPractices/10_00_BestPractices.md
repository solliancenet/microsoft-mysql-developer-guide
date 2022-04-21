# 10 / Business Continuity and Disaster Recovery (BCDR)

## Best practices for MySQL Flexible Server apps

Organizations developing cloud apps backed by Azure Database for MySQL Flexible Server should consider implementing the following best practices. Note that this list is not comprehensive.

Consult the [Azure Well-Architected Framework](https://docs.microsoft.com/azure/architecture/framework/) for more information regarding the core principles of efficient cloud workloads. You can assess your existing Azure workloads for Well-Architected Framework compliance with the [Azure Well-Architected Review utility.](https://docs.microsoft.com/assessments/?id=azure-architecture-review&mode=pre-assessment)

### 1. Colocate resources

Locating Azure services in the same region minimizes network traffic costs and network latency. Flexible Server not only supports colocation in the same region, but also colocation in the same Availability Zone for [regions that support Availability Zones.](https://docs.microsoft.com/azure/availability-zones/az-region) MySQL Flexible Server couples well with zonal services, like Virtual Machines.

TODO - HA for Availability Zones (move content)

### 2. Implement connection pooling

Developers can significantly improve application performance by reducing the number of times that connections are established and increasing the duration of those connections through connection pooling. Microsoft recommends the ProxySQL connection pooling solution, hosted on application servers or container orchestrators, like Azure Kubernetes Service (AKS).

- [ProxySQL on a VM](https://techcommunity.microsoft.com/t5/azure-database-for-mysql-blog/setting-up-proxysql-as-a-connection-pool-for-azure-database-for/ba-p/2589350)
- [ProxySQL on AKS](https://techcommunity.microsoft.com/t5/azure-database-for-mysql-blog/deploy-proxysql-as-a-service-on-kubernetes-using-azure-database/ba-p/1105959)

### 3. Size containers adequately

To ensure that containerized applications function optimally, verify that application containers are allocated sufficient resources. It may be necessary to adjust application parameters for container environments, like Java heap size parameters.

Developers can identify container resource issues through monitoring utilities, like [Container insights,](https://docs.microsoft.com/azure/azure-monitor/containers/container-insights-overview) which supports Azure Kubernetes Service, Azure Container Instances, on-premises Kubernetes clusters, and more.

### 4. Implement network isolation & SSL connectivity

MySQL Flexible Server natively supports connectivity through Azure Virtual Networks, meaning that the database endpoint does not face the public Internet, and database traffic remains within Azure. Consider the [Networking and connectivity options] document for more information regarding public and private access.

Microsoft also recommends securing data in motion through SSL for applications that support SSL connectivity. Legacy applications should only use lower SSL versions or disable SSL connectivity in secure network environments.

### 5. Retry on transient faults

Given that cloud environments are more likely to encounter transient faults, like network connectivity interruptions or service timeouts, applications must implement logic to deal with them, typically by retrying requests after a delay.

Applications must first determine if a fault is transient or more persistent. Typically, API responses indicate the nature of the issue, sometimes even specifying a retry interval. If the fault is transient, applications must retry requests without consuming excessive resources. Common retry strategies including sending requests at regular intervals, exponential intervals, or random intervals. If a given number of retry requests fail, applications consider the operation failed.

Azure SDKs typically provide native support for retrying service requests. Consult the documentation's [list of per-service retry recommendations.](https://docs.microsoft.com/azure/architecture/best-practices/retry-service-specific)

For some ORMs that are commonly used with MySQL databases, like PHP's **PDO MySQL**, it may be necessary to write custom retry code that retries database connections if particular MySQL error codes are thrown.

### 6. Size database compute resources adequately

Teams must be diligent with sizing their Flexible Server instances to be cost-effective while maintaining sufficient application performance. There are [three different tiers of Flexible Server instances](https://docs.microsoft.com/azure/mysql/flexible-server/concepts-compute-storage), each with different intended use cases and memory configurations.

- **Burstable**:
  - Up to **2 GiB** memory per vCore
  - Intended for workloads that do not use the CPU continuously
  - Cost-effective for smaller web applications and development workloads
- **General Purpose**:
  - **4 GiB** per vCore
  - Intended for applications that require more throughput
- **Memory Optimized**:
  - **8 GiB** per vCore
  - Intended for high-throughput transactional and analytical workloads, like real-time data processing

Flexible Server instances can be resized after creation. Azure stops database VM instances and needs up to 120 seconds to scale compute resources.

Use Azure Monitor Metrics to determine if you need to scale your Flexible Server instance. Monitor metrics like **Host CPU percent**, **Active Connections**, **IO percent**, and **Host Memory Percent** to make your scaling decisions. To test database performance under realistic application load, consider utilities like [sysbench.](https://techcommunity.microsoft.com/t5/azure-database-for-mysql-blog/benchmarking-azure-database-for-mysql-flexible-server-using/ba-p/3108799)

## Backup and restore

As with any mission-critical system, having a backup and restore as well as a disaster recovery (BCDR) strategy is an important part of the overall system design. If an unforeseen event occurs, administrators should have the ability to restore data to a point in time called the Recovery Point Objective (RPO) and in a reasonable amount of time called the Recovery Time Objective (RTO).

### Backup

Azure Database for MySQL takes automatic backups of data and transaction log files. These backups can be stored in locally-redundant storage (replicated multiple times in a datacenter); zone-redundant storage (multiple copies are stored in two separate availability zones in a region); and geo-redundant storage (multiple copies are stored in two separate Azure regions).

Azure Database for MySQL supports automatic backups for 7 days by default. It may be appropriate to modify this to the current maximum of 35 days. It is important to be aware that if the value is changed to 35 days, there will be charges for any extra backup storage over 1x of the storage allocated. Data file backups are taken once daily, while transaction log backups are taken every five minutes.

Find additional storage pricing details for Flexible Server [here.](https://azure.microsoft.com/pricing/details/mysql/flexible-server/)

There are several current limitations to the database backup feature as described in the [Backup and restore in Azure Database for MySQL](https://docs.microsoft.com/azure/mysql/concepts-backup) docs article. It is important to understand them when deciding what additional strategies should be implemented.

Some items to be aware of include:

- No direct access to the backups
- Tiers that allow up to 4TB have a full backup once per week, differential twice a day, and logs every five minutes
- Tiers that allow up to 16TB have snapshot-based backups

> **Note:** [Some regions](https://docs.microsoft.com/azure/mysql/concepts-pricing-tiers#storage) do not yet support storage up to 16TB.

### Restore

Redundancy (local or geo) must be configured during server creation. However, a geo-restore can be performed and allows the modification of these options during the restore process. Performing a restore operation will temporarily stop connectivity and any applications will be down during the restore process.

During a database restore, any supporting items outside of the database will also need to be restored.  Review the migration process. See [Perform post-restore tasks](https://docs.microsoft.com/azure/mysql/concepts-backup#perform-post-restore-tasks) for more information.

Lastly, note that performing a restore from a backup provisions a new Flexible Server instance. Most of the new server's configuration is inherited from the old server, though it depends on the type of restore performed.

Learn more about backup and restore in Flexible Server from the [Microsoft documentation.](https://docs.microsoft.com/azure/mysql/flexible-server/concepts-backup-restore)

## Read replicas

[Read replicas](https://docs.microsoft.com/azure/mysql/concepts-read-replicas) can be used to increase the MySQL read throughput, improve performance for regional users, and implement disaster recovery. When creating one or more read replicas, be aware that additional charges will apply for the same compute and storage as the primary server.

## Deleted servers

If an administrator or bad actor deletes the server in the Azure Portal or via automated methods, all backups and read replicas will also be deleted. [Resource locks](https://docs.microsoft.com/azure/azure-resource-manager/management/lock-resources) must be created on the Azure Database for MySQL resource group to add an extra layer of deletion prevention to the instances.

## Regional failure

Although rare, if a regional failure occurs, geo-redundant backups or a read replica can be used to get the data workloads running again. It is best to have both geo-replication and a read replica available for the best protection against unexpected regional failures.

> **Note:** Changing the database server region also means the endpoint will change and application configurations will need to be updated accordingly.

### Load Balancers

If the application is made up of many different instances around the world, it may not be feasible to update all of the clients. Utilize an [Azure Load Balancer](https://docs.microsoft.com/azure/load-balancer/load-balancer-overview) or [Application Gateway](https://docs.microsoft.com/azure/application-gateway/overview) to implement a seamless failover functionality. Although helpful and time-saving, these tools are not required for regional failover capability.

## Configuring Read Replicas

### Creating a read replica

- Open the Azure Portal.
- Browse to the Azure Database for MySQL instance.
- Under **Settings**, select **Replication**.
- Select **Add Replica**.
- Type a server name.
- Select the region.
- Select **OK**, wait for the instance to deploy.  Depending on the size of the main instance, it could take some time to replicate.

> **Note:** Each replica will incur additional charges equal to the main instance.

### Failover to read replica

Once a read replica is created and completed the replication process, it can be used for failed over. Replication will stop during a failover and make the read replica its own main instance.

Failover Steps:

- Open the Azure Portal.
- Browse to the Azure Database for MySQL instance.
- Under **Settings**, select **Replication**.
- Select one of the read replicas.
- Select **Stop Replication**. This will break the read replica.
- Modify all applications connection strings to point to the new main instance.
