# Troubleshooting

Inevitably, as you operate Flexible Server, you will encounter issues with your applications. This section details a few common troubleshooting steps.

## Common MySQL issues

### Network connectivity issues

- By default, Flexible Server only supports encrypted connections through the TLS 1.2 protocol; clients using TLS 1.0 or 1.1 will be unable to connect. If you are unable to change the TLS protocol used by your application, then [change the Flexible Server instance's supported TLS versions.](https://docs.microsoft.com/azure/mysql/flexible-server/how-to-connect-tls-ssl)

- If you are connecting to Flexible Server via public access, ensure that firewall ACLs permit access from the client.

- Ensure that corporate firewalls do not block outbound connections to port 3306.

- Use a fully qualified domain name instead of an IP address in connection strings.

### Resource issues

- If your application experiences transient connectivity issues, perhaps the resources of the Flexible Server instance are constrained. Monitor resource usage and determine whether the Flexible Server instance needs to be scaled up.

### Platform issues

- On occasion, Azure experiences outages. Use [Azure Service Health](https://azure.microsoft.com/features/service-health/) to determine if an Azure outage impacts your MySQL workloads.

- Azure's periodic updates impact the availability of your applications. Flexible Server allows administrators [to set custom maintenance schedules.](https://docs.microsoft.com/azure/mysql/flexible-server/concepts-maintenance)

## Troubleshoot app issues in Azure App Service

- **Enable web logging.** Azure provides built-in diagnostics to assist with [debugging an App Service app](https://docs.microsoft.com/en-us/azure/app-service/troubleshoot-diagnostic-logs).
- Network requests taking a long time? [Troubleshoot slow app performance issues in Azure App Service](https://docs.microsoft.com/en-us/azure/app-service/troubleshoot-performance-degradation)
- In Azure App Service, certain settings are available to the deployment or runtime environment as environment variables. Some of these settings can be customized when you set them manually as app settings.
[Environment variables and app settings in Azure App Service](https://docs.microsoft.com/azure/app-service/reference-app-settings?tabs=kudu%2Cdotnet)

- [Azure App Service on Linux FAQ](https://docs.microsoft.com/azure/app-service/faq-app-service-linux)

## General issue mitigation

Generally, all cloud applications should include connection [retry logic](https://docs.microsoft.com/azure/architecture/patterns/retry), which typically responds to transient issues by initiating subsequent connections after a delay.

If you still encounter issues with Flexible Server, [send a support request from the Azure portal.](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade/overview)

### Other resources

[Azure Community Support](https://azure.microsoft.com/support/community/) Ask questions, get answers, and connect with Microsoft engineers and Azure community experts
