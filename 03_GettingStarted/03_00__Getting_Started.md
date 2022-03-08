# Getting Started - Setup and Tools

With a firm understanding of MySQL and other offerings available in Azure, it is time to review how to start using these various services in applications. In this section, we explore how to get Azure subscriptions configured and ready to host MySQL applications as well as how to get started developing typical MySQL application types and the various tools to simplify their deployment.

## Azure free account

Azure offers a [$200 free credit for developers to trial Azure](azure.microsoft.com/free) or jump right into a Pay-as-you-go subscription. The free account includes credits for 750 compute hours of Azure Database for MySQL - Flexible Server. [Innovate faster with fully managed MySQL and an Azure free account.](https://docs.microsoft.com/azure/mysql/flexible-server/how-to-deploy-on-azure-free-account/)

## Azure subscriptions and limits

As explained in the [Introduction to Azure resource management], subscriptions are a critical component of the Azure hierarchy: resources cannot be provisioned without an Azure subscription, and although the cloud is highly scalable, it is not possible to provision an unlimited number of resources. A set of initial limits applies to all Azure subscriptions. However, the limits for some Azure services can be raised, assuming that the Azure subscription is not a free trial. Organizations can raise these limits by submitting support tickets through the Azure Portal. Limit increase requests help tell Microsoft capacity planning teams to understand if they need to provide more capacity when needed.

Since most Azure services are provisioned in regions, some limits apply at the regional level. Developers must consider both global and regional subscription limits when developing and deploying applications.

Consult [Azure's comprehensive list of service and subscription limits](https://docs.microsoft.com/azure/azure-resource-manager/management/azure-subscription-service-limits) for more details.

## Azure authentication

As mentioned previously, Azure Database for MySQL consists of a data plane (data storage and data manipulation) and a control plane (management of the Azure resource). Authentication is also separated between the control plane and the data plane.

In the control plane, Azure Active Directory authenticates users and determines whether users are authorized to operate against an Azure resource. Review Azure RBAC in the [Introduction to Azure resource management] section for more information.

In the data plane, the built-in MySQL account management system governs access for administrator and non-administrator users. Moreover, Single Server supports security principals in Azure Active Directory, like users and groups, for data-plane access management. Using AAD data-plane access management allows organizations to enforce credential policies, specify authentication modes, and more. Refer to the [Microsoft docs](https://docs.microsoft.com/azure/mysql/concepts-azure-ad-authentication) for more information.

## Development editor tools

Developers have a wide variety of code editor tools to choose from to complete their IT projects. Commercial organizations and OSS communities have produced tools and plug-ins making Azure application development efficient and rapid. A very popular tool is Visual Studio Code (VS Code). VS Code is an open-source, cross-platform text editor. It offers useful utilities for various languages through extensions. Download VS Code from the [Microsoft download page.](https://code.visualstudio.com/download)

TODO: Image of VS Code.

There is a [MySQL](https://marketplace.visualstudio.com/items?itemName=formulahendry.vscode-mysql) extension that allows developers to organize their database connections, administer databases, and query databases. Consider adding it to Visual Studio Code envrionment to make working with MySQL instances more efficient.

## Development languages

Once an editor has been selected, the next step is to pick a development language or platform. Below are some quick links:

[PHP language support]

[Java language support]

[Python language support]

[Other notable languages for MySQL apps]

## Resources

- [App Service overview](https://docs.microsoft.com/azure/app-service/overview)

- [Azure App Service plan overview](https://docs.microsoft.com/azure/app-service/overview-hosting-plans)
  
- [Plan and manage costs for Azure App Service](https://docs.microsoft.com/azure/app-service/overview-manage-costs)