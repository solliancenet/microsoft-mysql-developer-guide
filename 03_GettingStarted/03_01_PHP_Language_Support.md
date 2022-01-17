# PHP Language Support

This section describes tools to interact with Azure Database for MySQL (Single Server and Flexible Server) through PHP.

## Example Code

Refer to the [Connect and Query sample for PHP](./03_Connect_Query_PHP.md) application for examples of how to use PHP to connect to MySQL.

## Application Connectors

There are two major APIs to interact with MySQL in PHP:

- *MySQLi*, *MySQLi* is an improvement over the earlier *MySQL* API, which does not meet the security needs of modern applications.
- *PDO*, or *PHP Data Objects*, allows applications to access databases in PHP through abstractions, standardizing data access for different databases. PDO works with a database-specific driver, like *PDO_MYSQL*.

> **Note** *MySQLi* and *PDO* are wrappers over the *mysqlnd* or *libmysqlclient* C libraries: it is highly recommended to use *mysqlnd* as the default backend library due to its more advanced features. *mysqlnd* is the default backend provided with PHP.

Flexible Server and Single Server are compatible with all PHP client utilities for MySQL Community Edition.

## Resources

1. [Backend libraries for mysqli and PDO_MySQL](https://www.php.net/manual/en/mysqlinfo.library.choosing.php)
2. [Introduction to PDO](https://www.php.net/manual/en/intro.pdo.php)
3. [PDO_MYSQL Reference](https://www.php.net/manual/en/ref.pdo-mysql.php)