## PHP language support

This section describes tools to interact with Azure Database for MySQL (Single Server and Flexible Server) through PHP.

### Example code

Refer to the [Connect and query Azure Database for MySQL using PHP] application for examples of how to use PHP to connect to MySQL.

### Application connectors

There are two major APIs to interact with MySQL in PHP:

- *MySQLi*, *MySQLi* is an improvement over the earlier *MySQL* API, which does not meet the security needs of modern applications.
- *PDO*, or *PHP Data Objects*, allows applications to access databases in PHP through abstractions, standardizing data access for different databases. PDO works with a database-specific driver, like *PDO_MYSQL*.

> **Note** *MySQLi* and *PDO* are wrappers over the *mysqlnd* or *libmysqlclient* C libraries: it is highly recommended to use *mysqlnd* as the default backend library due to its more advanced features. *mysqlnd* is the default backend provided with PHP.

Flexible Server and Single Server are compatible with all PHP client utilities for MySQL Community Edition.

### Resources

1. [Create a PHP web app in Azure App Service](https://aka.ms/php-qs)
2. [Backend libraries for mysqli and PDO_MySQL](https://www.php.net/manual/en/mysqlinfo.library.choosing.php)
3. [Introduction to PDO](https://www.php.net/manual/en/intro.pdo.php)
4. [PDO_MYSQL Reference](https://www.php.net/manual/en/ref.pdo-mysql.php)
5. [Configure a PHP app for Azure App Service](https://docs.microsoft.com/azure/app-service/configure-language-php?pivots=platform-linux)
6. The [php.ini directives](https://www.php.net/manual/en/ini.list.php) allow you to set and customize configure your PHP setup.
