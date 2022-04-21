# 06 / Networking and Security

Moving to cloud-based services doesn't mean the entire internet will have access to it at all times. Azure provides best-in-class security that ensures data workloads are continually protected from bad actors and rogue programs. Additionally, Azure provides several certifications that ensure your resources are compliant with local and industry regulations, an important factor for many organizations today.

In today's geopolitical environment, organizations must take proactive security measures to protect their workloads.  Azure simplifies many of these complex tasks and requirements through the various security and compliance resources provided out of the box.  This section will focus on many of these tools

## Threat protection

In the event that a user or application credential is compromised, logs are not likely to reflect any failed login attempts.  Compromised credentials can allow bad actors to access and download the data. [Azure Threat Protection](https://docs.microsoft.com/azure/mysql/concepts-data-access-and-security-threat-protection) and [Microsoft Defender for open-source relational databases](https://docs.microsoft.com/azure/defender-for-cloud/defender-for-databases-introduction) can watch for anomalies in logins (such as unusual locations, rare users, or brute force attacks) and other suspicious activities.  Administrators can be notified in the event something does not `look` right which can then assist with patching vulnerabilities. Microsoft Defender for open-source relational databases can be enabled by following the [Enable Microsoft Defender for open-source relational databases and respond to alerts](https://docs.microsoft.com/azure/defender-for-cloud/defender-for-databases-usage) article.

## Encryption

TODO - Add some picture

Both Azure Database for MySQL offerings, Single Server and Flexible Server, offers various encryption features including encryption for data, backups, and temporary files created during query execution.

Data stored in the Azure Database for MySQL instances are encrypted at rest by default. Any automated backups are also encrypted to prevent potential leakage of data to unauthorized parties. This encryption is typically performed with a key generated when the Azure Database for MySQL instance is created. In addition to this default service encryption key, administrators have the option to [bring your own key (BYOK)](https://docs.microsoft.com/azure/mysql/concepts-data-encryption-mysql) for added secuerity. This feature is only supported in the General Purpose and Memory Optimized tiers.

When using a customer-managed key strategy, it is vital to understand responsibilities around key lifecycle management. Customer keys are stored in an [Azure Key Vault](https://docs.microsoft.com/azure/key-vault/general/basic-concepts) and then accessed via policies. It is vital to follow all recommendations for key management, as the loss of the encryption key equates to the loss of data access.

In addition to customer-managed keys, use service-level keys to [add double encryption](https://docs.microsoft.com/azure/mysql/concepts-infrastructure-double-encryption).  Implementing this feature will provide highly encrypted data at rest, but it does come with encryption performance penalties. Testing should be performed to ensure an acceptable level of performance is maintained.

In additon to be encrypted at rest, data can be encrypted during transit using SSL/TLS and is enabled by default. As previously discussed, it may be necessary to [modify the applications](https://docs.microsoft.com/azure/mysql/howto-configure-ssl) to support this change and also configure the appropriate TLS validation settings. It is possible to allow insecure connections for legacy applications or enforce a minimum TLS version for connections but this should be used sparingly and in highly network-protected environments. Consult the guides below, as Flexible Server's TLS enforcement status can be set through the `require_secure_transport` MySQL server parameter.

- [Single Server](https://docs.microsoft.com/azure/mysql/concepts-ssl-connection-security)
- [Flexible Server](https://docs.microsoft.com/azure/mysql/flexible-server/how-to-connect-tls-ssl)

## Firewall

Once users are set up and the data is encrypted at rest, the migration team should review the network data flows.  Azure Database for MySQL provides several mechanisms to secure the networking layers by limiting access to only authorized users, applications, and devices.  

The first line of defense for protecting the MySQL instance access is to implement [firewall rules](https://docs.microsoft.com/azure/mysql/concepts-firewall-rules). IP addresses can be limited to only valid locations when accessing the instance via internal or external IPs. If the MySQL instance is destined to only serve internal applications, then [restrict public access](https://docs.microsoft.com/azure/mysql/howto-deny-public-network-access).

When moving an application to Azure along with the MySQL workload, it is likely there will be multiple virtual networks set up in a hub and spoke pattern that will require [Virtual Network Peering](https://docs.microsoft.com/azure/virtual-network/virtual-network-peering-overview) to be configured.

- Flexible Server
  - [Manage firewall rules for Azure Database for MySQL - Flexible Server using the Azure portal](https://docs.microsoft.com/azure/mysql/flexible-server/how-to-manage-firewall-portal)
  - [Manage firewall rules for Azure Database for MySQL - Flexible Server using Azure CLI](https://docs.microsoft.com/azure/mysql/flexible-server/how-to-manage-firewall-cli)
  - [ARM Reference for Firewall Rules](https://docs.microsoft.com/azure/templates/microsoft.dbformysql/flexibleservers/firewallrules?tabs=json)
- Single Server
  - [Create and manage Azure Database for MySQL firewall rules by using the Azure portal](https://docs.microsoft.com/azure/mysql/howto-manage-firewall-using-portal)
  - [Create and manage Azure Database for MySQL firewall rules by using the Azure CLI](https://docs.microsoft.com/azure/mysql/howto-manage-firewall-using-cli)
  - [ARM Reference for Firewall Rules](https://docs.microsoft.com/azure/templates/microsoft.dbformysql/servers/firewallrules?tabs=json)

## Microsoft Sentinel

Many of the items discussed thus far operate in their own sphere of influence and are not designed to work directly with each other. Every secure feature provided by Microsoft Azure and corresponding applications like Azure Active Directory contain a piece of the security puzzle.  

With all the disparete components, something is needed to bring all the pieces together to provide a full picture of the security posture and to allow the quick remediation of issues potentially in an automated way.

[Microsoft Sentinel](https://docs.microsoft.com/en-us/azure/sentinel/overview) is the security tool that provides the needed connectors to bring all your security log data into one place and then provide a view into how an attack may have started.

Microsoft Sentinel works in conjunction with Azure Log Analytics and other Microsoft security services to provide a log storage, query and alerting solution.  Through machine learning, artificial intelligence and user behavior analytics (UEBA), Microsoft Sentinel can provide a higher understanding of potential issues or incidents that may not have seen with a disconnected environment.

## Microsoft Purview

Data privacy has evolved to be a big focused for organziation over the past few years.  Determining where sensitive information lives across your data estate is a requirement in today's privacy centered society.

[Microsoft Purview](https://docs.microsoft.com/en-us/azure/purview/overview) can scan your data estate, including your Azure Database for MySQL instances, to find personally identifiable information or other sensitive information types.  This data can then be analyized, classified and lineage defined across your cloud based resources.
