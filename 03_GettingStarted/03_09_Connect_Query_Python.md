## Connect and query Azure Database for MySQL using Python

This section will demonstrate how to query Azure Database for MySQL Flexible Server using the `mysql-connector-python` library on Python 3.

### Setup

Follow one of the methods in the [Provision Flexible Server and a database] document to create a Flexible Server instance with a database.

Moreover, install Python 3.7 or above from the [Downloads page](https://www.python.org/downloads/). This sample was tested using Python 3.8.

A text editor like Visual Studio Code will greatly help.

Though a Python Virtual Environment is not necessary for the sample to run, using one will avoid conflicts with packages installed globally on the development system. The commands below will create a Virtual Environment called `venv` and activate it on Windows. Instructions will differ for other OS.

```cmd
python -m venv venv
.\venv\Scripts\activate
```

### Instructions

This section is based on [Microsoft's sample](https://docs.microsoft.com/azure/mysql/flexible-server/connect-python).

The first code snippet creates a table, `inventory`, with three columns. It uses raw queries to create the `inventory` table and insert three rows. If the snippet succeeds, an output like the one below will be displayed.

```
Connection established
Finished dropping table (if existed).
Finished creating table.
Inserted 1 row(s) of data.
Inserted 1 row(s) of data.
Inserted 1 row(s) of data.
Done.
```

Note that the sample establishes an SSL connection with the MySQL instance. Use the statement below (placed before `cursor` and `conn` are closed) to validate the use of SSL.

```python
cursor.execute("SHOW STATUS LIKE 'Ssl_cipher'")
print(cursor.fetchone())
```

It is recommended to bind the [SSL public certificate](https://dl.cacerts.digicert.com/DigiCertGlobalRootCA.crt.pem) with connections to Flexible Server. Download the public certificate to a location on the development machine (such as `C:\Tools`). Then, edit the `config` dictionary to add the `ssl_ca` key and the file path of the certificate as the value.

```python
config = {
  'host':'[SERVER].mysql.database.azure.com',
  'user':'sqlroot',
  'password':'[PASSWORD]',
  'database':'newdatabase',
  'ssl_ca': 'C:\Tools\DigiCertGlobalRootCA.crt.pem'
}
```

The second code snippet connects to the MySQL instance and executes a raw query to SELECT all rows from the `inventory` table. This time, it uses the `fetchall()` method to parse the result set into a Python iterable. An output like the one below should display:

```
Connection established
Read 3 row(s) of data.
Data row = (1, banana, 150)
Data row = (2, orange, 154)
Data row = (3, apple, 100)
Done.
```

The third code snippet executes an UPDATE statement to change the `quantity` value of the record identified by `name`. An output like the one below should display:

```
Connection established
Updated 1 row(s) of data.
Done.
```

The final snippet executes a raw DELETE statement against the `inventory` table targeting records identified by `name`. An output like the one below should display:

```
Connection established
Deleted 1 row(s) of data.
Done.
```

At this point, a successfully opened connection to Flexible Server was established, a table created (DDL), and CRUD operations performed (DML) against data in the table.

If a Python Virtual Environment was created, simply enter `deactivate` into the console to remove it.
