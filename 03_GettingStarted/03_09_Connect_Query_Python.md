# Python Language Support

This guide will demonstrate how to query Azure Database for MySQL Flexible Server using the `mysql-connector-python` library on Python 3.

## Setup

Follow one of the methods in the [Provision MySQL Flexible Server](03_05_Provision_MySQL_Flexible_Server.md) document to create a Flexible Server instance with a database.

Moreover, install Python 3.7 or above from the [Downloads page](https://www.python.org/downloads/). This sample was tested using Python 3.8.

A text editor like Visual Studio Code will greatly help.

Though a Python Virtual Environment is not necessary for the sample to run, using one will avoid conflicts with packages installed globally on your system. The commands below will create a Virtual Environment called `venv` and activate it on Windows. Instructions will differ for other OS.

```cmd
python -m venv venv
.\venv\Scripts\activate
```

## Instructions

This document is based on [Microsoft's sample](https://docs.microsoft.com/azure/mysql/flexible-server/connect-python).

The first code snippet creates a table, `inventory`, with three columns. It uses raw queries to create the `inventory` table and insert three rows. If the snippet succeeds, you should see an output like the one below.

```
Connection established
Finished dropping table (if existed).
Finished creating table.
Inserted 1 row(s) of data.
Inserted 1 row(s) of data.
Inserted 1 row(s) of data.
Done.
```

Note that the sample establishes an SSL connection with the MySQL instance. You can use the statement below (placed before `cursor` and `conn` are closed) to validate the use of SSL.

```python
cursor.execute("SHOW STATUS LIKE 'Ssl_cipher'")
print(cursor.fetchone())
```

If you want to bind the [SSL public certificate](https://dl.cacerts.digicert.com/DigiCertGlobalRootCA.crt.pem) with your connections to Flexible Server, which is recommended by Azure, download the public certificate to a location on your machine (such as `C:\Tools`). Then, edit the `config` dictionary to add the `ssl_ca` key and the file path of your certificate as the value.

```python
config = {
  'host':'[SERVER].mysql.database.azure.com',
  'user':'sqlroot',
  'password':'[PASSWORD]',
  'database':'newdatabase',
  'ssl_ca': 'C:\Tools\DigiCertGlobalRootCA.crt.pem'
}
```

The second code snippet connects to the MySQL instance and executes a raw query to SELECT all rows from the `inventory` table. This time, it uses the `fetchall()` method to parse the result set into a Python iterable. You should see an output like the one below.

```
Connection established
Read 3 row(s) of data.
Data row = (1, banana, 150)
Data row = (2, orange, 154)
Data row = (3, apple, 100)
Done.
```

The third code snippet executes an UPDATE statement to change the `quantity` value of the record identified by `name`. You should see an output like the one below.

```
Connection established
Updated 1 row(s) of data.
Done.
```

The final snippet executes a raw DELETE statement against the `inventory` table targeting records identified by `name`. You should see an output like the one below.

```
Connection established
Deleted 1 row(s) of data.
Done.
```

At this point, you have successfully opened a connection to Flexible Server, created a table (DDL), and performed CRUD operations (DML) against data in the table.

If you created a Python Virtual Environment for this document, simply enter `deactivate` into the console.
