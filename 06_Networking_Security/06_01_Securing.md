## Security

Moving to cloud-based services doesn't mean the entire internet will have access to it at all times. Azure provides best-in-class security that ensures data workloads are continually protected from bad actors and rogue programs. Additionally, Azure provides several certifications that ensure your resources are compliant with local and industry regulations, an important factor for many organizations today.

In today's geopolitical environment, organizations must take proactive security measures to protect their workloads.  Azure simplifies many of these complex tasks and requirements through the various security and compliance resources provided out of the box.  This section will focus on many of these tools.

### Encryption

Azure Database for MySQL offers various encryption features including encryption for data, backups, and temporary files created during query execution.

Data stored in the Azure Database for MySQL instances are encrypted at rest by default. Any automated backups are also encrypted to prevent potential leakage of data to unauthorized parties. This encryption is typically performed with a key generated when the Azure Database for MySQL instance is created.

In addition to be encrypted at rest, data can be encrypted during transit using SSL/TLS and is enabled by default. As previously discussed, it may be necessary to [modify the applications](https://docs.microsoft.com/azure/mysql/howto-configure-ssl) to support this change and also configure the appropriate TLS validation settings. It is possible to allow insecure connections for legacy applications or enforce a minimum TLS version for connections but this should be used sparingly and in highly network-protected environments. Consult the guides below, as Flexible Server's TLS enforcement status can be set through the `require_secure_transport` MySQL server parameter.

- [Flexible Server](https://docs.microsoft.com/azure/mysql/flexible-server/how-to-connect-tls-ssl)
- [Single Server](https://docs.microsoft.com/azure/mysql/concepts-ssl-connection-security)

### Microsoft Sentinel

Many of the items discussed thus far operate in their own sphere of influence and are not designed to work directly with each other. Every secure feature provided by Microsoft Azure and corresponding applications like Azure Active Directory contain a piece of the security puzzle.  

With all the disparate components, something is needed to bring all the pieces together to provide a full picture of the security posture and to allow the quick remediation of issues potentially in an automated way.

[Microsoft Sentinel](https://docs.microsoft.com/en-us/azure/sentinel/overview) is the security tool that provides the needed connectors to bring all your security log data into one place and then provide a view into how an attack may have started.

Microsoft Sentinel works in conjunction with Azure Log Analytics and other Microsoft security services to provide a log storage, query and alerting solution.  Through machine learning, artificial intelligence and user behavior analytics (UEBA), Microsoft Sentinel can provide a higher understanding of potential issues or incidents that may not have seen with a disconnected environment.

### Microsoft Purview

Data privacy has evolved to be a big focused for organization over the past few years. Determining where sensitive information lives across your data estate is a requirement in today's privacy centered society.

[Microsoft Purview](https://docs.microsoft.com/en-us/azure/purview/overview) can scan your data estate, including your Azure Database for MySQL instances, to find personally identifiable information or other sensitive information types.  This data can then be analyzed, classified and lineage defined across your cloud based resources.

### Security baselines

In addition to all the topics discussed above, the Azure Database for MySQL [security baseline](https://docs.microsoft.com/azure/mysql/security-baseline) is a basic set of potential tasks that can be implemented on your Azure Database for MySQL instances to further solidify your security posture.
