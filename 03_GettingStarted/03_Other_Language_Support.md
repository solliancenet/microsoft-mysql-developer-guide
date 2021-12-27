# Other Notable Languages for MySQL Apps

Like the other language support guides, Flexible Server is compatible with all MySQL clients that support MySQL Community Edition. Microsoft provides a [curated list of compatible clients for MySQL Single Server](https://docs.microsoft.com/azure/mysql/concepts-compatibility).

## .NET

.NET applications typically use ORMs to access databases and improve portability: two of the most popular ORMs are Entity Framework (Core) and Dapper. 

Using MySQL with Entity Framework (Core) requires [MySQL Connector/NET](https://github.com/mysql/mysql-connector-net), which is compatible with Single Server. Learn more [from the MySQL documentation](https://dev.mysql.com/doc/connector-net/en/connector-net-entityframework-core.html) about support for Entity Framework (Core).

Microsoft has also validated that MySQL Single Server is compatible with the [Async MySQL Connector for .NET](https://github.com/mysql-net/MySqlConnector). This connector works with both Dapper and Entity Framework (Core).

## Ruby

The [*Mysql2*](https://github.com/brianmario/mysql2) library, compatible with Single Server, provides MySQL connectivity in Ruby by referencing C implementations of the MySQL connector.
