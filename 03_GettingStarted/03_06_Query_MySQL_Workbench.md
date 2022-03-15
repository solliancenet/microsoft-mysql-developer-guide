# Connect and query Azure Database for MySQL using MySQL Workbench

This section explains how to perform queries against Azure Database for MySQL Flexible Server using MySQL Workbench, a UI-based management tool.

## Setup

Follow one of the methods in the [Provision Flexible Server and a database] document to create a Flexible Server instance with a database.

Download MySQL Workbench from the [MySQL Downloads.](https://dev.mysql.com/downloads/workbench/)

## Instructions

Explore the [Use MySQL Workbench with Azure Database for MySQL Flexible Server](https://docs.microsoft.com/azure/mysql/flexible-server/connect-workbench) article to perform the following activities:

- Create a new database in the Flexible Server instance
- Create, query, and update data in a table (inventory)
- Delete records from the table

Note that MySQL Workbench can automatically initiate an SSL-secured connection to Azure Database for MySQL. However, it is recommended to use the [SSL public certificate](https://dl.cacerts.digicert.com/DigiCertGlobalRootCA.crt.pem) in the connections. To bind the SSL public certificate to MySQL Workbench, choose the downloaded certificate file as the **SSL CA File** on the **SSL** tab.

![Add the SSL CA file on the SSL tab of the Setup New Connection dialog box.](./media/new-ssl-connection-with-ca-file.png "Add SSL CA file")
