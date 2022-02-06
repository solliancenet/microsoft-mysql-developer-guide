# Monitoring

Once you have deployed your application and database, the next phase is to manage the new cloud-based data workload resources. Management operations include both control plane and data plane activities. Control plane activities are related to Azure resources, versus data plane, which is **inside** the Azure resource (in this case MySQL).

Azure Database for MySQL provides for the ability to monitor both of these types of operational activities using Azure-based tools such as [Azure Monitor](https://docs.microsoft.com/azure/azure-monitor/overview), [Log Analytics](https://docs.microsoft.com/azure/azure-monitor/platform/design-logs-deployment), and [Azure Sentinel](https://docs.microsoft.com/azure/sentinel/overview). In addition to the Azure-based tools, security information and event management (SIEM) systems can be configured to consume these logs as well.

Whichever tool is used to monitor the new cloud-based workloads, alerts will need to be created to warn Azure and database administrators of any suspicious activity. If a particular alert event has a well-defined remediation path, alerts can fire automated [Azure runbooks](https://docs.microsoft.com/azure/automation/automation-quickstart-create-runbook) to address the event.

## Azure Monitor

Administrators and developers employ Azure Monitor to consolidate metrics about the performance and reliability of their Flexible Server instances.

Once metric data is flowing, use the [Kusto Query Language (KQL)](https://docs.microsoft.com/azure/data-explorer/kusto/query/) query language to query the various log information. Administrators unfamiliar with KQL can find a SQL to KQL cheat sheet [here](https://docs.microsoft.com/azure/data-explorer/kusto/query/sqlcheatsheet) or the [Get started with log queries in Azure Monitor](https://docs.microsoft.com/azure/azure-monitor/log-query/get-started-queries) page.

For example, to get the memory usage of the Azure Database for MySQL:

```kql
AzureMetrics
| where TimeGenerated > ago(15m)
| limit 10
| where ResourceProvider == "MICROSOFT.DBFORMYSQL"
| where MetricName == "memory_percent"
| project TimeGenerated, Total, Maximum, Minimum, TimeGrain, UnitName
| top 1 by TimeGenerated
```

To get the CPU usage:

```kql
AzureMetrics
| where TimeGenerated > ago(15m)
| limit 10
| where ResourceProvider == "MICROSOFT.DBFORMYSQL"
| where MetricName == "cpu_percent"
| project TimeGenerated, Total, Maximum, Minimum, TimeGrain, UnitName
| top 1 by TimeGenerated
```

The table below, pulled from the [Microsoft documentation](https://docs.microsoft.com/azure/mysql/flexible-server/concepts-monitoring), indicates the metrics exposed by Flexible Server instances:

|Metric display name|Metric|Unit|Description|
|---|---|---|---|
|Host CPU percent|cpu_percent|Percent|The percentage of CPU utilization on the server, including CPU utilization from both customer workload and Azure MySQL processes|
|Host Network In |network_bytes_ingress|Bytes|Incoming network traffic on the server, including traffic from both customer database and Azure MySQL features like replication, monitoring, logs, etc.|
|Host Network out|network_bytes_egress|Bytes|Outgoing network traffic on the server, including traffic from both customer database and Azure MySQL features like replication, monitoring, logs, etc.|
|Replication Lag|replication_lag|Seconds|The time since the last replayed transaction. This metric is available for replica servers only.|
|Active Connections|active_connection|Count|The number of active connections to the server.|
|Backup Storage Used|backup_storage_used|Bytes|The amount of backup storage used.|
|IO percent|io_consumption_percent|Percent|The percentage of IO in use.|
|Host Memory Percent|memory_percent|Percent|The percentage of memory in use on the server, including memory utilization from both customer workload and Azure MySQL processes|
|Storage Limit|storage_limit|Bytes|The maximum storage for this server.|
|Storage Percent|storage_percent|Percent|The percentage of storage used out of the server's maximum.|
|Storage Used|storage_used|Bytes|The amount of storage in use. The storage used by the service may include the database files, transaction logs, and server logs.|
|Total connections|total_connections|Count|The number of total connections to the server|
|Aborted Connections|aborted_connections|Count|The number of failed attempts to connect to MySQL, for example, failed connection due to bad credentials.|
|Queries|queries|Count|The number of queries per second|

> For a similar list for Single Server, consult [this document.](https://docs.microsoft.com/azure/mysql/concepts-monitoring)

## MySQL audit logs

MySQL has a robust built-in audit log feature. By default, this [audit log feature is disabled](https://docs.microsoft.com/azure/mysql/concepts-audit-logs) in Azure Database for MySQL.  Server level logging can be enabled by changing the `audit_log_enabled` server parameter. Once enabled, logs can be accessed through [Azure Monitor](https://docs.microsoft.com/azure/azure-monitor/overview) and [Log Analytics](https://docs.microsoft.com/azure/azure-monitor/platform/design-logs-deployment) by turning on [diagnostic logging](https://docs.microsoft.com/azure/mysql/howto-configure-audit-logs-portal#set-up-diagnostic-logs).

In addition to metrics, you can also enable MySQL logs to be ingested into Azure Monitor. While metrics are better suited for real-time decision-making, logs are also useful for deriving insights. One source of logs generated by Flexible Server is MySQL *audit logs*, which indicate connections, DDL and DML operations, and more. Many businesses utilize audit logs to meet compliance requirements, but they can impact performance.

Once enabled, you can query the logs with KQL. For example, to query for user connection related events, run the following KQL query:

```kql
AzureDiagnostics
| where ResourceProvider =="MICROSOFT.DBFORMYSQL"
| where Category == 'MySqlAuditLogs' and event_class_s == "connection_log"
| project TimeGenerated, LogicalServerName_s, event_class_s, event_subclass_s, event_time_t, user_s , ip_s , sql_text_s
| order by TimeGenerated asc
```

Note that excessive audit logging can degrade server performance, so be mindful of the events and users configured for logging.

- [Single Server Audit Logs](https://docs.microsoft.com/azure/mysql/concepts-audit-logs)
- [Flexible Server Audit Logs](https://docs.microsoft.com/azure/mysql/flexible-server/concepts-audit-logs)

### Enabling audit logs

Audit logging is controlled by the `audit_log_enabled` server parameter in Flexible Server. Azure provides granularity over the events logged (`audit_log_events`), the database users subject to logging (`audit_log_include_users`), and an explicit list of the database users exempt from logging (`audit_log_exclude_users`).

> For more details about the logging server parameters, including the type of events that can be logged, consult [the documentation.](https://docs.microsoft.com/azure/mysql/flexible-server/concepts-audit-logs)

Besides being sent to Azure Monitor, MySQL audit logs can be sent to Azure Storage accounts and Azure Event Hubs for integration with other systems.

Reference [Configure and access audit logs for Azure Database for MySQL in the Azure Portal](https://docs.microsoft.com/azure/mysql/howto-configure-audit-logs-portal) for more information.

### Notes about the Flexible Server portal example

If you try to run the KQL query in the Flexible Server Azure Portal example, but you encounter errors, try to generate some activity and/or expand the scope of the `audit_log_events` parameter. Here are some actions which generated activity for my KQL queries:

- Connecting to the Flexible Server instance from MySQL Workbench
- Creating and dropping a dummy table (DDL activity)

As you work through the sample, note that Log Analytics is not just limited to the events generated by the MySQL audit logging functionality: logs generated by the Azure platform, such as starting or stopping a Flexible Server instance, are also recorded.

You can query the activity log from the samples provided on the **Logs** page.

![This image demonstrates a sample query of the Activity Log from the Logs tab of the Azure Portal.](./media/activity-log-sample-query.png "Activity log sample query")

![This image demonstrates the query results from the opened sample.](./media/activity-log-query-results.png "Sample query output")

As you can see, KQL imposes a schema on logs to facilitate analysis. Consult [the documentation](https://docs.microsoft.com/azure/mysql/flexible-server/concepts-audit-logs) for more information.

### Helpful links - Monitoring

- Flexible Server: [Configure audit logs (Azure Portal)](https://docs.microsoft.com/azure/mysql/flexible-server/tutorial-configure-audit)

- Single Server: [Configure and access audit logs in the Azure Portal](https://docs.microsoft.com/azure/mysql/howto-configure-audit-logs-portal)

- [Configure and access audit logs in the Azure CLI](https://docs.microsoft.com/azure/mysql/howto-configure-audit-logs-cli)

- [Write your first query with Kusto Query Language (Microsoft Learn)](https://docs.microsoft.com/learn/modules/write-first-query-kusto-query-language/)

- [Azure Monitor Logs Overview](https://docs.microsoft.com/azure/azure-monitor/logs/data-platform-logs)

## Metrics resources

### Azure CLI

Azure CLI provides the `az monitor` series of commands to manipulate action groups (`az monitor action-group`), alert rules and metrics (`az monitor metrics`), and more.

- [Azure CLI reference commands for Azure Monitor](https://docs.microsoft.com/cli/azure/azure-cli-reference-for-monitor)
- [Monitor and scale an Azure Database for MySQL Flexible Server using Azure CLI](https://docs.microsoft.com/azure/mysql/flexible-server/scripts/sample-cli-monitor-and-scale)

### Azure Portal

While the Azure Portal does not provide automation capabilities like the CLI or the REST API, it does support configurable dashboards and provides a strong introduction to monitoring metrics in MySQL.

- [Set up alerts on metrics for Azure Database for MySQL - Flexible Server](https://docs.microsoft.com/azure/mysql/flexible-server/how-to-alert-on-metric)
- [Tutorial: Analyze metrics for an Azure resource](https://docs.microsoft.com/azure/azure-monitor/essentials/tutorial-metrics)

### Azure Monitor REST API

The REST API allows applications to access metric values for integration with other applications or data storage systems, like Azure SQL Database. It also allows applications to manipulate alert rules.

To interact with the REST API, applications first need to obtain an authentication token from Azure Active Directory.

- [REST API Walkthrough](https://docs.microsoft.com/azure/azure-monitor/essentials/rest-api-walkthrough)
- [Azure Monitor REST API Reference](https://docs.microsoft.com/rest/api/monitor/)

## Sample - Azure Portal

In this example, I configured an alert rule called **AbortedConnections** on the Flexible Server instance I provisioned previously. It fires an alert if there were 10 or more aborted connections in the last 30 minutes, polled at a frequency of five minutes. The alert files an action group called **ServerNotifications** that sends me an email.

![This image demonstrates the alert rule configuration and the configured action groups.](./media/aborted-connections-alert-rule.png "AbortedConnections alert rule and ServerNotifications action group")

After initiating multiple failed connections to the Flexible Server instance, I receive the following warning on my configured notification email address.

![This image demonstrates the Azure Monitor alert rule sent to my email after attempting multiple failed connections.](./media/alert-rule-sent-to-email.png "Azure Monitor alert rule")
