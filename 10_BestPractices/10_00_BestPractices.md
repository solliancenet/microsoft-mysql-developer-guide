# 10 / Business Continuity and Disaster Recovery (BCDR)

## Backup and restore

As with any mission-critical system, having a backup and restore as well as a disaster recovery (BCDR) strategy is an important part of the overall system design. If an unforeseen event occurs, administratorsshould have the ability to restore data to a point in time called the Recovery Point Objective (RPO) and in a reasonable amount of time called the Recovery Time Objective (RTO).

### Backup

Azure Database for MySQL supports automatic backups for 7 days by default. It may be appropriate to modify this to the current maximum of 35 days. It is important to be aware that if the value is changed to 35 days, there will be charges for any extra backup storage over 1x of the storage allocated.

There are several current limitations to the database backup feature as described in the [Backup and restore in Azure Database for MySQL](https://docs.microsoft.com/azure/mysql/concepts-backup) docs article. It is important to understand them when deciding what additional strategies should be implemented.

Some items to be aware of include:

- No direct access to the backups
- Tiers that allow up to 4TB have a full backup once per week, differential twice a day, and logs every five minutes
- Tiers that allow up to 16TB have snapshot-based backups

> **Note:** [Some regions](https://docs.microsoft.com/azure/mysql/concepts-pricing-tiers#storage) do not yet support storage up to 16TB.

### Restore

Redundancy (local or geo) must be configured during server creation. However, a geo-restore can be performed and allows the modification of these options during the restore process. Performing a restore operation will temporarily stop connectivity and any applications will be down during the restore process.

During a database restore, any supporting items outside of the database will also need to be restored.  Review the migration process. See [Perform post-restore tasks](https://docs.microsoft.com/azure/mysql/concepts-backup#perform-post-restore-tasks) for more information.

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
