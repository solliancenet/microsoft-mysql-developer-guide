# Introduction and Common Use Cases for MySQL

MySQL is a relational database management system based on SQL – Structured Query Language. MySQL supports a rich set of SQL query capabilities and offers excellent performance through storage engines optimized for transactional and non-transactional workloads, in-memory processing, and robust server configuration through modules. Customers can use their existing frameworks and languages to ensure that a migration does not disrupt any business activity.  Consult the [MySQL Documentation](https://dev.mysql.com/doc/refman/8.0/en/features.html) for a more in-depth review of MySQL's features.

One of the most common use cases for MySQL databases is web applications. Due to MySQL's scalability, popular content management systems, such as [WordPress](https://wordpress.org/) and [Drupal](https://www.drupal.org/) utilize it for data persistence. More broadly, LAMP apps, which integrate Linux, Apache, MySQL, and PHP, leverage scalable web servers, languages, and database engines to serve a large fraction of global web services.

## Comparison with Other RDBMS Offerings

Though MySQL has a distinct set of advantages, it competes with a vast number of other relational database offerings. Though the emphasis of this guide is operating MySQL on Azure to architect scalable applications, it is important to be aware of other offerings, notably MariaDB. MariaDB was forked from the MySQL code base when Oracle purchased MySQL.

While MariaDB is compatible with the MySQL protocol, the project is not managed by Oracle, and its maintainers claim that this allows them to better compete with proprietary databases. However, MySQL has over twenty years of development experience, and businesses appreciate the platform's maturity.

Another popular open-source MySQL competitor is PostgreSQL. MySQL supports many of the advanced features of PostgreSQL, such as JSON storage, replication and failover, and partitioning, in an easy-to-use manner. Microsoft offers cloud-hosted PostgreSQL, which you can compare with cloud-hosted MySQL [in Microsoft Learn.](https://docs.microsoft.com/learn/modules/deploy-mariadb-mysql-postgresql-azure/2-describe-open-source-offerings)

## Deployment Models

MySQL has a plethora of deployment options for development and production environments alike.

### On-premises

MySQL is a cross-platform offering, and corporations can utilize their on-premises hardware to deploy highly-available MySQL configurations. MySQL on-premises deployments are highly configurable, but they require significant upfront capital expenditure and have the disadvantages of hardware/OS maintenance.

### Docker

MySQL offers a [Docker image](https://hub.docker.com/_/mysql) to operate MySQL in containerized applications. Containerized MySQL can persist data to the machine with the Docker runtime, and it can even operate from an existing MySQL data directory. Containerized applications are flexible, cost-effective, and deploy quickly.

Think of Docker containers like small servers--you simply create them from an image and network them to serve an application.

### Other Clouds

MySQL databases can be deployed on other public cloud platforms by utilizing VMs, such as Amazon EC2; this is known as an *IaaS* deployment. However, these platforms offer their own managed MySQL products, such as [Amazon RDS for MySQL](https://aws.amazon.com/rds/mysql/) and [Google Cloud SQL for MySQL](https://cloud.google.com/sql/docs/mysql#docs).