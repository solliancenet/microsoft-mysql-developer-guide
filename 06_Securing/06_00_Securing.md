# Security

Moving to a cloud-based service doesn't mean the entire internet will have access to it at all times. Azure provides best in class security that ensures data workloads are continually protected from bad actors and rouge programs. An additional  critical factor for many organizations is being compliant with local and industry based regulations.

Organizations must take proactive security measures to protect their workloads and Azure simplifies through the following best practices.

## Authentication

Azure Database for MySQL supports the [basic authentication mechanisms](https://docs.microsoft.com/azure/mysql/howto-create-users) for MySQL user connectivity, but also supports [integration with Azure Active Directory](https://docs.microsoft.com/en-us/azure/mysql/concepts-azure-ad-authentication). This security integration works by issuing tokens that act like passwords during the MySQL login process.  [Configuring Active Directory integration](https://docs.microsoft.com/en-us/azure/mysql/howto-configure-sign-in-azure-ad-authentication) is incredibly simple to do and supports not only users, but AAD groups as well.

This tight integration allows administrators and applications to take advantage of the enhanced security features of [Azure Identity Protection](https://docs.microsoft.com/en-us/azure/active-directory/identity-protection/overview-identity-protection) to further surface any identity issues.

> **Note:** This security feature is supported by MySQL 5.7 and later.  Most [application drivers](https://docs.microsoft.com/en-us/azure/mysql/howto-configure-sign-in-azure-ad-authentication) are supported as long as the `clear-text` option is provided.

## Threat Protection

In the event that user or application credentials are compromised, logs are not likely to reflect any failed login attempts.  Compromised credentials can allow bad actors to access and download the data. [Azure Threat Protection](https://docs.microsoft.com/en-us/azure/mysql/concepts-data-access-and-security-threat-protection) and [Microsoft Defender for open-source relational databases](https://docs.microsoft.com/azure/defender-for-cloud/defender-for-databases-introduction) can watch for anomalies in logins (such as unusual locations, rare users or brute force attacks) and other suspicious activities.  Administrators can be notified in the event something does not `look` right which can then assist with patching vulnerabilities. You can enable Microsoft Defender for open-source relational databases by following the [Enable Microsoft Defender for open-source relational databases and respond to alerts](https://docs.microsoft.com/azure/defender-for-cloud/defender-for-databases-usage) article.

## Audit Logging

MySQL has a robust built-in audit log feature. By default, this [audit log feature is disabled](https://docs.microsoft.com/en-us/azure/mysql/concepts-audit-logs) in Azure Database for MySQL.  Server level logging can be enabled by changing the `audit_log_enabled` server parameter. Once enabled, logs can be accessed through [Azure Monitor](https://docs.microsoft.com/en-us/azure/azure-monitor/overview) and [Log Analytics](https://docs.microsoft.com/en-us/azure/azure-monitor/platform/design-logs-deployment) by turning on [diagnostic logging](https://docs.microsoft.com/en-us/azure/mysql/howto-configure-audit-logs-portal#set-up-diagnostic-logs).

To query for user connection related events, run the following KQL query:

```kql
AzureDiagnostics
| where ResourceProvider =="MICROSOFT.DBFORMYSQL"
| where Category == 'MySqlAuditLogs' and event_class_s == "connection_log"
| project TimeGenerated, LogicalServerName_s, event_class_s, event_subclass_s, event_time_t, user_s , ip_s , sql_text_s
| order by TimeGenerated asc
```

Note that excessive audit logging can degrade server performance, so be mindful of the events and users configured for logging.

- [Single Server](https://docs.microsoft.com/azure/mysql/concepts-audit-logs)
- [Flexible Server](https://docs.microsoft.com/azure/mysql/flexible-server/concepts-audit-logs)

## Encryption

Both Azure Database for MySQL offerings, Single Server and Flexible Server, offers various encryption features including encryption for data, backups, and temporary files created during query execution.

Data in the MySQL instances are encrypted at rest by default. Any automated backups are also encrypted to prevent potential leakage of data to unauthorized parties. This encryption is typically performed with a key that is created when the instance is created. In addition to this default service encryption key, administrators have the option to [bring your own key (BYOK)](https://docs.microsoft.com/en-us/azure/mysql/concepts-data-encryption-mysql). This feature is only supported in the General Purpose and Memory Optimized tiers.

When using a customer-managed key strategy, it is vital to understand responsibilities around key lifecycle management. Customer keys are stored in an [Azure Key Vault](https://docs.microsoft.com/en-us/azure/key-vault/general/basic-concepts) and then accessed via policies. It is vital to follow all recommendations for key management, the loss of the encryption key equates to the loss of data access.

In addition to a customer-managed keys, use service-level keys to [add double encryption](https://docs.microsoft.com/en-us/azure/mysql/concepts-infrastructure-double-encryption).  Implementing this feature will provide highly encrypted data at rest, but it does come with encryption performance penalties. Testing should be performed.

Data can be encrypted during transit using SSL/TLS and is enabled by default. As previously discussed, it may be necessary to [modify your applications](https://docs.microsoft.com/en-us/azure/mysql/howto-configure-ssl) to support this change and also configure the appropriate TLS validation settings. It is possible to allow insecure connections for legacy applications or enforce a minimum TLS version for connections but this should be used sparingly and highly network protected environments. Consult the guides below, as Flexible Server's TLS enforcement status can be set through the `require_secure_transport` MySQL server parameter.

- [Single Server](https://docs.microsoft.com/azure/mysql/concepts-ssl-connection-security)
- [Flexible Server](https://docs.microsoft.com/azure/mysql/flexible-server/how-to-connect-tls-ssl)

## Firewall

Once users are set up and the data is encrypted at rest, the migration team should review the network data flows.  Azure Database for MySQL provides several mechanisms to secure the networking layers by limiting access to only authorized users, applications and devices.  

The first line of defense for protecting the MySQL instance is to implement [firewall rules](https://docs.microsoft.com/en-us/azure/mysql/concepts-firewall-rules). IP addresses can be limited to only valid locations when accessing the instance via internal or external IPs. If the MySQL instance is destined to only serve internal applications, then [restrict public access](https://docs.microsoft.com/en-us/azure/mysql/howto-deny-public-network-access).

When moving an application to Azure along with the MySQL workload, it is likely there will be multiple virtual networks setup in a hub and spoke pattern that will require [Virtual Network Peering](https://docs.microsoft.com/en-us/azure/virtual-network/virtual-network-peering-overview) to be configured.

## Private Link

Both MySQL PaaS offerings support public connectivity, which permits certain hosts to access the instance over the public internet.  However most organization will want to utilize private connectivity which limits access to an Azure virtual network deployment. The difference between public and private access is addressed in the [network security document.](./06_01_Networking.md)

To limit access to the Azure Database for MySQL to internal Azure resources, enable [Private Link](https://docs.microsoft.com/en-us/azure/mysql/concepts-data-access-security-private-link).  Private Link will ensure that the MySQL instance will be assigned a private IP rather than a public IP address.

> **Note:** There are many other [basic Azure Networking considerations](https://docs.microsoft.com/en-us/azure/mysql/concepts-data-access-and-security-vnet) that must be taken into account that are not the focus of this guide.

Review a set of potential [security baseline](https://docs.microsoft.com/en-us/azure/mysql/security-baseline) tasks that can be implemented across all Azure resources. Not all of the items described on the reference link will apply to the specific data workloads or Azure resources.

## Security Checklist

- Use Azure AD authentication where possible.
- Enable Advanced Thread Protection and Microsoft Defender.
- Enable all auditing features.
- Consider a Bring-Your-Own-Key (BYOK) strategy.
- Implement firewall rules.
- Utilize private endpoints for workloads that do not travel over the Internet.
