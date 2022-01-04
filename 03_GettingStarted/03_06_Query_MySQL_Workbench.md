# Query Azure Database for MySQL using MySQL Workbench

This guide explains how to perform queries against Azure Database for MySQL Flexible Server using MySQL Workbench, a UI-based management tool.

## Setup

Follow one of the methods in the [Provision MySQL Flexible Server](03_05_Provision_MySQL_Flexible_Server.md) document to create a Flexible Server instance with a database.

Download MySQL Workbench from the [MySQL Downloads.](https://dev.mysql.com/downloads/workbench/) This document was written using version 8.0.26: we recommend this version because Single Server is not compatible with 8.0.27, so 8.0.26 has the greatest flexibility.

## Instructions

This guide is based on a [Microsoft document.](https://docs.microsoft.com/azure/mysql/flexible-server/connect-workbench) Follow the guide to create a new database in the Flexible Server instance, create a new table (`inventory`), query the table, update data in the table, and delete records from the table.

Note that MySQL Workbench can automatically initiate an SSL-secured connection to Azure Database for MySQL. However, it is recommended to use the [SSL public certificate](https://dl.cacerts.digicert.com/DigiCertGlobalRootCA.crt.pem) in your connections. To bind the SSL public certificate to MySQL Workbench, choose the downloaded certificate file as the **SSL CA File** on the **SSL** tab.

![Add the SSL CA file on the SSL tab of the Setup New Connection dialog box.](./media/new-ssl-connection-with-ca-file.png "Add SSL CA file")
