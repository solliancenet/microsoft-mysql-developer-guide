# Migrate to Flexible Server

## From Single Server to Flexible Server

Data-in replication, which replays log events from the source system to the target system, is the preferred approach for migrating from Single Server to Flexible Server. Typically, teams take generate a dump of the source Single Server through a utility like `mydumper`. Then, they restore the dump to the target Flexible Server using `myloader`. Lastly, they configure data-in replication on the target Flexible Server, modify their applications to target Flexible Server, and end replication.

Consult the [Azure documentation](https://docs.microsoft.com/azure/mysql/howto-migrate-single-flexible-minimum-downtime) for more information.

## From on-premises to Flexible Server

Like the migration from Single Server, migrations from sources running on-premises utilize data-in replication. You must ensure that the source databases are MySQL 5.7 or higher and that there is adequate network connectivity.

Verify that your source meets the migration requirements listed in the [Azure documentation.](https://docs.microsoft.com/azure/mysql/flexible-server/concepts-data-in-replication)
