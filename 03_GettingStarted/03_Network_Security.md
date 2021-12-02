# Network Security

As mentioned previously, network configuration affects security, application performance (latency), and compliance. This guide explains the fundamentals of PaaS MySQL networking.

## Public vs. Private Access

### Public Access

Public access allows hosts, including Azure services, to access the PaaS MySQL instance via the public internet. Firewall ACLs limit access to hosts that fall within the allowed IP address ranges. They are set at the server-level, meaning that they govern network access to all databases on the instance. While it is best practice to create rules that allow specific IP addresses or ranges to access the instance, developers can enable network access from all Azure public IP addresses. This is useful for Azure services without fixed public IP addresses, such as [Azure Functions](https://docs.microsoft.com/azure/azure-functions/functions-overview) that use public access.

> Restricting access to Azure public IP addresses still provides network access to the instance to public IPs owned by other Azure customers.

**Configuring Public Access Guides**

- Single Server
  - [Azure portal](https://docs.microsoft.com/azure/mysql/howto-manage-firewall-using-portal)
  - [Azure CLI](https://docs.microsoft.com/azure/mysql/howto-manage-firewall-using-cli)
  - [ARM Reference for Firewall Rules](https://docs.microsoft.com/azure/templates/microsoft.dbformysql/servers/firewallrules?tabs=json)
- Flexible Server
  - [Azure portal](https://docs.microsoft.com/azure/mysql/flexible-server/how-to-manage-firewall-portal)
  - [Azure CLI](https://docs.microsoft.com/azure/mysql/flexible-server/how-to-manage-firewall-cli)
  - [ARM Reference for Firewall Rules](https://docs.microsoft.com/azure/templates/microsoft.dbformysql/flexibleservers/firewallrules?tabs=json)

### Private Access

With private access, only clients in the specified virtual network(s) can access the MySQL instance. Virtual networks utilize private IP addresses, and network traffic travels over Microsoft's high-bandwidth network infrastructure.

TODO - Clarify difference between service endpoints and private endpoints according to MS learn module: https://docs.microsoft.com/en-us/learn/modules/design-implement-private-access-to-azure-services/
