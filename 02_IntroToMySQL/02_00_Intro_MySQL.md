# 02 / What is MySQL?

MySQL is a relational database management system based on [Structured Query Language (SQL)](https://en.wikipedia.org/wiki/SQL). MySQL supports a rich set of SQL query capabilities and offers excellent performance through storage engines optimized for transactional and non-transactional workloads, in-memory processing, and robust server configuration through modules. Its low total cost of ownership  (TCO) makes it extremely popular with many organizations. Customers can use existing frameworks and languages to connect easily with MySQL databases. Reference the latest [MySQL Documentation](https://dev.mysql.com/doc/refman/8.0/en/features.html) for a more in-depth review of MySQL's features.  

One of MySQL databases' common use cases is the data store for web applications. Due to MySQL's scalability, popular content management systems (CMS), such as [WordPress](https://wordpress.org/) and [Drupal](https://www.drupal.org/), utilize it for their data persistence needs. More broadly, [LAMP](https://en.wikipedia.org/wiki/LAMP_(software_bundle)) apps, which integrate Linux, Apache, MySQL, and PHP, leverage scalable web servers, languages, and database engines to serve many global web services.

## Comparison with other RDBMS offerings

Though MySQL has a distinct set of advantages, it does compete with other typical relational database offerings. Though the emphasis of this guide is operating MySQL on Azure to architect scalable applications, it is important to be aware of other potential offerings such as [MariaDB](https://mariadb.org/). MariaDB is a fork from the original MySQL code base that occurred when [Oracle purchased Sun Microsystems](https://www.oracle.com/webfolder/college-recruiting/projects/mysql.html#.YexR-P7ML8o). Organizations can easily host MariaDB in Azure through [Azure Database for MariaDB.](https://azure.microsoft.com/services/mariadb/)

While MariaDB is compatible with the MySQL protocol, the project is not managed by Oracle, and its maintainers claim that this allows them to better compete with other proprietary databases. Although there are several different options to choose from, MySQL has over twenty years of development experience backing it, and businesses appreciate the platform's maturity.

Another popular open-source MySQL competitor is [PostgreSQL](https://www.postgresql.org/). MySQL supports many of the advanced features of PostgreSQL, such as JSON storage, replication and failover, and partitioning, in an easy-to-use manner. Microsoft offers a cloud-hosted [Azure Database for PostgreSQL](https://docs.microsoft.com/azure/postgresql/overview), which can be compared with cloud-hosted MySQL [in Microsoft Learn.](https://docs.microsoft.com/learn/modules/deploy-mariadb-mysql-postgresql-azure/2-describe-open-source-offerings)

## MySQL hosting options

Like other DBMS systems, MySQL has multiple deployment options for development and production environments.

### On-premises

MySQL is a cross-platform offering, and corporations can utilize their on-premises hardware to deploy highly-available MySQL configurations. MySQL on-premises deployments are highly configurable, but they require significant upfront hardware capital expenditure and have the disadvantages of hardware/OS maintenance.

One benefit to choosing a cloud-hosted environment over on-premises configurations is there are no significant upfront costs. Organizations can choose to pay monthly subscription fees as pay-as-you-go or to commit to a certain usage level for discounts. Maintenance, OS software updates, security, and support all fall into the responsibility of the cloud provider so IT staff are not required to utilize precious time troubleshooting hardware or software issues.

**Pros**

- Highly configurable environment

**Cons**

- Upfront capital expenditures
- OS and hardware maintenance
- Increased operation center and labor costs
- Time to deploy and scale new solutions

### Cloud IaaS (in a VM)

Migrating an organization's infrastructure to an IaaS solution helps reduce maintenance of on-premises data centers, save money on hardware costs, and gain real-time business insights. IaaS solutions allow IT resources to scale up and down with demand. They also help to quickly provision new applications and increase the reliability of the existing underlying infrastructure.

IaaS lets organizations bypass the cost and complexity of buying and managing physical servers and datacenter infrastructure. Each resource is offered as a separate service component and only requires paying for resources for as long as they are needed. A cloud computing service provider like Microsoft Azure manages the infrastructure, while organizations purchase, install, configure, and manage their own software—including operating systems, middleware, and applications.

**Pros**

- Highly configurable environment
- Fast deployment of additional servers
- Reduction in operation center costs

**Cons**

- OS and middleware administration costs

### Containers

While much more lightweight, containers are similar to VMs and can be started and stopped in a few seconds. Containers also offer tremendous portability, making them ideal for developing an application locally on a development machine and then hosting it in the cloud, in test, and later in production. Containers can even run  on-premises or in other clouds. This flexibility is possible because the development environment machine travels with the container. The application runs in a consistent manner. Containerized applications are flexible, cost-effective, and deploy quickly.

MySQL offers a [Docker image](https://hub.docker.com/_/mysql) to operate MySQL in customized and containerized applications. A container-based MySQL instance can persist data to the hosting environment via the container runtime, allowing for high availability across container instances and environments.

**Pros**

- Application scalability
- Portability between environments
- Automated light-weight fast deployments
- Reduced operating costs

**Cons**

- Networking and configuration complexity
- Container monitoring

### Cloud PaaS

MySQL databases can be deployed on public cloud platforms by utilizing VMs, container runtimes, and Kubernetes. However, these platforms require a middle ground of customer management.  If a fully managed environment is required, cloud providers offer their own managed MySQL products, such as Amazon RDS for MySQL and Google Cloud SQL for MySQL.  Microsoft Azure offers Azure Database for MySQL.
