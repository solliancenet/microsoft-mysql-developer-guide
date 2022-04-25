## Application monitoring

Once an application has been deployed, it is important to start to monitor the uptime and performance as well as understand usage patterns.  [Application Insights](https://docs.microsoft.com/azure/azure-monitor/app/app-insights-overview) is a feature that provides extensible application performance management (APM) and monitoring for web-based applications.

Application insights monitoring is very flexible in that it supports a wide variety of platforms, including .NET, Node.js, Java, and Python as well as apps hosted on-premises or on any public cloud. Just about any application can take advantage of this powerful monitoring tool.

Using Application Insights:

- Install a small instrumentation package (SDK) in your app
- Or enable Application Insights by using the Application Insights agent in Azure.

![](media/application-insights-overview.png)

The instrumentation code directs telemetry data to an Application Insights resource by using a unique instrumentation key and URL.

Example steps to configure WordPress monitoring:

- Install Application Insights plugin from WordPress Plugins

- Create Application Insights

- Copy the Instrumentation Key from created Application Insights

- Then go to **Settings** and Application Insights inside WordPress, and add the key there.

- Access the website and look for details

> ![Tip](media/tip.png "Tip") **Tip**: [Connection Strings](https://docs.microsoft.com/azure/azure-monitor/app/sdk-connection-string?tabs=net) are recommended over instrumentation keys.

### Azure Metrics Explorer

[Azure Metrics Explorer](https://docs.microsoft.com/azure/azure-monitor/essentials/metrics-getting-started) makes it easy to capture performance counters for resources quickly without having to add instrumentation to your application code. As the following diagram shows, you simply select the resource and metric and then apply your filters:

![](media/azure-metrics-workflow.png)

For example, if we wanted to capture performance counters for a PHP App Service resource, there are some simple steps to follow.

- Determine your scope. Navigate to the App Service in the Azure Portal.
- In the **Monitoring** section, select the **Metrics** item.
- Select your time range.

  ![](media/azure-metric-time-range.png)

- Select your **Metric** from the dropdown.

  ![](media/mysql-guide-metric-counters.png)

- Select your chart choice for the chosen metric.

  ![](media/mysql-guide-request-count-metric.png)

- Create a rule by selecting **New alert rule**.
  
  ![](media/azure-metric-new-alert-rule.png)

### Application Insights cost management

Application Insights comes with a free allowance that tends to be relatively large enough to cover development and publishing an app for a small number of users. As a best practice, setting a limit can prevent more data than necessary from being processed and keep costs low. 

Larger volumes of telemetry are charged by the gigabyte and should be monitored closely to ensure your finance department does not get a larger than expected Azure invoice. [Manage usage and costs for Application Insights](https://docs.microsoft.com/azure/azure-monitor/app/pricing)
