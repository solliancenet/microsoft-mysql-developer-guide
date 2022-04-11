## 05 / Summary

Monitoring the performance of your environment is a vital final step after deployment.  This section described the various tools Microsoft Azure provides to do exactly that such as Azure Monitor and Log Analytics.

Both the control and data plane should be considered in your monitoring activities with alerting setup to notify platform administrators and database administrators of issues before or when they start to happen.

With cloud-based systems, being proactive is a better strategy then being reactive.

### Checklist

- Define a monitoring strategy to provide useful insights without deteriorating application performance and incurring excessive costs
  - For example, storing slow query logs on Flexible Server instances without proper management consumes storage space, affecting database performance
- Configure your Azure resources to emit strategic logs (like MySQL Flexible Server slow query logs) and route them to Azure destinations, like Log Analytics workspaces
- Develop KQL queries to record and visualize database performance, query performance, and DDL/DML activity
- If necessary, configure alert rules for metrics and logs
  - Azure can automatically respond to fired alerts through Azure Automation runbooks
