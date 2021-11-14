# Introduction to MySQL

Choosing a relational database is an important consideration for any application. MySQL database is one of the most popular open source database choices, suitable for heavily-utilized enterprise applications. 

## Common Use Cases for MySQL

MySQL supports a rich set of SQL query capabilities and offers excellent performance through storage engines optimized for transactional and non-transactional workloads, in-memory processing, and robust server configuration through modules. Consult the [MySQL Documentation](https://dev.mysql.com/doc/refman/8.0/en/features.html) for a more in-depth review of MySQL's features.

One of the most common uses cases for MySQL databases is web applications. Due to MySQL's scalability, popular content management systems, such as [WordPress](https://wordpress.org/) and [Drupal](https://www.drupal.org/) utilize it for persistence. More broadly, LAMP apps, which integrate Linux, Apache, MySQL, and PHP, leverage scalable web servers, languages, and database engines to serve a large fraction of global web services.

### Comparison with Other RDBMS Offerings

Though MySQL has a distinct set of advantages, it competes with a vast number of other relational database offerings. Though the emphasis of this guide is operating MySQL on Azure to architect scalable applications, it is important to be aware of other offerings, notably MariaDB.

While MariaDB is compatible with the MySQL protocol, the project is not managed by Oracle, and its maintainers claim that this allows them to better compete with proprietary databases. However, MySQL has over twenty years of development experience, and businesses appreciate the platform's maturity.

Another popular open source MySQL competitor is PostgreSQL. MySQL supports many of the advanced features of PostgreSQL, such as JSON storage, replication and failover, and partitioning, in an easy to use manner.

## Deployment Models

MySQL has a plethora of deployment options for development and production environments alike.

### On-premises

MySQL is a cross-platform offering, and corporations can utilize their on-premises hardware to deploy highly-available MySQL configurations. On-premises deployments of MySQL require significant capital expenditure.

### Docker

MySQL offers a [Docker image](https://hub.docker.com/_/mysql) to operate MySQL in containerized applications. Containerized MySQL can persist data to the machine with the Docker runtime, and it can even operate from an existing MySQL data directory.

### Other Clouds

MySQL databases can be deployed on other public cloud platforms by utilizing VMs, such as Amazon EC2; this is known as an *IaaS* deployment. However, these platforms offer their own managed MySQL products, such as [Amazon RDS for MySQL](https://aws.amazon.com/rds/mysql/) and [Google Cloud SQL for MySQL](https://cloud.google.com/sql/docs/mysql#docs).