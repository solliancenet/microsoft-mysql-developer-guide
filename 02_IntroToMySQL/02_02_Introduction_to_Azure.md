# Introduction to Azure

Now that you understand why millions of users choose Azure, and the basic databases deployment models on the cloud (IaaS vs. PaaS), this document will provide more theory about how developers interact with Azure.

The image below from the [Azure Fundamentals Microsoft Learn Module](https://docs.microsoft.com/learn/modules/intro-to-azure-fundamentals/) demonstrates how IaaS and PaaS can be used to classify Azure services. Moreover, Azure empowers flexible *hybrid cloud* deployments and supports a variety of common tools, such as Visual Studio and the Azure CLI, to manage Azure environments.

![This image shows the classification of Azure services into IaaS and PaaS categories.](./media/azure-services.png "Categories of Azure services")

Here is a summary of the Azure services used in the whitepaper scenario besides the managed MySQL offerings described previously. 

- **Virtual Machines (IaaS)**: You will begin by running a PHP sample application on an Azure Windows Server Virtual Machine. 
- **Azure App Service (PaaS)**: You will deploy the PHP application to Azure App Service, a flexible, simple-to-use application hosting service.
- **Azure Container Instances (PaaS)**: You will *containerize* your app to operate in an environment isolated from other development tools installed on your system. Azure Container Instances provides a managed environment to operate containers.
- **Azure Kubernetes Service (PaaS)**: AKS also hosts containerized apps, but it is optimized for more advanced orchestration scenarios, such as high availability. It is operated on top of Azure VMs.

This list is not comprehensive; for a more comprehensive view, consult the [Azure Fundamentals Microsoft Learn](https://docs.microsoft.com/learn/modules/intro-to-azure-fundamentals/tour-of-azure-services) module.

## The Azure Management Hierarchy

Azure provides a flexible resource hierarchy to simplify cost management and security. This hierarchy consists of four levels:

- **Management groups**: Management groups consolidate multiple Azure subscriptions for compliance and security for multiple subscriptions.
- **Subscriptions**: Subscriptions govern cost control and access management. Azure users cannot provision Azure resources without a subscription.
- **Resource groups**: Resource groups consolidate the individual Azure resources for a given deployment. All provisioned Azure resources belong to one resource group. In this whitepaper, you will provision a *resource group* in your *subscription* to hold the required resources.
- **Resources**: An Azure resource is an instance of a service. An Azure resource belongs to one resource group located in one subscription.

![This image shows Azure resource scopes.](./media/scope-levels.png "Azure resource scopes")

The *Azure Resource Manager* governs interaction with Azure resources. All Azure management tools, including the CLI, PowerShell module, REST API, and browser-based Portal interact with the Azure Resource Manager. Observe that security is built into Azure Resource Manager.

![This image demonstrates how the Azure Resource Manager provides a robust, secure interface to Azure resources.](media/consistent-management-layer.png "Azure Resource Manager explained")

After users or services authenticate with Azure, *role-based access control* (RBAC), built on the Azure Resource Manager, dictates whether they are authorized to access or modify a resource, or whether they are authorized to give other users and services access to that resource. RBAC consists of three parts:

- A *role definition* describes a set of actions that can be performed. It can be broad or granular.
- A *security principal* represents a user, a group of users, or a service. 
- *Scope* dictates at what level a role assignment to a security principal is assigned.

### Other Tips

To develop an effective hierarchy, administrators must consult with cloud architects and financial and security personnel. Here are a few other best practices to follow for Azure deployments.

- **Adopt a naming convention:** Names in Azure should include business details, such as the organization department, and operational details for IT personnel, like workload.
- **Adopt other Azure governance tools:** Azure provides mechanisms such as [resource tags](https://docs.microsoft.com/azure/azure-resource-manager/management/tag-resources?tabs=json) and [resource locks](https://docs.microsoft.com/azure/azure-resource-manager/management/lock-resources?tabs=json) to facilitate automation, cost management, and security.

## Resources to guide an Azure Deployment

### Support

Azure provides [multiple support plans for businesses](https://azure.microsoft.com/support/plans/), depending on their business continuity requirements. There is also a large user community:

- [StackOverflow Azure Tag Channel](https://stackoverflow.com/questions/tagged/azure)
- [@Azure on Twitter](https://twitter.com/azure)

### Training

- [Azure Certifications & Exams](https://docs.microsoft.com/learn/certifications/browse/?products=azure)
- [Microsoft Learn](https://docs.microsoft.com/learn/)
  - [Azure Fundamentals (AZ-900) Learning Path](https://docs.microsoft.com/learn/paths/az-900-describe-cloud-concepts/)