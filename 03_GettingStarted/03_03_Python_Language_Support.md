### Python

This section describes tools to interact with Azure Database for MySQL (Single Server and Flexible Server) through Python.

#### Connect and query

##### Setup

This section will demonstrate how to query Azure Database for MySQL Flexible Server using the `mysql-connector-python` library on Python 3.

Follow one of the methods in the [Create a Flexible Server database] document to create a Flexible Server instance with a database.

Moreover, install Python 3.7 or above from the [Downloads page](https://www.python.org/downloads/). This sample was tested using Python 3.8.

A text editor like Visual Studio Code will greatly help.

Though a Python Virtual Environment is not necessary for the sample to run, using one will avoid conflicts with packages installed globally on the development system. The commands below will create a Virtual Environment called `venv` and activate it on Windows. Instructions will differ for other OS.

```cmd
python -m venv venv
.\venv\Scripts\activate
```

##### Instructions

This section is based on [Microsoft's sample](https://docs.microsoft.com/azure/mysql/flexible-server/connect-python).

The first code snippet creates a table, `inventory`, with three columns. It uses raw queries to create the `inventory` table and insert three rows. If the snippet succeeds, the following output will be displayed.

```python
Connection established
Finished dropping table (if existed).
Finished creating table.
Inserted 1 row(s) of data.
Inserted 1 row(s) of data.
Inserted 1 row(s) of data.
Done.
```

>![Note icon](media/note.png "Note") **Note:** The sample establishes an SSL connection with the MySQL instance. Use the statement below (placed before `cursor` and `conn` are closed) to validate the use of SSL.

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

```python
Connection established
Read 3 row(s) of data.
Data row = (1, banana, 150)
Data row = (2, orange, 154)
Data row = (3, apple, 100)
Done.
```

The third code snippet executes an UPDATE statement to change the `quantity` value of the record identified by `name`. An output like the one below should display:

```python
Connection established
Updated 1 row(s) of data.
Done.
```

The final snippet executes a raw DELETE statement against the `inventory` table targeting records identified by `name`. An output like the one below should display:

```python
Connection established
Deleted 1 row(s) of data.
Done.
```

At this point, a successfully opened connection to Flexible Server was established, a table was created (DDL), and CRUD operations were performed (DML) against data in the table.

If a Python Virtual Environment was created, simply enter `deactivate` into the console to remove it.
.

#### Application connectors

*MySQL Connector/Python* offers a Python Database API specification-compatible driver for MySQL database access (PEP 249). It does not depend on a MySQL client library. The Python Connect and Query sample utilizes *MySQL Connector/Python*.

An alternative connector is *PyMySQL*. It is also PEP 249-compliant.

Django is a popular web application framework for Python. The Django ORM officially supports MySQL through (1) the *mysqlclient* Python wrapper for the native MySQL driver or (2) the *MySQL Connector/Python* API. *mysqlclient* is recommended for use with the Django ORM.

Flexible Server is compatible with all Python client utilities for MySQL Community Edition. However, Microsoft has only validated *MySQL Connector/Python* and *PyMySQL* for use with Single Server due to its network connectivity setup. Refer to [this](https://docs.microsoft.com/azure/mysql/concepts-compatibility) document for more information about drivers compatible with Single Server.

#### Resources

1. [Introduction to MySQL Connector/Python](https://dev.mysql.com/doc/connector-python/en/connector-python-introduction.html)
2. [PyMySQL Samples](https://pymysql.readthedocs.io/en/latest/user/examples.html)
3. [MySQLdb (mysqlclient) User's Guide](https://mysqlclient.readthedocs.io/user_guide.html#mysqldb)
4. [Django ORM Support for MySQL](https://docs.djangoproject.com/en/3.2/ref/databases/#mysql-notes)
