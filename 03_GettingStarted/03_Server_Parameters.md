# Server Parameters

MySQL server parameters allow developers to optimize the MySQL engine for their applications. Azure exposes a subset of these parameters. Some parameters that cannot be configured at the server-level can be configured at the connection-level. Moreover, *dynamic* parameters can be changed without restarting the server, while modifying *static* parameters warrants a restart.

One of the advantages of Flexible Server is its versatility. Some important exposed parameters are listed below, and the instance's storage and compute tiers affect the possible parameter values. Consult the [Microsoft documentation](https://docs.microsoft.com/azure/mysql/flexible-server/concepts-server-parameters) for more information.

- [log_bin_trust_function_creators](https://dev.mysql.com/doc/refman/8.0/en/replication-options-binary-log.html#sysvar_log_bin_trust_function_creators) is enabled by default and indicates whether users can create triggers

- [innodb_buffer_pool_size](https://dev.mysql.com/doc/refman/8.0/en/innodb-parameters.html#sysvar_innodb_buffer_pool_size) indicates the size of the buffer pool, a cache for tables and indexes

    > For this parameter, consult the [Microsoft documentation](https://docs.microsoft.com/en-us/azure/mysql/flexible-server/concepts-server-parameters), as database compute tier affects the parameter value range

- [innodb_file_per_table](https://dev.mysql.com/doc/refman/8.0/en/innodb-parameters.html#sysvar_innodb_file_per_table) affects where table and index data are stored

Azure Database for MySQL Single Server includes support for the three server parameters listed above. For a comprehensive list of Single Server's supported parameters, consult the [Microsoft documentation.](https://docs.microsoft.com/azure/mysql/concepts-server-parameters)

## Tools to Set Server Parameters

Standard Azure management tools, like the Azure portal, Azure CLI, and Azure PowerShell, apply for configuring PaaS MySQL server parameters.

### Flexible Server Guides

- [Azure portal](https://docs.microsoft.com/azure/mysql/flexible-server/how-to-configure-server-parameters-portal)
- [Azure CLI](https://docs.microsoft.com/azure/mysql/flexible-server/how-to-configure-server-parameters-cli)

### Single Server Guides

- [Azure portal](https://docs.microsoft.com/azure/mysql/howto-server-parameters)
- [Azure CLI](https://docs.microsoft.com/azure/mysql/howto-configure-server-parameters-using-cli)
- [Azure PowerShell](https://docs.microsoft.com/azure/mysql/howto-configure-server-parameters-using-powershell)

## Server Parameters Best Practices - TODO
