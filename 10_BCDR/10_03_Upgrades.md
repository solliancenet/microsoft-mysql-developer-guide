## Azure Database for MySQL upgrade process

Since Azure Database for MySQL is a PaaS offering, administrators are not responsible for the management of the updates on the operating system or the MySQL software. Also, administrators need to plan for database version upgrades. Cloud providers are continuously upgrading and improving their supported offerings. Older versions eventually fall into the unsupported status.

![Read more icon](media/read-more.png "Read more")  [Retired MySQL engine versions not supported in Azure Database for MySQL](https://docs.microsoft.com/azure/mysql/concepts-version-policy#retired-mysql-engine-versions-not-supported-in-azure-database-for-mysql)

![Warning](media/warning.png) **Warning:** It is important to be aware the upgrade process can be random. During deployment, the MySQL server workloads will stop be processed on the server. Plan for these downtimes by rerouting the workloads to a read replica in the event the particular instance goes into maintenance mode.

>![Note icon](media/note.png "Note") **Note:** This style of failover architecture may require changes to the applications data layer to support this type of failover scenario. If the read replica is maintained as a read replica and is not promoted, the application will only be able to read data and it may fail when any operation attempts to write information to the database.

The [planned maintenance notification](https://docs.microsoft.com/azure/mysql/concepts-monitoring#planned-maintenance-notification) feature will inform resource owners up to 72 hours in advance of installation of an update or critical security patch.  Database administrators may need to notify application users of planned and unplanned maintenance.

>![Note icon](media/note.png "Note") **Note:** Azure Database for MySQL maintenance notifications are incredibly important.  The database maintenance can take the database and connected applications down for a short period of time.
