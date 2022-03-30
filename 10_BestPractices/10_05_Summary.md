## 10 / Summary

This section aptly pointed out that platform as a service instances such as Azure Database for MySQL still have some downtime that must be taken into consideration.  Because versions of MySQL will eventually run out of support, you will need to ensure that you account for the possibliity of upgrades that will take your applications down.  Consider using read only replicas that will maintain the application availability during these downtimes.  To support these types of architectures, the applications may need to be able to gracefully support the failover to read-only nodes when users attempt to perform write based activities.

### Checklist

- Perform backups regularly, ensure the backup frequency meets requirements.
- Setup read replicas for read intensive workloads and regional failover.
- Use resource locks to prevent accidental deletions.
- Create resource locks on resource groups.
- Implement a load balancing strategy for applications for quick failover.
- Be aware that service outages will occur and you must plan appropriatly.
- Setup maintenance notifications.
