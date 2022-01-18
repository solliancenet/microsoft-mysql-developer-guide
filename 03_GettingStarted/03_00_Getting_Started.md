# Setup and Tools

[Azure Database for MySQL Deployment Modes]

## Azure Free Account

As described in the [Why Move to Azure document](../02_IntroToMySQL/02_01_Why_Move_To_Azure.md), Azure offers a $200 free credit for developers to trial Azure. Enroll today to explore MySQL offerings on Azure.

## Azure Subscriptions and Limits

As explained in the [Introduction to Azure document](../02_IntroToMySQL/02_02_Introduction_to_Azure.md), subscriptions are a critical component of the Azure hierarchy: resources cannot be provisioned without an Azure subscription.

A set of initial limits applies to all Azure subscriptions. However, the limits for some Azure services can be raised, assuming that the Azure subscription is not a free trial. Organizations can raise these limits using customer support.

Since most Azure services are provisioned in regions, some limits apply at the region level. Developers must consider both global and regional subscription limits when developing apps.

Consult [Azure's comprehensive list of service and subscription limits](https://docs.microsoft.com/azure/azure-resource-manager/management/azure-subscription-service-limits) for more details.

## Azure Authentication

As mentioned previously, Azure PaaS MySQL consists of a data plane (data storage and data manipulation) and a control plane (management of the Azure resource). Authentication is also separated between the control plane and the data plane.

In the control plane, Azure Active Directory authenticates users and determines whether users are authorized to perform an operation against an Azure resource. Review Azure RBAC in the [Introduction to Azure document](../02_IntroToMySQL/02_02_Introduction_to_Azure.md) for more information.

In the data plane, the built-in MySQL account management system governs access for administrator and non-administrator users. Moreover, Single Server supports security principals in Azure Active Directory, like users and groups, for data-plane access management. Using AAD data-plane access management allows organizations to enforce credential policies, specify authentication modes, and more.

> Learn how to configure Azure Active Directory authentication for Azure PaaS MySQL Single Server from the [Microsoft docs.](https://docs.microsoft.com/azure/mysql/concepts-azure-ad-authentication)

## Creating Landing Zones

The term *landing zone* refers to an Azure environment that supports application migration and modernization by facilitating scalability, security, governance, and more. Resources can be deployed to an Azure environment through the following tools.

### Visual Studio Code

Visual Studio Code is an open-source, cross-platform text editor. It offers useful utilities for various languages through extensions. Download Visual Studio Code from the [Microsoft download page.](https://code.visualstudio.com/download)

There is a [MySQL](https://marketplace.visualstudio.com/items?itemName=formulahendry.vscode-mysql) extension that allows developers to organize their database connections, administer databases, and query databases. Consider adding it to your Visual Studio Code workflow for MySQL.
