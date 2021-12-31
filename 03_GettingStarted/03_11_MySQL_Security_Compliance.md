# Security and Compliance in Azure Database for MySQL

Azure Database for MySQL provides extensive platform management and simple integration with new or existing applications. However, a critical factor for many sensitive industries is being compliant with regulations. Azure has addressed these customer concerns.

## Data Encryption

Both Azure Database for MySQL offerings, Single Server and Flexible Server, offers data encryption at rest. Data, backups, and temporary files created during query execution are all encrypted.

While Azure can manage encryption keys, Single Server supports bring your own key (BYOK), providing organizations full key lifecycle control. This feature is only supported in the General Purpose and Memory Optimized tiers.

### Configuring Data Encryption At Rest Guides

- [Single Server BYOK](https://docs.microsoft.com/azure/mysql/concepts-data-encryption-mysql)

Moreover, data-in-transit is protected using SSL/TLS, which is enforced by default. However, it is possible to allow insecure connections for legacy applications or enforce a minimum TLS version for connections. Consult the guides below, as Flexible Server's TLS enforcement status can be set through the `require_secure_transport` MySQL server parameter.

### Configuring Data Encryption In-Motion Guides

- [Single Server](https://docs.microsoft.com/azure/mysql/concepts-ssl-connection-security)
- [Flexible Server](https://docs.microsoft.com/azure/mysql/flexible-server/how-to-connect-tls-ssl)

## Security Best Practices Overview

Organizations must take proactive security measures to protect their workloads. Azure simplifies following best practices.

### Implement Network Security

Both MySQL PaaS offerings support public connectivity, which permits certain hosts to access the instance over the public internet, and private connectivity, which limits access to an Azure virtual network deployment. The difference between public and private access is addressed in the [network security document.](./03_Network_Security.md) 

### Access Management

When provisioning PaaS MySQL, Azure requires administrator user credentials. It is best practice to create non-administrator users for each database in the MySQL instance. Follow [this](https://docs.microsoft.com/azure/mysql/howto-create-users) guide for more information on how to create new databases and manage access.

### Monitoring and Threat Protection

[Microsoft Defender for open-source relational databases](https://docs.microsoft.com/azure/defender-for-cloud/defender-for-databases-introduction) tracks unusual database activity, like brute force login attempts. It notifies administrators of anomalies and helps them patch vulnerabilities. Currently, it is supported in the General Purpose and Memory Optimized tiers of Single Server. Enable it by following [this](https://docs.microsoft.com/azure/defender-for-cloud/defender-for-databases-usage) guide.

Single Server and Flexible Server also support audit logging. Note that excessive audit logging degrades server performance, so be mindful of the events and users configured for logging.

#### Configuring Audit Logging Guides

- [Single Server](https://docs.microsoft.com/azure/mysql/concepts-audit-logs)
- [Flexible Server](https://docs.microsoft.com/azure/mysql/flexible-server/concepts-audit-logs)
