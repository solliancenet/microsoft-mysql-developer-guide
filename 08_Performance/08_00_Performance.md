# 08 / Performance + Optimization

After organizations migrate their MySQL workloads to Azure, they unlock turnkey performance monitoring solutions, scalability, and the benefits of Azure's global footprint. Teams must establish performance baselines before fine-tuning their MySQL instances to ensure that changes--especially those that require application downtime--are worth doing.

Before jumping into specific more time consuming performance enhancements, there are some general tips that can improve performance in your environment.  

## General performance tips

- Ensure the input/output operations per second (IOPS) are sufficient for the application needs. Keep the IO latency low.
- Create and tune the table indexes. Avoid full table scans.
- Performance regular database maintenance.
- Make sure the application/clients (e.g. App Service) are physically located as close as possible to the database. Reduce network latency.
- Use accelerated networking for the application server if you are using Azure virtual machine, Azure Kubernetes, or App Services.
- Use connection pooling when possible. Avoid creating new connections for each application request. Use ProxySQL which provides built-in connection pooling and load balance your workload to multiple read replicas as required on demand with any changes in application code.
- Set timeouts when creating transactions.
- Set up a [read replica](https://dev.mysql.com/doc/refman/5.7/en/replication-features.html) for read only queries and analytics.
- Consider using a query caching solutions like Heimdall Data Proxy. Limit connections based on per user and per database. Protect the database from being overwhelmed by a single application or feature.
- Temporarily scale your Azure Database for MySQL resources for taxing tasks. Once your task is complete, scale it down.

See [Best practices for optimal performance of your Azure Database for MySQL](https://docs.microsoft.com/en-us/azure/mysql/concept-performance-best-practices)

## Monitoring hardware and query performance

In addition to the audit and activity logs, server performance can also be monitored with [Azure Metrics](https://docs.microsoft.com/azure/azure-monitor/platform/data-platform-metrics). Azure metrics are provided in a one-minute frequency and alerts can be configured from them. For more information, reference [Monitoring in Azure Database for MySQL](https://docs.microsoft.com/azure/mysql/concepts-monitoring) for specifics on what kind of metrics can be monitored.

As previously mentioned, monitoring metrics such as the `cpu_percent` or `memory_percent` can be important when deciding to upgrade the database tier. Consistently high values for extended periods of time could indicate a tier upgrade is necessary.

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

The Azure portal and the CLI can be used to scale between the `Burstable`, `General Purpose`, and `Memory Optimized` tiers. Tier scaling requires restarting the Flexible Server instance, causing 60-120 seconds of downtime.

## Scaling the server

Within the tier, it is possible to scale cores and memory to the minimum and maximum [limits](https://docs.microsoft.com/en-us/azure/mysql/concepts-pricing-tiers) allowed in that tier. If monitoring shows a continual maxing out of CPU or memory, scale up to meet demand. You can use an [Azure CLI script](https://docs.microsoft.com/azure/mysql/flexible-server/scripts/sample-cli-monitor-and-scale) to monitor relevant metrics and scale the server.

## Azure Database for MySQL Memory Recommendations
An Azure Database for MySQL performance best practice is to allocate enough RAM so that your working set resides almost completely in memory.

Check if the memory percentage being used in reaching the limits using the metrics for the MySQL server.
Set up alerts on such numbers to ensure that as the servers reaches limits you can take prompt actions to fix it. Based on the limits defined, check if scaling up the database SKU—either to higher compute size or to better pricing tier, which results in a dramatic increase in performance.
Scale up until your performance numbers no longer drops dramatically after a scaling operation. For information on monitoring a DB instance's metrics, see [MySQL DB Metrics](https://docs.microsoft.com/en-us/azure/mysql/concepts-monitoring#metrics).


## Moving regions

It is possible to move a geo-redundant Flexible Server instance to a [paired Azure region](https://docs.microsoft.com/azure/availability-zones/cross-region-replication-azure) through geo-restore. Geo-restore creates a new Flexible Server instance in the paired Azure region based on the current state of the database: point-in-time restore is not supported.

Geo-restore can be used to recover from a service outage in the primary region. However, the Flexible Server instance created in the paired region can only be configured with locally redundant storage, as its paired region (the old primary region) is down.

To minimize downtime, Flexible Server configuration settings, like VNet or firewall ACLs, can be kept intact.

## Server parameters

As part of the migration, the on-premises [server parameters](https://docs.microsoft.com/azure/mysql/flexible-server/concepts-server-parameters) were likely modified to support a fast egress. Also, modifications were made to the Azure Database for MySQL Flexible Server parameters to support a fast ingress. The Azure server parameters should be set back to their original on-premises workload-optimized values after the migration.

However, be sure to review and make server parameters changes that are appropriate for the workload and the environment. Some values that were great for an on-premises environment, may not be optimal for a cloud-based environment. Additionally, when planning to migrate the current on-premises parameters to Azure, verify that they can be set.  

Some parameters are not allowed to be modified in Azure Database for MySQL Flexible Server.

## Upgrade Azure Database for MySQL versions

Sometimes, just upgrading versions may be the answer. Flexible Server supports MySQL versions 5.7 and 8.0. Migrating from on-premises MySQL 5.x to MySQL Flexible Server 5.7 or 8.0 delivers major performance improvements. Consult the [Microsoft documentation](https://docs.microsoft.com/azure/mysql/migrate/mysql-on-premises-azure-db/08-data-migration) for more information regarding MySQL Azure migrations, including major version changes.

## Customizing the runtime

Choosing a platform to run your MySQL and PHP containerized applications plays an important part in how much performance will be achieved.  In most cases, creating a custom PHP container can improve performance up to 6x over the out-of-the-box official PHP containers.  As a developer, it is important to determine if the effort of building a custom image will be worth the performance gain from the work.  Also keep in mind that later versions of PHP tend to perform better than older versions.

Custom environments can be tested against standard workloads by running various benchmarks using the [PHPBench tool](https://github.com/phpbench/phpbench).

## Running MySQL Benchmarks

There are several tools that can be used to benchmark MySQL environments. Here are a few that can be used to determine how well an instance is performing:

- [DBT2 Benchmark](https://downloads.mysql.com/source/dbt2-0.37.50.16.tar.gz) - DBT2 is an open source benchmark that mimics an OLTP application for a company owning large amounts of warehouses. It contains transactions to handle New Orders, Order Entry, Order Status, Payment and Stock handling
- [SysBench Benchmark Tool](https://downloads.mysql.com/source/sysbench-0.4.12.16.tar.gz) - Sysbench is a popular open source benchmark to test open source DBMSs.

More Common sets of tests typically utilize TPC benchmarks such as [TPC-H](https://www.tpc.org/tpch/) but there are many more [types of tests](https://www.tpc.org/information/benchmarks5.asp) that can be run against the MySQL environment to test against specific workloads and patterns.

## Instrumenting vital server resources

The [MySQL Performance Schema](https://docs.microsoft.com/en-us/azure/mysql/howto-troubleshoot-sys-schema) provides a way to inspect internal server execution events at runtime.

TODO: Tim finish.

>[Warning](../Global_Media/warning.png "Warning"): The Performance Schema avoids using mutexes to collect or produce data, so there are no guarantees of consistency and results can sometimes be incorrect. Event values in performance_schema tables are nondeterministic and nonrepeatable.
