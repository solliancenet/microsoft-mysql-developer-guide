# Replication

Replication in Flexible Server allows applications to scale by providing **read-only** replicas to serve queries while dedicating write operations to the main Flexible Server instance. Replication from the main instance to the read replicas is asynchronous: consequently, there is a lag between the source instance and the replicas. Microsoft estimates that this lag typically ranges between a few seconds to a few minutes.

> Replication is not a high availability strategy: consult the BCDR document for more details. Replication is designed to improve application performance, so it does not support automatic failover or bringing replicas up to the latest committed transaction during failover.

Replication is only supported in the General Purpose and Memory Optimized tiers of Flexible Server. Also, it is possible to promote a read replica to being a read-write instance; however, that severs the replication link between the main instance and the former replica, as the former replica cannot return to being a replica.

## Use cases

Often, developers use load balancers, like ProxySQL, to direct read operations to read replicas automatically. ProxySQL can [run on an Azure VM](https://techcommunity.microsoft.com/t5/azure-database-for-mysql-blog/load-balance-read-replicas-using-proxysql-in-azure-database-for/ba-p/880042) or [Azure Kubernetes Service.](https://techcommunity.microsoft.com/t5/azure-database-for-mysql-blog/deploy-proxysql-as-a-service-on-kubernetes-using-azure-database/ba-p/1105959)

Moreover, analytical systems often benefit from read replicas. BI tools can connect to read replicas, while data is written to the main instance and replicated to the read replicas asynchronously.

Using read replicas also helps implement microservices architectures. The image below demonstrates how APIs that solely access data can connect to read replicas, while APIs that modify data reference the main instance.

![This image demonstrates a possible microservices architecture with MySQL read replicas.](./media/microservices-with-replication.png "Possible microservices architecture")

## Configuring read replicas

### Flexible Server

- [Azure Portal](https://docs.microsoft.com/azure/mysql/flexible-server/how-to-read-replicas-portal)
- [Azure CLI](https://docs.microsoft.com/azure/mysql/flexible-server/how-to-read-replicas-cli)

### Single Server

- [Azure Portal](https://docs.microsoft.com/azure/mysql/howto-read-replicas-portal)
- [Azure CLI & REST API](https://docs.microsoft.com/azure/mysql/howto-read-replicas-cli)
- [Azure PowerShell](https://docs.microsoft.com/azure/mysql/howto-read-replicas-powershell)
