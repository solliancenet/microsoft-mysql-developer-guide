## 10 / Summary

A solid BCDR plan is critical for every organization. The operation team should leverage strategies covered in this chapter to ensure business continuity. Downtime events are not only disaster events, but also include normal scheduled maintenance. This chapter pointed out that platform as a service instances such as Azure Database for MySQL still have some downtime that must be taken into consideration. Older versions of MySQL will trigger end-of-life (EOL) support. A plan should be developed to ensure that the possibility of upgrades will not take applications offline.  Consider using read only replicas that will maintain the application availability during these downtimes.  To support these types of architectures, the applications may need to be able to gracefully support the failover to read-only nodes when users attempt to perform write based activities.

### Checklist

- Perform backups regularly, ensure the backup frequency meets requirements.
- Setup read replicas for read intensive workloads and regional failover.
- Use resource locks to prevent accidental deletions.
- Create resource locks on resource groups.
- Implement a load balancing strategy for applications for quick failover.
- Be aware that service outages will occur and plan appropriately.
- Develop a scheduled maintenance plan and setup maintenance notifications.
- Develop a database version upgrade plan. 
