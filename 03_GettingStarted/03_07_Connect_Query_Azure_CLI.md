## Connect and query Azure Database for MySQL using the Azure CLI

Workbench is not the only method of running queries against your MySQL database. This section explains how to perform queries against Azure Database for MySQL Flexible Server using the Azure CLI and the `az mysql flexible-server` utilities and references the steps in the [Quickstart: Connect and query with Azure CLI with Azure Database for MySQL - Flexible Server](https://docs.microsoft.com/azure/mysql/flexible-server/connect-azure-cli#create-a-database) article.

### Setup

While the Azure article demonstrates how to provision a Flexible Server instance using the CLI, any of the presented provisioning methods in the [Create a Flexible Server database] section are possible.

### Instructions

The Azure CLI supports running queries interactively, via the `az mysql flexible-server connect` command, which is similar to running queries interactively against a MySQL instance through the MySQL CLI. It is also possible to run an individual SQL query or a SQL file using the `az mysql flexible-server execute` command.

Note that these commands require the `rdbms-connect` CLI extension, which is automatically installed if it is not present. If permissions errors are encountered from the Azure Cloud Shell, execute the commands from a local installation of the Azure CLI.

In addition to the queries in the document, it is also possible to run basic admin queries. The statements below create a new user `analyst` that can read data from all tables in `newdatabase`.

```sql
USE newdatabase;
CREATE USER 'analyst'@'%' IDENTIFIED BY '[SECURE PASSWORD]';
GRANT SELECT ON newdatabase.* TO 'analyst'@'%';
FLUSH PRIVILEGES;
```

The new `analyst` user can also connect to `newdatabase` in the Flexible Server instance. The new user can only query tables in `newdatabase`.

![This image demonstrates running queries against the Flexible Server instance using the Azure CLI.](./media/analyst-query.png "Running an admin query from the Azure CLI")

> For more details on creating databases and users in Single Server and Flexible Server, consult [this document.](https://docs.microsoft.com/azure/mysql/howto-create-users?tabs=flexible-server) Note that it uses the `mysql` CLI.
