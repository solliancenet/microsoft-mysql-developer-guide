# 08 / Performance + Optimization
TODO - Add Overview

## Monitoring hardware and query performance

In addition to the audit and activity logs, server performance can also be monitored with [Azure Metrics](https://docs.microsoft.com/azure/azure-monitor/platform/data-platform-metrics). Azure metrics are provided in a one-minute frequency and alerts can be configured from them. For more information, reference [Monitoring in Azure Database for MySQL](https://docs.microsoft.com/azure/mysql/concepts-monitoring) for specifics on what kind of metrics can be monitored.

As previously mentioned, monitoring metrics such as the `cpu_percent` or `memory_percent` can be important when deciding to upgrade the database tier. Consistently high values could indicate a tier upgrade is necessary.

Additionally, if CPU and memory do not seem to be the issue, administrators can explore database-based options such as indexing and query modifications for poor-performing queries.

To find poor-performing queries, run the following:

```kql
AzureDiagnostics
| where ResourceProvider == "MICROSOFT.DBFORMYSQL"
| where Category == 'MySqlSlowLogs'
| project TimeGenerated, LogicalServerName_s, event_class_s, start_time_t , query_time_d, sql_text_s
| top 5 by query_time_d desc
```

## Upgrading the tier

The Azure Portal can be used to scale between `General Purpose` and `Memory Optimized`. If a `Basic` tier is chosen, there will be no option to upgrade the tier to `General Purpose` or `Memory Optimized` later. However, it is possible to utilize other techniques to perform a migration/upgrade to a new Azure Database for MySQL instance.

For an example of a script that will migrate from Basic to another server tier, reference [Upgrade from Basic to General Purpose or Memory Optimized tiers in Azure Database for MySQL](https://techcommunity.microsoft.com/t5/azure-database-for-mysql/upgrade-from-basic-to-general-purpose-or-memory-optimized-tiers/ba-p/830404).

## Scaling the server

Within the tier, it is possible to scale cores and memory to the minimum and maximum limits allowed in that tier. If monitoring shows a continual maxing out of CPU or memory, follow the steps to [scale up to meet demand](https://techcommunity.microsoft.com/t5/azure-database-for-mysql/upgrade-from-basic-to-general-purpose-or-memory-optimized-tiers/ba-p/830404).

## Moving regions

Moving a database to a different Azure region depends on the approach and architecture.  Depending on the approach, it could cause system downtime.

The recommended process is the same as utilizing read replicas for maintenance failover. However, compared to the planned maintenance method mentioned above, the speed to failover is much faster when a failover layer is integrated into the application. The application should only be down for a few moments during the read replica failover process. More details are covered in the [Business Continuity and Disaster Recovery](03_BCDR.md) section.

## Optimization checklist

- Monitor for slow queries.
- Periodically review the Performance Insight dashboard.
- Utilize monitoring to drive tier upgrades and scale decisions.
- Consider moving regions if the users or application needs change.

## Server parameters

As part of the migration, the on-premises [server parameters](https://docs.microsoft.com/azure/mysql/concepts-server-parameters) were likely modified to support a fast egress. Also, modifications were made to the Azure Database for MySQL parameters to support a fast ingress. The Azure server parameters should be set back to their original on-premises workload-optimized values after the migration.

However, be sure to review and make server parameters changes that are appropriate for the workload and the environment. Some values that were great for an on-premises environment, may not be optimal for a cloud-based environment. Additionally, when planning to migrate the current on-premises parameters to Azure, verify that they can be set.  

Some parameters are not allowed to be modified in Azure Database for MySQL.

## Upgrade Azure Database for MySQL versions

Sometimes just upgrading versions maybe the answer.  Upgrading from Azure Database for MySQL 5.6 to 5.7 can offer significant performance improvements. Learn from the [Minecraft migration](https://developer.microsoft.com/games/blog/how-minecraft-realms-moved-its-databases-from-aws-to-azure/) team's experience.

## Customizing the runtime

Choosing a platform to run your MySQL and PHP containerized applications plays an important part with the performance you will get.  In most cases, creating your own custom PHP container can improve performance up to 6x over the out of box offical PHP containers.  As a developer, you will need to determine if the effort of building your own image will provide you with the performance you are looking for.  Also keep in mind that later version of PHP tend to perform better than older versions.

You can test these custom environments by running various benchmarks using the [PHPBench tool](https://github.com/phpbench/phpbench).

## Running MySQL Benchmarks

There are several tools that can be used to test your MySQL environment. Here are a few that you can use to determine who well your instance is running:

- [DBT2 Benchmark](https://downloads.mysql.com/source/dbt2-0.37.50.16.tar.gz) - DBT2 is an open source benchmark that mimics an OLTP application for a company owning large amounts of warehouses. It contains transactions to handle New Orders, Order Entry, Order Status, Payment and Stock handling
- [SysBench Benchmark Tool](https://downloads.mysql.com/source/sysbench-0.4.12.16.tar.gz) - Sysbench is a popular open source benchmark to test open source DBMSs.

More Common sets of tests typically utilize TPC benchmarks such as [TPC-H](https://www.tpc.org/tpch/) but as you can see there are many more [types of tests](https://www.tpc.org/information/benchmarks5.asp) that can be run against the MySQL environment as well.
