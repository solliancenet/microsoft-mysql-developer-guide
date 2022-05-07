## Language support

Once an editor is selected, the next step is to pick a development language or platform. Below are some quick links:

[PHP]

[Java]

[Python]

[Other notable languages for MySQL apps]

### PHP

This section describes tools to interact with Azure Database for MySQL (Single Server and Flexible Server) through PHP.

#### Connect and query

##### Setup

Follow one of the methods in the [Create a Flexible Server database] document to create a Flexible Server instance with a database.

Moreover, install PHP from the [downloads page.](https://windows.php.net/download/) These instructions were tested with PHP 8.0.13 (any PHP 8.0 version should work).

> The `php.ini` file needs to uncomment the `extension=mysqli` and `extension=openssl` lines for these steps to work.

A text editor such as Visual Studio Code may also be useful.

Lastly, download the [connection certificate](https://dl.cacerts.digicert.com/DigiCertGlobalRootCA.crt.pem) that is used for SSL connections with the MySQL Flexible Server instance. In these snippets, the certificate is saved to `C:\Tools` on Windows. Adjust this if necessary.

##### Instructions

Microsoft's [Quickstart guide](https://docs.microsoft.com/azure/mysql/flexible-server/connect-php) performs standard CRUD operations against the MySQL instance from a console app. This document modifies the code segments from the guide to provide an encrypted connection to the Flexible Server instance.

The first code snippet creates a table called `Products` with four columns, including a primary key. Adjust the `host`, `username` (most likely `sqlroot`), `password`, and `db_name` (most likely `newdatabase`) parameters to the values used during provisioning. Moreover, adjust the certificate path in the `mysqli_ssl_set()` method.

```php
<?php
$host = '[SERVER NAME].mysql.database.azure.com';
$username = 'sqlroot';
$password = '[PASSWORD]';
$db_name = 'newdatabase';

//Establishes the connection
$conn = mysqli_init();
mysqli_ssl_set($conn, NULL, NULL, "C:\Tools\DigiCertGlobalRootCA.crt.pem", NULL, NULL);
mysqli_real_connect($conn, $host, $username, $password, $db_name, 3306, MYSQLI_CLIENT_SSL);
if (mysqli_connect_errno()) {
die('Failed to connect to MySQL: '.mysqli_connect_error());
}

// Run the create table query
if (mysqli_query($conn, '
CREATE TABLE Products (
`Id` INT NOT NULL AUTO_INCREMENT ,
`ProductName` VARCHAR(200) NOT NULL ,
`Color` VARCHAR(50) NOT NULL ,
`Price` DOUBLE NOT NULL ,
PRIMARY KEY (`Id`)
);
')) {
printf("Table created\n");
}

//Close the connection
mysqli_close($conn);
?>
```

Console output with the message `Table created` should be displayed.

The second code snippet uses the same logic to start and close an SSL-secured connection. This time, it leverages a prepared insert statement with bound parameters.

```php
<?php
$host = '[SERVER NAME].mysql.database.azure.com';
$username = 'sqlroot';
$password = '[PASSWORD]';
$db_name = 'newdatabase';

//Establishes the connection
$conn = mysqli_init();
mysqli_ssl_set($conn, NULL, NULL, "C:\Tools\DigiCertGlobalRootCA.crt.pem", NULL, NULL);
mysqli_real_connect($conn, $host, $username, $password, $db_name, 3306, MYSQLI_CLIENT_SSL);
if (mysqli_connect_errno()) {
die('Failed to connect to MySQL: '.mysqli_connect_error());
}

//Create an Insert prepared statement and run it
$product_name = 'BrandNewProduct';
$product_color = 'Blue';
$product_price = 15.5;
if ($stmt = mysqli_prepare($conn, "INSERT INTO Products (ProductName, Color, Price) VALUES (?, ?, ?)")) {
mysqli_stmt_bind_param($stmt, 'ssd', $product_name, $product_color, $product_price);
mysqli_stmt_execute($stmt);
printf("Insert: Affected %d rows\n", mysqli_stmt_affected_rows($stmt));
mysqli_stmt_close($stmt);
}

//Close the connection
mysqli_close($conn);
?>
```

The console output message `Insert: Affected 1 rows` should be displayed.

The third code snippet utilizes the `mysqli_query()` method, just like the first code snippet. However, it also utilizes the `mysqli_fetch_assoc()` method to parse the result set.

```php
<?php
$host = '[SERVER NAME].mysql.database.azure.com';
$username = 'sqlroot';
$password = '[PASSWORD]';
$db_name = 'newdatabase';

//Establishes the connection
$conn = mysqli_init();
mysqli_ssl_set($conn, NULL, NULL, "C:\Tools\DigiCertGlobalRootCA.crt.pem", NULL, NULL);
mysqli_real_connect($conn, $host, $username, $password, $db_name, 3306, MYSQLI_CLIENT_SSL);
if (mysqli_connect_errno()) {
die('Failed to connect to MySQL: '.mysqli_connect_error());
}

//Run the Select query
printf("Reading data from table: \n");
$res = mysqli_query($conn, 'SELECT * FROM Products');
while ($row = mysqli_fetch_assoc($res)) {
var_dump($row);
}

//Close the connection
mysqli_close($conn);
?>
```

PHP returns an array with the column values for the row inserted in the previous snippet. 

The next snippet uses a prepared update statement with bound parameters. It modifies the `Price` column of the record.

```php
<?php
$host = '[SERVER NAME].mysql.database.azure.com';
$username = 'sqlroot';
$password = '[PASSWORD]';
$db_name = 'newdatabase';

//Establishes the connection
$conn = mysqli_init();
mysqli_ssl_set($conn, NULL, NULL, "C:\Tools\DigiCertGlobalRootCA.crt.pem", NULL, NULL);
mysqli_real_connect($conn, $host, $username, $password, $db_name, 3306, MYSQLI_CLIENT_SSL);
if (mysqli_connect_errno()) {
die('Failed to connect to MySQL: '.mysqli_connect_error());
}

//Run the Update statement
$product_name = 'BrandNewProduct';
$new_product_price = 15.1;
if ($stmt = mysqli_prepare($conn, "UPDATE Products SET Price = ? WHERE ProductName = ?")) {
mysqli_stmt_bind_param($stmt, 'ds', $new_product_price, $product_name);
mysqli_stmt_execute($stmt);
printf("Update: Affected %d rows\n", mysqli_stmt_affected_rows($stmt));

//Close the connection
mysqli_stmt_close($stmt);
}

//Close the connection
mysqli_close($conn);
?>
```

After executing these commands, the message `Update: Affected 1 rows` should be displayed.

The final code snippet deletes a row from the table using the `ProductName` column value. It again uses a prepared statement with bound parameters.

```php
<?php
$host = '[SERVER NAME].mysql.database.azure.com';
$username = 'sqlroot';
$password = '[PASSWORD]';
$db_name = 'newdatabase';

//Establishes the connection
$conn = mysqli_init();
mysqli_ssl_set($conn, NULL, NULL, "C:\Tools\DigiCertGlobalRootCA.crt.pem", NULL, NULL);
mysqli_real_connect($conn, $host, $username, $password, $db_name, 3306, MYSQLI_CLIENT_SSL);
if (mysqli_connect_errno()) {
die('Failed to connect to MySQL: '.mysqli_connect_error());
}

//Run the Delete statement
$product_name = 'BrandNewProduct';
if ($stmt = mysqli_prepare($conn, "DELETE FROM Products WHERE ProductName = ?")) {
mysqli_stmt_bind_param($stmt, 's', $product_name);
mysqli_stmt_execute($stmt);
printf("Delete: Affected %d rows\n", mysqli_stmt_affected_rows($stmt));
mysqli_stmt_close($stmt);
}

//Close the connection
mysqli_close($conn);
?>
```

Congratulations. An SSL-secured connection with Flexible Server was demonstrated, a table was created (DDL), and some CRUD operations were performed against that table (DML).

#### Application connectors

There are two major APIs to interact with MySQL in PHP:

- *MySQLi*, *MySQLi* is an improvement over the earlier *MySQL* API, which does not meet the security needs of modern applications.
- *PDO*, or *PHP Data Objects*, allows applications to access databases in PHP through abstractions, standardizing data access for different databases. PDO works with a database-specific driver, like *PDO_MYSQL*.

>![Tip](media/tip.png "Tip") **Tip:** *MySQLi* and *PDO* are wrappers over the *mysqlnd* or *libmysqlclient* C libraries: it is highly recommended to use *mysqlnd* as the default backend library due to its more advanced features. *mysqlnd* is the default backend provided with PHP.

Flexible Server and Single Server are compatible with all PHP client utilities for MySQL Community Edition.

#### Resources

1. [Create a PHP web app in Azure App Service](https://aka.ms/php-qs)
2. [Backend libraries for mysqli and PDO_MySQL](https://www.php.net/manual/en/mysqlinfo.library.choosing.php)
3. [Introduction to PDO](https://www.php.net/manual/en/intro.pdo.php)
4. [PDO_MYSQL Reference](https://www.php.net/manual/en/ref.pdo-mysql.php)
5. [Configure a PHP app for Azure App Service](https://docs.microsoft.com/azure/app-service/configure-language-php?pivots=platform-linux)
6. The [php.ini directives](https://www.php.net/manual/en/ini.list.php) allow for the customization of the PHP environment.
