# Service Maintenance

Like any Azure service, Flexible Server receives patches and functionality upgrades from Microsoft. To ensure that planned maintenance does not blindside administrators, Azure provides them control over when patching occurs.

With Flexible Server, administrators can specify a custom **Day of week** and **Start time** for maintenance, or they can let the platform choose a day of week and time. If the maintenance schedule is chosen by the platform, maintenance will always occur between 11 PM and 7 AM in the region time zone.

> See [this](https://azure.microsoft.com/global-infrastructure/data-residency/#select-geography) list from Microsoft to determine the physical location of Azure regions and thus the regional time zone.

Azure always rolls out updates to servers with platform-managed schedules before instances with custom schedules. Platform-managed schedules allow developers to evaluate Flexible Server feature improvements in non-production environments. Moreover, maintenance events are relatively infrequent; there are typically 30 days of gap unless a critical security fix must be applied.

> As a general rule, only set a maintenance schedule for production instances.

## Notifications

In most cases, irrespective of whether you configure a platform-managed or custom maintenance schedule, Azure will notify you five days before a maintenance event. The exception is critical security fixes.

Use Azure Service Health to view upcoming infrastructure updates and set notifications. Refer to the links at the end of the document.

## Differences for Single Server

Single Server uses a gateway to access database instances, unlike Flexible Server. These gateways have public IP addresses that are retired and replaced, which may impede access from on-premises. Azure notifies customers about gateway retirements three months before. Learn more [here.](https://docs.microsoft.com/azure/mysql/concepts-connectivity-architecture)

Single Server does not support custom schedules for maintenance. Azure notifies administrators 72 hours before the maintenance event.

## Configure Maintenance Scheduling & Alerting

- [Manage scheduled maintenance settings using the Azure portal (Flexible Server)](https://docs.microsoft.com/azure/mysql/flexible-server/how-to-maintenance-portal)
- [View service health notifications in the Azure portal](https://docs.microsoft.com/azure/service-health/service-notifications)
- [Configure resource health alerts using Azure portal](https://docs.microsoft.com/azure/service-health/resource-health-alert-monitor-guide)
