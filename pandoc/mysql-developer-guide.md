# Azure MySQL Developer Guide

Welcome to THE comprehensive guide to developing [MySQL] based
applications on [Microsoft Azure]! Whether you are creating your first
production application or improving an existing enterprise system, this
guide will take you through the basic fundamentals of MySQL all the way
to advanced architecture and design. From beginning to end, it is a
content journey designed to help ensure your current or future MySQL
systems are performing at their best even as its usage grows.

![The diagram shows the progression of development evolution in the
guide.]

The topics and flow contained in this guide cover the advantages of
migrating to or leveraging various simple to use, valuable Azure cloud
services in your architectures. Learn how easy and quick it is to create
applications backed by [Azure Database for MySQL]. In addition to
building your own services, you can also leverage the vast amount of
value-add services available in the [Azure Marketplace]. Throughout your
developer journey, strive to leverage the vast number of resources
presented rather than going at it on your own!

Because every company and project is unique, this guide provides
insightful service descriptions and tool comparisons to allow the reader
to make choices that fit their environment, system, and budget needs.
Proven industry architecture examples provide best practice jumpstarts
allowing for solid architecture foundations and addressing potential
compliance needs.

Development teams will understand the best architecture and security
practices -- avoiding the problems and costs of poor design. They will
gain the knowledge to automate builds, package, test, and deliver
applications to desired environments. By leveraging continuous
deployment and integration, costs related to manual deployment tasks can
be reduced or completely removed.

Building and deploying an application are not the final steps in the
application lifecycle. This guide will cover how easy it is to monitor
system uptime and performance in your various Azure services.
Administrators will appreciate the realistic and straightforward
troubleshooting tips that help keep downtime to a minimum and users
happy.

The ultimate goal for you is to successfully deploy a stable, performant
MySQL application running securely in Microsoft Azure using cloud best
practices. Let's start the journey!

# Introduction and common use cases for MySQL

MySQL is a relational database management system based on [SQL --
Structured Query Language]. MySQL supports a rich set of SQL query
capabilities and offers excellent performance through storage engines
optimized for transactional and non-transactional workloads, in-memory
processing, and robust server configuration through modules. Its low
total cost of ownership makes it extremely popular with many
organizations. Customers can use their existing frameworks and languages
to connect easily with a MySQL database. Consult the [MySQL
Documentation] for a more in-depth review of MySQL's features.

One of the most common use cases for MySQL databases is web applications
that need data persistence. Due to MySQL's scalability, popular content
management systems, such as [WordPress] and [Drupal] utilize it for
their data persistence. More broadly, [LAMP] apps, which integrate
Linux, Apache, MySQL, and PHP, leverage scalable web servers, languages,
and database engines to serve a large set of global web services.

## Comparison with Other RDBMS offerings

Though MySQL has a distinct set of advantages, it does compete with
other common relational database offerings. Though the emphasis of this
guide is operating MySQL on Azure to architect scalable applications, it
is important to be aware of other potential offerings such as [MariaDB].
MariaDB is a fork from the original MySQL code base when [Oracle
purchased Sun Microsystems].

While MariaDB is compatible with the MySQL protocol, the project is not
managed by Oracle, and its maintainers claim that this allows them to
better compete with other proprietary databases. Although you have
several options to choose from, MySQL has over twenty years of
development experience backing it, and businesses appreciate the
platform's maturity.

Another popular open-source MySQL competitor is [PostgreSQL]. MySQL
supports many of the advanced features of PostgreSQL, such as JSON
storage, replication and failover, and partitioning, in an easy-to-use
manner. Microsoft offers cloud-hosted [Azure Database for PostgreSQL],
which you can compare with cloud-hosted MySQL [in Microsoft Learn.]

## Infrastructure deployment models

MySQL has multiple deployment options for development and production
environments alike.

### On-premises

MySQL is a cross-platform offering, and corporations can utilize their
on-premises hardware to deploy highly-available MySQL configurations.
MySQL on-premises deployments are highly configurable, but they require
significant upfront hardware capital expenditure and have the
disadvantages of hardware/OS maintenance.

One benefit to choosing a cloud hosted environment is there are no large
upfront costs. You have the option to pay monthly subscription fees as
you go or to commit to certain usage level for discounts. Maintenance,
up-to-date software, security and support all fall into the
responsibility of the cloud provider so IT staff are not required to
utilize precious time troubleshooting hardware or software issues.

### Cloud IaaS (in a VM)

Migrating your organization's infrastructure to an IaaS solution helps
you reduce maintenance of on-premises data centers, save money on
hardware costs, and gain real-time business insights. IaaS solutions
give you the flexibility to scale your IT resources up and down with
demand. They also help you quickly provision new applications and
increase the reliability of your underlying infrastructure.

IaaS lets you bypass the cost and complexity of buying and managing
physical servers and datacenter infrastructure. Each resource is offered
as a separate service component, and you only pay for a particular
resource for as long as you need it. A cloud computing service provider
like Azure manages the infrastructure, while you purchase, install,
configure, and manage your own software---including operating systems,
middleware, and applications.

### Containers

While much more lightweight, containers are similar to VMs, and you can
start and stop them in a few seconds. Containers also offer tremendous
portability, which makes them ideal for developing an application
locally on your machine and then hosting it in the cloud, in test, and
later in production. You can even run containers on-premises or in other
clouds. This is possible because the environment that you use on your
development machine travels with your container, so your application
always runs in the same way. Containerized applications are flexible,
cost-effective, and deploy quickly.

MySQL offers a [Docker image] to operate MySQL in containerized
applications. Containerized MySQL can persist data to the machine with
the Docker runtime, and it can even operate from an existing MySQL data
directory.

### Cloud PaaS

MySQL databases can be deployed on public cloud platforms by utilizing
VMs or Kubernetes. However, these platforms offer their own managed
MySQL products, such as Amazon RDS for MySQL and Google Cloud SQL for
MySQL.

# Introduction to Azure and hosting options

Now that you understand the benefits of MySQL and a few common
deployment models, this section explains approaches to hosting MySQL on
Azure and the advantages of the Azure platform.

## Advantages of choosing Azure

The Azure platform is trusted by millions of customers around the world,
and there are over 90,000 Cloud Solution Providers partnered with
Microsoft to add extra benefits and services to the Azure platform. By
leveraging Azure, organizations can easily modernize their applications,
expedite application development, and adapt application requirements to
meet the demands of their users.

By offering solutions on Azure, ISVs can access one of the largest B2B
markets in the world. Through the [Azure Partner Builder's Program],
Microsoft assists ISVs with the tools and platform to offer their
solutions for customers to evaluate, purchase, and deploy with just a
few clicks of the mouse.

Microsofts's development suite includes such tools as the various
[Visual Studio] products, [Azure DevOps], [GitHub], and low-code [Power
Apps]. All of these have contributed to Azure's success and growth
through their tight integrations with the Azure platform. Companies that
adopt capable, modern tools are 65% more innovative, according to a
[2020 McKinsey & Company report.]

TODO: Find image without black background.

![This image demonstrates common development tools on the Microsoft
cloud platform to expedite application development.]

To facilitate developers' adoption of Azure, Microsoft offers a [free
subscription] with \$200 credit, applicable for thirty days; year long
access to free quotas for popular services, including Azure Database for
MySQL; and access to always free Azure service tiers. Create an Azure
free account and get 750 hours of Azure Database for MySQL Flexible
Server free.

## MySQL on Azure Hosting Options

The concepts IaaS (Infrastructure as a Service) and PaaS (Platform as a
Service) describe the responsibilities of the public cloud provider and
the enterprise customer to manage their data. Both approaches are common
to host MySQL on Azure.

![Diagram shows the cloud adoption strategy.]

### IaaS

In the IaaS model, organizations deploy MySQL on Azure Virtual Machines.
This provides the customer with the flexibility to choose when to patch
the VM OS, the MySQL engine, and install other software such as
antivirus utilities when required. Microsoft is responsible for the
underlying VM hardware that constitutes the Azure infrastructure.
Customers are responsible for all other maintenance.

Because IaaS MySQL hosting gives greater control over the MySQL database
engine and the OS, many organizations choose it to lift and shift
on-premises solutions while minimizing capital expenditure.

### PaaS (DBaaS)

In the PaaS model, organizations deploy a fully managed MySQL
environment on Azure. Unlike IaaS, they cede control over patching the
MySQL engine and OS to the Azure platform, and Azure automates many
administrative tasks, like providing high availability, backups, and
protecting data.

Like IaaS, customers are still responsible for managing query
performance, database access, and database objects, such as indexes.
PaaS is suitable for applications where the MySQL configuration exposed
by Azure is sufficient and access to the OS and filesystem is
unnecessary.

The Azure DBaaS MySQL offering is [Azure Database for MySQL][16], which
is based on MySQL community edition and supports common administration
tools and programming languages.

### Video Reference

For a video comparison of cloud hosting models, please refer to
[Microsoft Learn.]

# Introduction to Azure resource management

With a firm understanding of why millions of organizations choose Azure,
and the database deployment models (IaaS vs. PaaS), the next step is to
provide more detail about **how** developers interact with Azure.

The [Azure Fundamentals Microsoft Learn Module] demonstrates how IaaS
and PaaS can classify Azure services. Moreover, Azure empowers flexible
*hybrid cloud* deployments and supports a variety of common tools, such
as Visual Studio, PowerShell and the Azure CLI, to manage Azure
environments.

![IaaS and PaaS Azure service classification and categories]

The following tables outlines some of the Azure services used in
application developer scenarios that will be discussed in further detail
in later sections of this guide.

-   **[Virtual Machines (IaaS)]**: You will begin by running a PHP
    sample application on an Azure Windows Server Virtual Machine.
-   **[Azure App Service (PaaS)]**: You will deploy the PHP application
    to Azure App Service, a flexible, simple-to-use application hosting
    service.
-   **[Azure Container Instances (PaaS)]**: You will *containerize* your
    app on the VM to operate in an environment isolated from other
    development tools installed on the system. Azure Container Instances
    provides a managed environment to operate containers.
-   **[Azure Kubernetes Service (PaaS)]**: AKS also hosts containerized
    apps, but it is optimized for more advanced orchestration scenarios,
    such as high availability.

For a more comprehensive view, consult the [Azure Fundamentals Microsoft
Learn] module.

## The Azure Resource Management Hierarchy

Azure provides a flexible resource hierarchy to simplify cost management
and security. This hierarchy consists of four levels:

-   **[Management groups]**: Management groups consolidate multiple
    Azure subscriptions for compliance and security purposes.
-   **Subscriptions**: Subscriptions govern cost control and access
    management. Azure users cannot provision Azure resources without a
    subscription.
-   **[Resource groups]**: Resource groups consolidate the individual
    Azure resources for a given deployment. All provisioned Azure
    resources belong to one resource group. In this whitepaper, you will
    provision a *resource group* in your *subscription* to hold the
    required resources.
    -   Resource groups have a geographic location that determines where
        metadata about that resource group is stored
-   **Resources**: An Azure resource is an instance of a service. An
    Azure resource belongs to one resource group located in one
    subscription.
    -   Most Azure resources are provisioned in a particular region

    ![This image shows Azure resource scopes.]

## Create your Landing zone

An [Azure Landing zone] is the target environment defined as the final
resting place of a cloud migration project. In most projects, the
landing zone should be scripted via ARM templates for its initial setup.
Finally, it should be customized with PowerShell or the Azure portal to
fit the workloads needs.

## Automating and managing with Azure services

When it comes to managing Azure resources, you have many potential
options. [Azure Resource Manager] is the deployment and management
service for Azure. It provides a management layer that enables you to
create, update, and delete resources in your Azure subscriptions. You
use management features, like access control, locks, and tags, to secure
and organize your resources after deployment.

All Azure management tools, including the [Azure CLI][17], [Azure
PowerShell] module, [Azure REST API], and browser-based Portal, interact
with the Azure Resource Manager layer and as such the [Identity and
access management (IAM)] security controls.

![This image demonstrates how the Azure Resource Manager provides a
robust, secure interface to Azure resources.]

Access control to all Azure services is offered via the [Azure
role-based access control (Azure
RBAC)][Identity and access management (IAM)] natively built into the
management platform. Azure RBAC is a system that provides fine-grained
access management of Azure resources. Using Azure RBAC, you can
segregate duties within your team and grant only the amount of access to
users that they need to perform their jobs.

## Azure Management Tools

The flexibility and variety of Azure's management tools make it
intuitive for any user, irrespective of their skill level with certain
technologies. As your skill level and administration needs mature, Azure
has the right tool to match your needs.

![Azure service management tool maturity progression.]

### Azure Portal

When you are just starting, the **Azure portal** gives developers a
quick view of the state of their Azure resources. It supports extensive
user configuration and simplifies custom reporting. The **[Azure mobile
app]** provides similar features for mobile users.

![The picture shows the some of the initial Azure service list.]

Azure runs on a common framework of backend resource services and every
action you take on the Azure portal translates into a backend set of
APIs developed by the respective engineering team to read, create,
modify, or delete resources.

Moving your workload to Azure lifts some of the administrative burden
but not all, even though you don't have to worry about the data center,
you are still responsible for how you have configured those services and
the access your teams have to those resources.

By using the existing command-line tools and REST based APIs, you can
build your own tools to automate and report on your configurations based
on any organizational requirements that are required.

### Azure PowerShell and CLI

**Azure PowerShell** and the **Azure CLI** (for Bash shell users) are
useful for automating tasks that cannot be performed in the Azure
portal. Both of these tools follow an *imperative* approach, meaning
that users must explicitly script the creation of resources in the
correct order.

![Shows an example of the Azure CLI.]

Although very similar, you may find that there are some subtle
differences between how each of these tools operate and the actions that
can be accomplished. Use the [Azure command-line tool guide] to
determine which is the right tool for you.

It is possible to run the Azure CLI and Azure PowerShell from the [Azure
Cloud Shell] but it does have some limitations. You can also run these
tools locally.

To use the Azure CLI [download the CLI tools from Microsoft.].

To use the Azure PowerShell cmdlets, install the `Az` module from the
PowerShell Gallery, as described in the [installation document.]

### Infrastructure as Code

[Infrastructure as Code (Iac)] provides a way to describe or declare
what infrastructure looks like using descriptive code. The
infrastructure code is the desired state. Once the code runs, the
environment will be built. One of the main benefits of IaC it is human
readable. Once the environment code has been tested, it can be versioned
and saved into source code control.

**ARM templates**

[ARM templates] are able to deploy Azure resources in a *declarative*
manner. Azure Resource Manager can potentially create the resources in
an ARM template in parallel. ARM templates are useful to create multiple
identical environments, such as development, staging, and production
environments.

![The picture shows an example of an ARM template JSON export.]

**Bicep**

Reading, updating, and managing the ARM template JSON code can be
difficult for a reasonably sized environment. What if there was a tool
that translates simple declarative statements into ARM templates? Better
yet, what if there was a tool that took existing ARM templates and
translated them into a simple configuration? [Bicep] is a
domain-specific language (DSL) that uses declarative syntax to deploy
Azure resources. In a Bicep file, you define the infrastructure you want
to deploy to Azure, and then use that file throughout the development
lifecycle to repeatedly deploy your infrastructure. Your resources are
deployed in a consistent manner. Some of the benefits include:

-   **Support for all resource types and API versions**: Bicep
    immediately supports all preview and GA versions for Azure services.
    As soon as a resource provider introduces new resources types and
    API versions, you can use them in your Bicep file. You don't have to
    wait for tools to be updated before using the new services.
-   **Simple syntax**: When compared to the equivalent JSON template,
    Bicep files are more concise and easier to read. Bicep requires no
    previous knowledge of programming languages. Bicep syntax is
    declarative and specifies which resources and resource properties
    you want to deploy.
-   **Authoring experience**: When you use VS Code to create your Bicep
    files, you get a first-class authoring experience. The editor
    provides rich type-safety, intellisense, and syntax validation.
-   **Modularity**: You can break your Bicep code into manageable parts
    by using modules. The module deploys a set of related resources.
    Modules enable you to reuse code and simplify development. Add the
    module to a Bicep file anytime you need to deploy those resources.
-   **No state or state files to manage**: All state is stored in Azure.
    Users can collaborate and have confidence their updates are handled
    as expected. Use the what-if operation to preview changes before
    deploying your template.
-   **No cost and open source**: Bicep is completely free. You don't
    have to pay for premium capabilities. It's also supported by
    Microsoft support.

**Terraform**

The benefits of IaC have been described in the paragraphs above.
Hashicorp Terraform is an open-source tool for provisioning and managing
cloud infrastructure. There are instances of multi-cloud deployment
requirements. [Terraform] is adept at deploying an infrastructure across
multiple cloud providers. It enables developers to use consistent
tooling to manage each infrastructure definition.

### Other Tips

To develop an effective organization hierarchy of resources, Azure
administrators should consult with cloud architects and financial and
security personnel. Here are a few common best practices to follow for
Azure deployments.

-   **Utilize Management Groups** Create at least three levels of
    management groups.
-   **Adopt a naming convention:** Names in Azure should include
    business details, such as the organization department, and
    operational details for IT personnel, like the workload.
-   **Adopt other Azure governance tools:** Azure provides mechanisms
    such as [resource tags] and [resource locks] to facilitate
    compliance, cost management, and security.

## Azure Deployment resources

### Support

Azure provides [multiple support plans for businesses], depending on
their business continuity requirements. There is also a large user
community:

-   [StackOverflow Azure Tag]
-   [@Azure on Twitter](https://twitter.com/azure)

### Training

-   [Azure Certifications & Exams]
-   [Microsoft Learn]
    -   [Azure Fundamentals (AZ-900) Learning Path]

# Introduction to Azure Database for MySQL deployment options

As mentioned previously, developers can deploy MySQL on Azure through
Virtual Machines (IaaS) or Azure Database for MySQL (PaaS). Though PaaS
offerings do not support direct management of the OS and the database
engine, they have built-in support for high availability, automating
backups, and meeting compliance requirements. Moreover, Azure Database
for MySQL supports MySQL Community Editions 5.6, 5.7, and 8.0, making it
flexible for most migrations. (TODO:Add link for MySQL Migration Guide)

For most use cases, Azure PaaS MySQL allows developers to focus on
application development and deployment, instead of OS and RDBMS
management, patching, and security.

As the image below demonstrates, Azure Resource Manager handles resource
configuration, meaning that standard Azure management tools, such as the
CLI, PowerShell, and ARM templates, are still applicable. This is
commonly referred to as the *control plane*.

For managing database objects and access controls at the server and
database levels, standard MySQL management tools, such as [MySQL
Workbench], still apply. This is known as the *data plane*.

![This image demonstrates the control plane for Azure PaaS MySQL.]

## Azure Database for MySQL Deployment Modes

Azure provides both *Single Server* and *Flexible Deployment* modes.
Below is a summary of these offerings. For a more comprehensive
comparison table, please consult the article [Choose the right MySQL
Server option in Azure].

### Single Server

Single Server is suitable when apps do not need extensive database
customization. Single Server will manage patching, offer high
availability, and manage backups on a predetermined schedule (though
developers can set the backup retention times between a week and 35
days). To reduce compute costs, developers can [pause the Single Server
offering]. Single server offers an [SLA of 99.99%].

> **Note:** Single servers are best suited for existing applications
> already leveraging single server. For all new developments or
> migrations, Flexible Server would be the recommended deployment
> option. For a refresher on how the SLAs of individual Azure services
> affect the SLA of the total deployment, review the associated
> [Microsoft Learn Module.]

### Flexible Server

Flexible Server is also a PaaS service fully managed by the Azure
platform, but it exposes more control to the user than single server.

Cost management is one of the major advantages of Flexible Server: it
supports a *burstable* tier, which is based on the B-series Azure VM
tier and is optimized for workloads that do not continually use the CPU.
Just like Single Server, [Flexible Server can also be paused]. The image
below shows how Flexible Server works for a non-high availability
arrangement.

> *Locally-redundant storage* replicates data within a single
> *availability zone*. *Availability zones* are present within a single
> Azure region (such as East US) and are geographically isolated. All
> Azure regions that support availability zones have at least three.

![This image demonstrates how MySQL Flexible Server works, with compute,
storage, and backup storage.]

#### Flexible Server Video Introduction

Watch [this video by Data Exposed] to learn more about Flexible Server's
advantages.

> [Data Exposed] touches on a wide range of Azure data content. It is a
> good resource for developers.

#### Flexible Server Pricing & TCO

The MySQL Flexible Server tiers offer a storage range between 20 GiB and
16 TiB and the same backup retention period range of 1-35 days. However,
they differ in core count and memory per vCore. Choosing a compute tier
affects the database IOPS and pricing.

-   **Burstable**: This tier corresponds to a B-series Azure VM.
    Instances provisioned in this tier have 1-2 vCores. It is ideal for
    applications that do not utilize the CPU consistently.
-   **General Purpose**: This tier corresponds to a Ddsv4-series Azure
    VM. Instances provisioned in this tier have 2-64 vCores and 4 GiB
    memory per vCore. It is ideal for most enterprise applications
    requiring a strong balance between memory and vCore count.
-   **Memory Optimized**: This tier corresponds to an Edsv4-series Azure
    VM. Instances provisioned in this tier have 2-64 vCores and 8 GiB
    memory per vCore. It is ideal for high-performance or real-time
    workloads that depend on in-memory processing.

To estimate the TCO for Azure Database for MySQL, use the [Azure Pricing
Calculator]. Note that you can also use the [Azure TCO Calculator] to
estimate the cost savings of deploying PaaS Azure MySQL over the same
deployment in an on-premises data center. Simply indicate your
on-premises hardware and the Azure landing zone, adjust calculation
parameters, like the cost of electricity, and observe the potential
savings.

#### Flexible Server Unsupported Features

Azure provides a [detailed list of the limitations of Flexible Server].
Here are a few notable ones.

-   Support for only the InnoDB and MEMORY storage engines; MyISAM is
    unsupported
-   The DBA role and the `SUPER` privilege are unsupported
-   `SELECT ... INTO OUTFILE` statements to write query results to files
    are unsupported, as the filesystem is not directly exposed by the
    service

**Single Server and Flexible Server Comparison Table**

The table below summarizes the concepts of this section. In the
following section, we will address each offering's features in-depth.

  -----------------------------------------------------------------------
  Use Case                Flexible Server         Single Server
  ----------------------- ----------------------- -----------------------
  Integration with PaaS   Supported               Supported
  services (e.g. Azure                            
  App Service, Azure                              
  Functions)                                      

  Secure networking       Supported               Supported through
                                                  private link

  MySQL Versions          5.7 & 8.0               5.6 (retired), 5.7, &
  (Community)                                     8.0

  Cost management through Supported               Supported
  pausing                                         

  Optimized for burstable Supported               Does not provide the
  workloads                                       same variety of compute
                                                  tiers

  Application use cases   New applications &      Applications that
                          migrations from         already utilize Single
                          on-premises             Server

  Control plane           Azure PowerShell, Azure Azure PowerShell, Azure
  management tools        CLI, ARM templates,     CLI, ARM templates,
                          Azure REST API, SDKs    Azure REST API, SDKs
                          for various languages   for various languages
  -----------------------------------------------------------------------

# Getting Started - Setup and Tools

With a firm understanding of Azure and MySQL offerings available to you,
it is time to review how to get setup to start using these various
services. In this section we will explore how to get your Azure
subscriptions configured and ready to host your MySQL applications as
well as how to get started developing typical MySQL application types
and the various tools to simplify their deployment.

[Introduction to Azure Database for MySQL deployment options]

## Azure Free Account

Azure offers a \$200 free credit for developers to trial Azure or jump
right into a Pay as you Go subscription. [Innovate faster with fully
managed MySQL and an Azure free account]

## Azure Subscriptions and Limits

As explained in the [Introduction to Azure resource management],
subscriptions are a critical component of the Azure hierarchy: resources
cannot be provisioned without an Azure subscription and although the
cloud is highly scalable, you cannot provision an unlimited number of
resources. A set of initial limits applies to all Azure subscriptions.
However, the limits for some Azure services can be raised, assuming that
the Azure subscription is not a free trial. Organizations can raise
these limits by submitting support tickets through the Azure Portal.
Limit increase requests help tell Microsoft capacity planning teams
understand if they need to provide more capacity when needed.

Since most Azure services are provisioned in regions, some limits apply
at the regional level. Developers must consider both global and regional
subscription limits when developing and deploying applications.

Consult [Azure's comprehensive list of service and subscription limits]
for more details.

## Azure Authentication

As mentioned previously, Azure PaaS MySQL consists of a data plane (data
storage and data manipulation) and a control plane (management of the
Azure resource). Authentication is also separated between the control
plane and the data plane.

In the control plane, Azure Active Directory authenticates users and
determines whether users are authorized to perform an operation against
an Azure resource. Review Azure RBAC in the [Introduction to Azure
resource management] for more information.

In the data plane, the built-in MySQL account management system governs
access for administrator and non-administrator users. Moreover, Single
Server supports security principals in Azure Active Directory, like
users and groups, for data-plane access management. Using AAD data-plane
access management allows organizations to enforce credential policies,
specify authentication modes, and more.

> Learn how to configure Azure Active Directory authentication for Azure
> PaaS MySQL Single Server from the [Microsoft docs.]

## Development editor tools

Developers have a wide variety of code editor tools to choose from to
complete their IT projects. Commercial organizations and OSS communities
have produced tools and plug-ins making Azure application development
efficient and rapid. A very popular tool is Visual Studio Code (VS
Code). VS Code is an open-source, cross-platform text editor. It offers
useful utilities for various languages through extensions. Download VS
Code from the [Microsoft download page.]

TODO: Image of VS Code.

There is a [MySQL][18] extension that allows developers to organize
their database connections, administer databases, and query databases.
Consider adding it to your Visual Studio Code workflow for MySQL.

## Development languages

Once you have determined your editor of choice, you will need to pick a
development language or platform. Below are some quick links:

[PHP language support][] \[Java language support\] [Python language
support][10] \[Other popular languages for MySQL Apps\] \# Connect and
Query PHP Language Support

This section describes tools to interact with Azure Database for MySQL
(Single Server and Flexible Server) through PHP.

## Example Code

Refer to the [Connect and Query sample for PHP] application for examples
of how to use PHP to connect to MySQL.

## Application Connectors

There are two major APIs to interact with MySQL in PHP:

-   *MySQLi*, *MySQLi* is an improvement over the earlier *MySQL* API,
    which does not meet the security needs of modern applications.
-   *PDO*, or *PHP Data Objects*, allows applications to access
    databases in PHP through abstractions, standardizing data access for
    different databases. PDO works with a database-specific driver, like
    *PDO_MYSQL*.

> **Note** *MySQLi* and *PDO* are wrappers over the *mysqlnd* or
> *libmysqlclient* C libraries: it is highly recommended to use
> *mysqlnd* as the default backend library due to its more advanced
> features. *mysqlnd* is the default backend provided with PHP.

Flexible Server and Single Server are compatible with all PHP client
utilities for MySQL Community Edition.

## Resources

1.  [Backend libraries for mysqli and PDO_MySQL]
2.  [Introduction to PDO]
3.  [PDO_MYSQL Reference] \# Java Language Support

This section describes tools to interact with Azure Database for MySQL
(Single Server and Flexible Server) through Java.

## Example Code

Refer to the [Connect and Query sample for Java], which uses IntelliJ,
Spring Boot, and Spring Data JPA.

## Application Connectors

*MySQL Connector/J* is a JDBC-compatible API that natively implements
the MySQL protocol in Java, rather than utilizing client libraries. The
Connect and Query sample does not directly utilize *MySQL Connector/J*,
but Microsoft provides a sample that uses this technology.

To allow developers to focus on implementing business logic,
applications commonly use persistence frameworks like Spring Data JPA.
Spring Data JPA extends the JPA specification, which governs
*object-relational mapping* (ORM) technologies in Java. It functions on
top of JPA implementations, like the Hibernate ORM. The Connect and
Query sample leverages Spring Data JPA and *MySQL Connector/J* to access
the Azure MySQL instance and expose data through a web API.

Flexible Server is compatible with all Java client utilities for MySQL
Community Edition. However, Microsoft has only validated *MySQL
Connector/J* for use with Single Server due to its network connectivity
setup. Refer to the[MySQL drivers and management tools compatible with
Azure Database for MySQL] article for more information about drivers
compatible with Single Server.

### Resources

1.  [MySQL Connector/J Introduction]
2.  MySQL Connector/J Microsoft Samples
    -   [Single Server]
    -   [Flexible Server]
3.  [Introduction to Spring Data JPA]
4.  [Hibernate ORM]

## Tooling

The Connect and Query sample leverages IntelliJ, which is one of the
most widely used Java IDEs. This section provides resources for other
common tools.

### Eclipse

Eclipse is another popular IDE for Java development. It supports
extensions for enterprise Java development, including powerful utilities
for Spring applications. Moreover, through the Azure Toolkit for
Eclipse, developers can quickly deploy their applications to Azure
directly from Eclipse.

**Tool-Specific Resources**

1.  [Installing the Azure Toolkit for Eclipse]
2.  [Create a Hello World web app for Azure App Service using Eclipse]

### Maven

Maven improves the productivity of Java developers by managing builds,
dependencies, releases, documentation, and more. Maven projects are
created from archetypes. Microsoft provides the Maven Plugins for Azure
to help Java developers work with Azure Functions, Azure App Service,
and Azure Spring Cloud from their Maven workflows.

> **Note**: Application patterns with Azure Functions, Azure App
> Service, and Azure Spring Cloud are addressed in the [End-to-End
> development story.]

**Tool-Specific Resources**

1.  [Maven Introduction]
2.  [Develop Java web app on Azure using Maven (App Service)]
3.  [Deploy Spring microservices to Azure (Spring Cloud)]
4.  [Develop Java serverless Functions on Azure using Maven]

# Python Language Support

This section describes tools to interact with Azure Database for MySQL
(Single Server and Flexible Server) through Python.

## Example Code

Refer to the [Connect and Query sample for Python.]

## Application Connectors

*MySQL Connector/Python* offers a Python Database API
specification-compatible driver for MySQL database access (PEP 249). It
does not depend on a MySQL client library. The Python Connect and Query
sample utilizes *MySQL Connector/Python*.

An alternative connector is *PyMySQL*. It is also PEP 249-compliant.

Django is a popular web application framework for Python. The Django ORM
officially supports MySQL through (1) the *mysqlclient* Python wrapper
for the native MySQL driver or (2) the *MySQL Connector/Python* API.
*mysqlclient* is recommended for use with the Django ORM.

Flexible Server is compatible with all Python client utilities for MySQL
Community Edition. However, Microsoft has only validated *MySQL
Connector/Python* and *PyMySQL* for use with Single Server due to its
network connectivity setup. Refer to
[this][MySQL drivers and management tools compatible with Azure Database for MySQL]
document for more information about drivers compatible with Single
Server.

## Resources

1.  [Introduction to MySQL Connector/Python]
2.  [PyMySQL Samples]
3.  [MySQLdb (mysqlclient) User's Guide]
4.  [Django ORM Support for MySQL]

# Other Notable Languages for MySQL Apps

Like the other language support guides, Flexible Server is compatible
with all MySQL clients that support MySQL Community Edition. Microsoft
provides a [curated list of compatible clients for MySQL Single
Server][MySQL drivers and management tools compatible with Azure Database for MySQL].

## .NET

.NET applications typically use ORMs to access databases and improve
portability: two of the most popular ORMs are Entity Framework (Core)
and Dapper.

Using MySQL with Entity Framework (Core) requires [MySQL Connector/NET],
which is compatible with Single Server. Learn more [from the MySQL
documentation] about support for Entity Framework (Core).

Microsoft has also validated that MySQL Single Server is compatible with
the [Async MySQL Connector for .NET]. This connector works with both
Dapper and Entity Framework (Core).

## Ruby

The [*Mysql2*] library, compatible with Single Server, provides MySQL
connectivity in Ruby by referencing C implementations of the MySQL
connector.

# Provision Flexible Server and Database

This section illustrates how to deploy MySQL Flexible Server using
various Azure management tools.

## Azure Portal

Azure provides a [quickstart document] for users who would like to use
the Azure portal to provision Flexible Server. While this is a great
opportunity to explore the configuration parameters of Flexible Server,
IaC approaches, like the imperative Azure CLI or the declarative ARM
template, are preferable to create deployments that can easily be
replicated in other environments.

## Azure CLI

The Azure CLI `az mysql flexible-server` set of commands is very robust.
[Azure's quickstart guide] demonstrates how the
`az mysql flexible-server create` and
`az mysql flexible-server db create` commands can automatically populate
server parameters. Note that it is possible to exercise greater control
over these commands by reviewing the documentation for the
[`flexible-server create`] and [`flexible-server db create`] commands.

> Running the CLI commands from [Azure Cloud Shell] is preferable, as
> the context is already authenticated with Azure.

The image below, from a successful CLI provisioning attempt for Flexible
Server, maps CLI flags to various Flexible Server parameters.

![This image demonstrates the MySQL Flexible Server provisioned through
Bash CLI commands.]

## ARM Template

Azure provides a [quickstart document][19] with a comprehensive ARM
template for a Flexible Server deployment. We have also provided a
[sample ARM template] that just requires the `serverName`,
`administratorLogin`, and `administratorLoginPassword` parameters to
deploy: the Azure sample template requires additional parameters to run.
It can be deployed with the `New-AzResourceGroupDeployment` PowerShell
command in the quickstart or the `az deployment group create` CLI
command.

# Connect and Query Azure Database for MySQL using MySQL Workbench

This section explains how to perform queries against Azure Database for
MySQL Flexible Server using MySQL Workbench, a UI-based management tool.

## Setup

Follow one of the methods in the [Provision MySQL Flexible Server]
document to create a Flexible Server instance with a database.

Download MySQL Workbench from the [MySQL Downloads.] This document was
written using version 8.0.26: we recommend this version because Single
Server is not compatible with 8.0.27, so 8.0.26 has the greatest
flexibility.

## Instructions

Explore the [Use MySQL Workbench with Azure Database for MySQL Flexible
Server] article to perform the following activities:

    - Create a new database in the Flexible Server instance
    - Create, query and update data in a table (`inventory`)
    - Delete records from the table

Note that MySQL Workbench can automatically initiate an SSL-secured
connection to Azure Database for MySQL. However, it is recommended to
use the [SSL public certificate] in your connections. To bind the SSL
public certificate to MySQL Workbench, choose the downloaded certificate
file as the **SSL CA File** on the **SSL** tab.

![Add the SSL CA file on the SSL tab of the Setup New Connection dialog
box.]

# Connect and Query Azure Database for MySQL Using the Azure CLI

This section explains how to perform queries against Azure Database for
MySQL Flexible Server using the Azure CLI and the
`az mysql flexible-server` utilities and references the steps in the
[Quickstart: Connect and query with Azure CLI with Azure Database for
MySQL - Flexible Server] article.

## Setup

While the Azure article demonstrates how to provision a Flexible Server
instance using the CLI, you can utilize any of the provisioning methods
in the [Provision MySQL Flexible Server][20] section.

## Instructions

The Azure CLI supports running queries interactively, via the
`az mysql flexible-server connect` command, which is similar to running
queries interactively against a MySQL instance through the MySQL CLI. It
is also possible to run an individual SQL query or a SQL file using the
`az mysql flexible-server execute` command.

Note that these commands require the `rdbms-connect` CLI extension,
which is automatically installed if it is not present. If you encounter
permissions errors from the Azure Cloud Shell, execute the commands from
a local installation of the Azure CLI.

In addition to the queries in the document, you can run basic admin
queries. The statements below create a new user `analyst` that can read
data from all tables in `newdatabase`.

``` sql
USE newdatabase;
CREATE USER 'analyst'@'%' IDENTIFIED BY '[SECURE PASSWORD]';
GRANT SELECT ON newdatabase.* TO 'analyst'@'%';
FLUSH PRIVILEGES;
```

The new `analyst` user can also connect to `newdatabase` in the Flexible
Server instance. The new user can only query tables in `newdatabase`.

![This image demonstrates running queries against the Flexible Server
instance using the Azure CLI.]

> For more details on creating databases and users in Single Server and
> Flexible Server, consult [this document.] Note that it uses the
> `mysql` CLI.

# PHP Language Support

This section demonstrates how to manipulate data in an Azure Database
for MySQL Flexible Server instance and query it using PHP and the
*MySQLi* library, which is provided with PHP.

## Setup

Follow one of the methods in the [Provision MySQL Flexible Server]
document to create a Flexible Server instance with a database.

Moreover, install PHP on your system from the [downloads page.] These
instructions were tested with PHP 8.0.13 (any PHP 8.0 version should
work).

> Your `php.ini` file needs to uncomment the `extension=mysqli` and
> `extension=openssl` lines for these steps to work.

A text editor such as Visual Studio Code may also be useful.

Lastly, download the [connection certificate][SSL public certificate]
that is used for SSL connections with the MySQL Flexible Server
instance. In these snippets, the certificate was saved to `C:\Tools` on
Windows. Adjust this if necessary.

## Instructions

Microsoft's [quickstart guide] performs standard CRUD operations against
the MySQL instance from a console app. This document modifies the code
segments from the guide to provide an encrypted connection to the
Flexible Server instance.

The first code snippet creates a table called `Products` with four
columns, including a primary key. Adjust the `host`, `username` (most
likely `sqlroot`), `password`, and `db_name` (most likely `newdatabase`)
parameters to the values you used during provisioning. Moreover, adjust
the certificate path in the `mysqli_ssl_set()` method.

``` php
<?php
$host = '[SERVER NAME].mysql.database.azure.com';
$username = 'sqlroot';
$password = '[PASSWORD]';
$db_name = 'newdatabase';

//Establishes the connection
$conn = mysqli_init();
mysqli_ssl_set($conn, NULL, NULL, "C:\Tools\DigiCertGlobalRootCA.crt.pem", NULL, NULL);
mysqli_real_connect($conn, $host, $username, $password, $db_name, 3306, MYSQLI_CLIENT_SSL);
if (mysqli_connect_errno()) {
die('Failed to connect to MySQL: '.mysqli_connect_error());
}

// Run the create table query
if (mysqli_query($conn, '
CREATE TABLE Products (
`Id` INT NOT NULL AUTO_INCREMENT ,
`ProductName` VARCHAR(200) NOT NULL ,
`Color` VARCHAR(50) NOT NULL ,
`Price` DOUBLE NOT NULL ,
PRIMARY KEY (`Id`)
);
')) {
printf("Table created\n");
}

//Close the connection
mysqli_close($conn);
?>
```

You should see a console output with the message `Table created`.

The second code snippet uses the same logic to start an SSL-secured
connection and to close the connection. This time, it leverages a
prepared insert statement with bound parameters.

``` php
<?php
$host = '[SERVER NAME].mysql.database.azure.com';
$username = 'sqlroot';
$password = '[PASSWORD]';
$db_name = 'newdatabase';

//Establishes the connection
$conn = mysqli_init();
mysqli_ssl_set($conn, NULL, NULL, "C:\Tools\DigiCertGlobalRootCA.crt.pem", NULL, NULL);
mysqli_real_connect($conn, $host, $username, $password, $db_name, 3306, MYSQLI_CLIENT_SSL);
if (mysqli_connect_errno()) {
die('Failed to connect to MySQL: '.mysqli_connect_error());
}

//Create an Insert prepared statement and run it
$product_name = 'BrandNewProduct';
$product_color = 'Blue';
$product_price = 15.5;
if ($stmt = mysqli_prepare($conn, "INSERT INTO Products (ProductName, Color, Price) VALUES (?, ?, ?)")) {
mysqli_stmt_bind_param($stmt, 'ssd', $product_name, $product_color, $product_price);
mysqli_stmt_execute($stmt);
printf("Insert: Affected %d rows\n", mysqli_stmt_affected_rows($stmt));
mysqli_stmt_close($stmt);
}

//Close the connection
mysqli_close($conn);
?>
```

You should see the console output message `Insert: Affected 1 rows`.

The third code snippet utilizes the `mysqli_query()` method, just like
the first code snippet. However, it also utilizes the
`mysqli_fetch_assoc()` method to parse the result set.

``` php
<?php
$host = '[SERVER NAME].mysql.database.azure.com';
$username = 'sqlroot';
$password = '[PASSWORD]';
$db_name = 'newdatabase';

//Establishes the connection
$conn = mysqli_init();
mysqli_ssl_set($conn, NULL, NULL, "C:\Tools\DigiCertGlobalRootCA.crt.pem", NULL, NULL);
mysqli_real_connect($conn, $host, $username, $password, $db_name, 3306, MYSQLI_CLIENT_SSL);
if (mysqli_connect_errno()) {
die('Failed to connect to MySQL: '.mysqli_connect_error());
}

//Run the Select query
printf("Reading data from table: \n");
$res = mysqli_query($conn, 'SELECT * FROM Products');
while ($row = mysqli_fetch_assoc($res)) {
var_dump($row);
}

//Close the connection
mysqli_close($conn);
?>
```

PHP returns an array with the column values for the row inserted in the
previous snippet.

The next snippet uses a prepared update statement with bound parameters.
It modifies the `Price` column of the record.

``` php
<?php
$host = '[SERVER NAME].mysql.database.azure.com';
$username = 'sqlroot';
$password = '[PASSWORD]';
$db_name = 'newdatabase';

//Establishes the connection
$conn = mysqli_init();
mysqli_ssl_set($conn, NULL, NULL, "C:\Tools\DigiCertGlobalRootCA.crt.pem", NULL, NULL);
mysqli_real_connect($conn, $host, $username, $password, $db_name, 3306, MYSQLI_CLIENT_SSL);
if (mysqli_connect_errno()) {
die('Failed to connect to MySQL: '.mysqli_connect_error());
}

//Run the Update statement
$product_name = 'BrandNewProduct';
$new_product_price = 15.1;
if ($stmt = mysqli_prepare($conn, "UPDATE Products SET Price = ? WHERE ProductName = ?")) {
mysqli_stmt_bind_param($stmt, 'ds', $new_product_price, $product_name);
mysqli_stmt_execute($stmt);
printf("Update: Affected %d rows\n", mysqli_stmt_affected_rows($stmt));

//Close the connection
mysqli_stmt_close($stmt);
}

//Close the connection
mysqli_close($conn);
?>
```

After executing these commands, you should receive the message
`Update: Affected 1 rows`.

The final code snippet deletes a row from the table using the
`ProductName` column value. It again uses a prepared statement with
bound parameters.

``` php
<?php
$host = '[SERVER NAME].mysql.database.azure.com';
$username = 'sqlroot';
$password = '[PASSWORD]';
$db_name = 'newdatabase';

//Establishes the connection
$conn = mysqli_init();
mysqli_ssl_set($conn, NULL, NULL, "C:\Tools\DigiCertGlobalRootCA.crt.pem", NULL, NULL);
mysqli_real_connect($conn, $host, $username, $password, $db_name, 3306, MYSQLI_CLIENT_SSL);
if (mysqli_connect_errno()) {
die('Failed to connect to MySQL: '.mysqli_connect_error());
}

//Run the Delete statement
$product_name = 'BrandNewProduct';
if ($stmt = mysqli_prepare($conn, "DELETE FROM Products WHERE ProductName = ?")) {
mysqli_stmt_bind_param($stmt, 's', $product_name);
mysqli_stmt_execute($stmt);
printf("Delete: Affected %d rows\n", mysqli_stmt_affected_rows($stmt));
mysqli_stmt_close($stmt);
}

//Close the connection
mysqli_close($conn);
?>
```

Congratulations. You successfully created an SSL-secured connection with
Flexible Server, created a table (DDL), and performed CRUD operations
against that table (DML).

# Python Language Support

This section will demonstrate how to query Azure Database for MySQL
Flexible Server using the `mysql-connector-python` library on Python 3.

## Setup

Follow one of the methods in the [Provision MySQL Flexible Server]
document to create a Flexible Server instance with a database.

Moreover, install Python 3.7 or above from the [Downloads page]. This
sample was tested using Python 3.8.

A text editor like Visual Studio Code will greatly help.

Though a Python Virtual Environment is not necessary for the sample to
run, using one will avoid conflicts with packages installed globally on
your system. The commands below will create a Virtual Environment called
`venv` and activate it on Windows. Instructions will differ for other
OS.

``` cmd
python -m venv venv
.\venv\Scripts\activate
```

## Instructions

This section is based on [Microsoft's sample].

The first code snippet creates a table, `inventory`, with three columns.
It uses raw queries to create the `inventory` table and insert three
rows. If the snippet succeeds, you should see an output like the one
below.

    Connection established
    Finished dropping table (if existed).
    Finished creating table.
    Inserted 1 row(s) of data.
    Inserted 1 row(s) of data.
    Inserted 1 row(s) of data.
    Done.

Note that the sample establishes an SSL connection with the MySQL
instance. You can use the statement below (placed before `cursor` and
`conn` are closed) to validate the use of SSL.

``` python
cursor.execute("SHOW STATUS LIKE 'Ssl_cipher'")
print(cursor.fetchone())
```

If you want to bind the [SSL public certificate] with your connections
to Flexible Server, which is recommended by Azure, download the public
certificate to a location on your machine (such as `C:\Tools`). Then,
edit the `config` dictionary to add the `ssl_ca` key and the file path
of your certificate as the value.

``` python
config = {
  'host':'[SERVER].mysql.database.azure.com',
  'user':'sqlroot',
  'password':'[PASSWORD]',
  'database':'newdatabase',
  'ssl_ca': 'C:\Tools\DigiCertGlobalRootCA.crt.pem'
}
```

The second code snippet connects to the MySQL instance and executes a
raw query to SELECT all rows from the `inventory` table. This time, it
uses the `fetchall()` method to parse the result set into a Python
iterable. You should see an output like the one below.

    Connection established
    Read 3 row(s) of data.
    Data row = (1, banana, 150)
    Data row = (2, orange, 154)
    Data row = (3, apple, 100)
    Done.

The third code snippet executes an UPDATE statement to change the
`quantity` value of the record identified by `name`. You should see an
output like the one below.

    Connection established
    Updated 1 row(s) of data.
    Done.

The final snippet executes a raw DELETE statement against the
`inventory` table targeting records identified by `name`. You should see
an output like the one below.

    Connection established
    Deleted 1 row(s) of data.
    Done.

At this point, you have successfully opened a connection to Flexible
Server, created a table (DDL), and performed CRUD operations (DML)
against data in the table.

If you created a Python Virtual Environment for this document, simply
enter `deactivate` into the console.

# Java (Spring Boot) Language Support

This section will demonstrate how to operate a Spring Framework
application that queries Azure Database for MySQL through the Spring
Data JPA. We will also present Azure extensions for popular Java
development tools.

## Setup

### Prerequisites

Please complete the instructions for [working with Flexible Server in
MySQL Workbench.] Utilize version 8.0.26 as you complete the guide to
ensure compatibility with Single Server.

Optionally, download Postman, a popular http testing application. If you
are more comfortable with another utility, such as `curl`, feel free to
use it instead.

### IntelliJ Setup

Download the [IntelliJ IDEA] IDE. The Community edition will suffice and
comes with a custom JDK, so it is not necessary to install the JDK
separately.

After installing IntelliJ, install the [Azure Toolkit for IntelliJ]
plugin. Then, authenticate with Azure, as described in [this] document.

Once everything is equipped, you will see an **Azure Explorer** tab on
the left side of the screen. One of the available resource management
options will be to manage Azure Database for MySQL singler server
instances, however flexible server is currently unavailable.

![This image demonstrates the Azure Toolkit for IntelliJ plugin, with
the Azure Database for MySQL node expanded.]

### App Setup

Clone the [gs-accessing-data-mysql] repository to your local machine.
This is an example app from the Spring documentation.

``` cmd
TODO
```

Using IntelliJ, browse to the `complete` directory in the repository
root. If you are prompted to choose between using the `Maven`
configuration or the `Gradle` configuration, choose `Maven`.

![This image shows the complete project opened in IntelliJ in the
Project tab.]

### Database Setup

The IntelliJ Azure explorer supports Azure Database for MySQL Single
Server and will allow too provision a Single Server instance directly
within the Azure Explorer.

1.  Navigate to the **Azure Explorer** tab, right-click on **Azure
    Database for MySQL**, and select **+ Create**.

2.  The **Create Azure Database for MySQL** dialog box will open. Select
    **+ More settings** (1) and populate the following parameters:

    -   **Project details**
        -   **Subscription** (2)
        -   **Resource group** (3): choose an existing resource group
            from the dropdown or create a new one by pressing **+**
    -   **Server details**
        -   **Server name** (4): provide a unique value, like
            `springboot-single-server-SUFFIX`
        -   **Location** (5): choose an Azure location near you
        -   **Version** (6): choose `8.0`
    -   **Administrator account**
        -   **Admin username** (7): enter `sqlroot`
        -   **Password/confirm password** (8): choose a secure password
    -   **Connection security**
        -   Select **Allow access from current local PC** (9)

    ![This image demonstrates how to create a new MySQL Single Server
    instance from IntelliJ and populate it with the parameters above.]

3.  Select **OK**. Allow the task to continue in the background.

4.  Once provisioning completes (it should only take a few minutes),
    observe the new MySQL Single Server instance appear in the Azure
    explorer. Right-click the instance and select **Show properties**. A
    panel will open with basic information about the instance, including
    Spring connection information for the `application.properties` file.

    ![This image demonstrates Single Server MySQL connection information
    from the IntelliJ Azure explorer.]

5.  Create a new connection to your Azure Database for MySQL Single
    Server instance from MySQL Workbench. Use the following SQL
    statement to create a new database called `newdatabase`. This
    application will not function with the provided `mysql` system
    database.

    ``` sql
    CREATE DATABASE newdatabase;
    ```

## Run the App

1.  Open `application.properties` from the project hierarchy: `src` >
    `main` > `resources`. Delete all the `spring.datasource.*` entries.

    ![This image demonstrates how to edit the application.properties
    file.]

2.  Navigate to the **Azure Explorer**, right-click the Single Server
    instance you provisioned, and select **Connect to Project
    (Preview)**.

3.  In the **Azure Resource Connector** window, keep all parameters the
    same. Simply populate the **Password**. Then, select **OK**.

    ![This image demonstrates the Azure Resource Connector dialog box.]

4.  Replace the contents you removed from the `application.properties`
    file with the following. Notice how the connection information is
    encapsulated in environment variables.

        spring.datasource.url=${AZURE_MYSQL_URL}
        spring.datasource.username=${AZURE_MYSQL_USERNAME}
        spring.datasource.password=${AZURE_MYSQL_PASSWORD}

5.  Start the application from the upper right-hand corner of the
    screen.

    ![This image shows how to start the Spring Boot app from IntelliJ.]

## Testing the App

1.  Open Postman, or the REST client of your choice. Make a `POST`
    request to `http://localhost:8080/demo/add` with the URL parameters
    `name` and `email`.

    ![This image shows how to make a POST request to the Java app
    endpoint.]

2.  Make a `GET` request to `http://localhost:8080/demo/all`. The
    entries that you added through the POST request will be displayed.

    ![This image shows how to make a GET request to the Java app
    endpoint.]

3.  As expected, the data is persisted to the MySQL Single Server
    instance.

    ![This image shows the user data persisted to the MySQL Single
    Server instance with a query in MySQL Workbench.]

## Stop the App

1.  Stop the app in IntelliJ.

2.  In the **Azure Explorer**, right-click the MySQL Single Server
    instance you created and select **Stop**.

Congratulations. You have successfully installed IntelliJ, the Azure
Explorer extension, created a MySQL Single Server instance, and securely
operated an app using the Single Server.

# End to End Development

Now that you have a development environment setup, its time to explore
the various options you have to deploy your application and its
corredsponding MySQL database.

This will start with a typical classic deployment where you deploy your
application to a web server and a database server on a physical or
virtualized host operating system and then explore the evolution of the
potential deployment options in a simple to complex progression ending
with your application running as containers in Azure Kubernetes Service
(AKS) with Azure Database for MySQL hosting your database.

## Development Evolution

The following scenerios will be discussed and demonstrated as part of
this Azure MySQL developer's guide. All of the following deployments
will utilize the same application and database backend and what is
needed to modify the application in order to support the targets. Topics
will be discussed in the following simple to complex ordering.

-   Classic deployment
-   Azure VM Deployment
-   Simple App Service Deployment with Azure Database for My SQL Single
    Server
-   App Service with InApp MySQL
-   Continous Integration / Continous Delivery
-   Containerizing your layers with Docker
-   Azure Container Instances (ACI)
-   App Service Containers
-   Azure Kubernetes Service (AKS)
-   AKS with MySQL Flexible Server

It is recommeded that you follow each of the scenarios in the order
shown so that you get a full pictures of the steps involved in the
development evolution and have the necessary pre-req items you need to
move on to the more complex deployments.

## Classic Deployment

In a classic deployment, you will typically setup your web server (such
as Internet Information Services (IIS), Apache or NGIX) on physical or
virtualized on-premises hardware. Most applications using MySQL as the
backend are using PHP as the front end (which is the case for the sample
application in this guide); as such, you must ensure that you configure
the web server to support PHP. This includes configuring and enabling
any PHP extensions and installing the required software to supporte
those extensions.

Some web servers are relatively easier to setup than others. The
complexity depends on what the target operating system is and what
features your application and database are using, for example SSL/TLS.

In addition to the web server, you will need to also install and
configure the physical MySQL database server. This includes creating the
schema and the application users that will be used to access the target
database(s).

As part of our sample application and supporting Azure Landing zone
created by the ARM templates, most of this gets setup for you. Once the
software has been installed and configured, it is up to you to deploy
your application and database on the system. Classical deployments tend
to be manual in nature such that you copy the files to the target
production web server and then deploy the database schema and supported
data via MySQL tools or the MySQL workbench.

To implement this deployment, follow the steps to perform a simulated
classical deployment in Azure, reference the [Classic Deployment to PHP
enabled IIS server] article.

## Azure VM Deployment

An Azure VM Deployment is very similar to a classical deployment but
rather than deploying to physical hardware, you are deploying to
virtualized hardware in the Azure cloud. The operating system and
software will be the same as your classic deployment, but in order to
open the system up, you'll need to modify the virtual networking to
allow access to your web server.

The advantages of using Azure to host your virtual machines include the
ability to enable backup and restore services, disk encryption and
scaling up options that require no upfront costs and provide flexibility
in configuration options with just a few clicks of the mouse. This is in
contrast to the relatively complex and extra work needed to enable these
types of services on-premises.

To implement this deployment, follow the steps to perform an Azure VM
deployment, reference the [Cloud Deployment to Azure VM] article.

## Simple App Service Deployment with Azure Database for MySQL Single Server

If supporting the operating system and the various other software is not
a preferred approach, the next evolutionary path is to remove the
operating system and web server from the list of setup and configuration
steps. This can be accomplished by utilizing the Platform as a Service
(Paas) offerings of Azure App Service and Azure Database for MySQL.

However, modernizing your application and migrating them to these
services may introduce some relatively small application changes in
order to migrate them to these cloud services.

To implement this deployment, follow the steps to perform an App Service
and MySQL Single Server deployment, reference the [Cloud Deployment to
Azure App Service] article.

## App Service with InApp MySQL

If you have a small database that you would like to be integrated with
your application hosting environment, you can utilize a feature of Azure
App Service that will allow you to deploy your database to the same App
Service and connect through `localhost`.

Integration is accomplished by using a built-in **myphpadmin** interface
in the Azure Portal. From this admin portal, you can run any supported
SQL commands to import or export your database.

The limits of the MySQL instance is primarily driven by the size of your
corresponding [App Service Plan]. The biggest factor about limits is
normally the disk space allocated to any app services in the plan. App
Service Plan storage sizes range from 1GB to 1TB, therefore if you have
a database that will grow past 1TB, you will need to host it in Flexible
server. For a list of other limitations, referecen [Announcing Azure App
Service MySQL in-app].

To implement this deployment, follow the steps to perform an App Service
with InApp MySQL deployment, reference the [Cloud Deployment to Azure
App Service with MySQL InApp] article.

## Continous Integration (CI) and Continous Delivery (CD)

Doing manual deployments every time you make a change can be a very time
consuming endeavour. Utilize an automated deployment approach can save a
lot of time and effort. You can utilize both Azure DevOps or Github
Action to automatically deploy your code and database each time you
perform a new commit to your codebase.

Wether you choose to use DevOps or Github, you will need to do some
setup work in order to support your deployments. This typically includes
creating credentials that can connect to your taget environment and
deploy the release artifacts.

To implement this deployment, follow the steps to perform deployments
using Azure DevOps and GitHub Actions, reference the [Deployment via
CI/CD] article.

## Containerizing your layers with Docker

By building your application and database with a specific target
environment in mind, you will need to assume that your operations team
will have deployed and configured that same environment to support your
application and data workload. If they missed any items, your
application will either not load or may error during runtime.

Containers solve the potential issue of misconfiguration the target
environment. By containerize your application and data, you are ensured
that your application will run exactly as you intended it. Containers
can also more easily be scaled using tools such as Kubernetes.

Containerizing your application and data layer can be relatively
complex, but once you have the build environment setup and working, you
can push container updates very quickly to multi-regional load balanced
enviornments.

To implement this deployment, follow the steps to perform deployments
using Docker, reference the [Migrate to Docker Containers] article.

## Azure Container Instances (ACI)

After you have migrated your application and data layers to conatiners,
you must then select a hosting target for your containers. A simple way
to deploy a container is to use Azure Container Instances (ACI).

Azure Container Instances can deploy one container at a time or multiple
containers to keep the application, api and data contained in the same
resource.

To implement this deployment, follow the steps to perform deployments
using ACI, reference the [Migrate to Azure Container Instances (ACI)]
article.

## App Service Containers

TODO

To implement this deployment, follow the steps to perform deployments
using Azure App Service containers, reference the [Migrate to Azure App
Service Containers] article.

## Azure Kubernetes Service (AKS)

ACI and App Service Container hosting is a simple and easy way to run
containers, but does not provide many enterprise features such as
deployment across nodes that live in multiple regions, load balancing,
automatic restarts and redployment and many other features.

Moving to Azure Kubernetes Service (AKS) will enable your application to
inherit all the enterprise features provided by AKS.

To implement this deployment, follow the steps to perform deployments
using AKS, reference the [Migrate to Azure Kubernetes Services (AKS)]
article.

## AKS with MySQL Flexible Server

Running your database layer in a container is better than running it in
a VM, but not as great as removing all the operating system and software
management components.

To implement this deployment, follow the steps to perform deployments
using AKS with Flexible Server, reference the [Utilize AKS and Azure
Database for MySQL Flexible Server] article.

# Deploying a Laravel app backed by a Java REST API to AKS

## App Introduction

In the previous stages of this developer guide, you explored how an MVC
app could be deployed on an Azure VM, containerized, and then hosted on
various PaaS services (e.g. Azure Container Instances). The second
sample app provided with this developer guide delegates database access
operations (Flexible Server queries) to a Java REST API. The Laravel app
calls the REST API.

One of the advantages of this microservices architecture is that the
Java API and the Laravel app can be scaled independently. Both
deployments have high availability. Moreover, though this exercise does
not demonstrate how to configure CI/CD for this app, you can apply the
same techniques you learned previously.

We recommend creating a new resource group for this exercise.

    az group create -n [RESOURCE GROUP NAME] -l [AZURE REGION]

## Provision the Database

Navigate to the `Database` directory within the `java-api` directory in
the project root from a PowerShell terminal instance. Then, execute the
`create-database.ps1` script, passing the parameters in the order shown
below. The command will provision a new Flexible Server instance with
the app database schema.

-   Provide a unique `Suffix` to ensure that the Flexible Server
    instance's name is unique
-   Provide a strong `Password` for the database admin user (`AppAdmin`)
-   Provide the name of your lab `Resource Group`
-   Provide the desired `Location` for your Azure resources

``` powershell
.\create-database.ps1 'Suffix' 'Password' 'Resource Group' 'Location'
```

The Flexible Server instance will have 1 vCore, 2 GiB memory, 32 GiB
storage, and it will allow all Azure resources to access it.

> Consult the [Microsoft documentation] for information on how to
> configure private access for MySQL Flexible Server from Azure
> Kubernetes Service. This example uses public access for simplicity.

## Create Docker Images

### API

Navigate to the `java-api` directory and enter the following command to
create an optimized Docker image. Note that Maven does not need a
Dockerfile to create this image, called `noshnowapi:0.0.1-SNAPSHOT`.

    mvn spring-boot:build-image

### Laravel

Navigate to the `sample-php-app-rest` directory. Create a file called
`.env`. Set `APP_KEY=` as the first line in the file. Then, run
`php artisan key:generate` to create an application key in the `.env`
file.

Now, in the same directory, enter the following command to create a
Docker image to serve the PHP frontend app through Apache.

    docker image build -t noshnowui:0.0.1 .

## Provision Azure Kubernetes Service

Navigate to the `Kubernetes` directory within the `java-api` directory
in the project root from a PowerShell terminal instance. Then, execute
the `create-azure-resources.ps1` script, passing the parameters in the
order shown below. The command will provision Azure Container Registry
and push the two Docker images; provision a new Azure Kubernetes Service
cluster and provide it access to ACR; and create the `contosonoshnow`
namespace within the Kubernetes cluster.

-   Provide a unique `Suffix` that is the **same as the suffix used for
    the create-database.ps1 script**
-   Provide the name of your lab `Resource Group` (same as the Resource
    Group used for the prior script)
-   Provide the desired `Location` for your Azure resources (same as the
    Location used for the prior script)

``` powershell
.\create-azure-resources.ps1 'Suffix' 'Resource Group' 'Location'
```

Note that if the resources are deployed to an Azure region that supports
Availability Zones, the script will co-locate the Flexible Server
instance and the Kubernetes cluster.

## Deploy the API to Azure Kubernetes Service

### Create the API Secret

Open the `api.secrets.yml` file in the `Kubernetes` directory. This file
contains the base64-encoded password for the application user. Besides
the administrative user, the database schema setup script created a
less-privileged app user.

Run the command below from the `Kubernetes` directory to create the
password secret:

    kubectl apply -f api.secrets.yml

### Create the API Service

`api.service.yml` defines a Service that directs all traffic received
from within the cluster on port 8080 to the pods that serve the Java
API. Note that the API service is only accessible from within the
cluster.

    kubectl apply -f api.service.yml

### Create the API Deployment

`api.deployment.yml` defines a deployment with two pods, created from
the Java API image pushed to ACR.

Open the file. Replace the two `[SUFFIX]` placeholders with the values
you used when provisioning the Azure resources. Then, execute the
command below:

    kubectl apply -f api.deployment.yml

Congratulations. You have deployed the API to Azure Kubernetes Service
and exposed it internally through a Service.

## Deploy the Laravel App to Azure Kubernetes Service

### Create the Web App Service

Navigate to the `Kubernetes` directory in the `sample-php-app-rest`
directory. Create a service to expose the Laravel app through a public
IP address (in this case, through a Load Balancer provisioned in Azure).

    kubectl apply -f web.service.yml

### Create the Web App Deployment

The deployment specified in the `web.deployment.yml` file (in the same
directory as the previous step) creates two pods from the Laravel app
image pushed to ACR.

Again, replace the `[SUFFIX]` placeholder in the file. Then, create the
deployment.

    kubectl apply -f web.deployment.yml

## Browse to the App

Run `kubectl get svc` to get the public IP address of
`laravel-ui-service`. Copy the `EXTERNAL-IP` value to a browser window.

![This image demonstrates the IP address of the LoadBalancer service for
the Laravel app.]

If all functions correctly, you should see the user details for a random
user load.

![This image demonstrates that the Laravel app functions without a
problem when deployed to AKS.]

# MySQL Migration

The emphasis of this guide is how to use Azure PaaS MySQL, namely
Flexible Server, to architect modern applications. However, many
businesses already utilize MySQL on-premises and intend to migrate their
MySQL databases and apps to Azure to reap its benefits. Microsoft has
already produced a whitepaper titled [Migrate MySQL on-premises to Azure
Database for MySQL] to discuss the considerations of a MySQL migration,
including the assessment, choice of migration tools, and post-upgrade
enhancement. The guide also features a sample application and
environment to try the migration journey.

# Monitoring

Once you have deployed your application and database, the next phase is
to manage the new cloud-based data workload resources. Management
operations include both control plane and data plane activities. Control
plane activities are those related to the Azure resources versus data
plane which is **inside** the Azure resource (in this case MySQL).

Azure Database for MySQL provides for the ability to monitor both of
these types of operational activities using Azure-based tools such as
[Azure Monitor][21], [Log Analytics] and [Azure Sentinel]. In addition
to the Azure-based tools, security information and event management
(SIEM) systems can be configured to consume these logs as well.

Whichever tool is used to monitor the new cloud-based workloads, alerts
will need to be created to warn Azure and database administrators of any
suspicious activity. If a particular alert event has a well-defined
remediation path, alerts can fire automated [Azure run books] to address
the event.

## Azure Monitor

Administrators and developers employ Azure Monitor to consolidate
metrics about the performance and reliability of their Flexible Server
instances.

Once metric data is flowing, use the [Kusto Query Language (KQL)] query
language to query the various log information. Administrators unfamiliar
with KQL can find a SQL to KQL cheat sheet [here] or the [Get started
with log queries in Azure Monitor] page.

For example, to get the memory usage of the Azure Database for MySQL:

``` kql
AzureMetrics
| where TimeGenerated > ago(15m)
| limit 10
| where ResourceProvider == "MICROSOFT.DBFORMYSQL"
| where MetricName == "memory_percent"
| project TimeGenerated, Total, Maximum, Minimum, TimeGrain, UnitName
| top 1 by TimeGenerated
```

To get the CPU usage:

``` kql
AzureMetrics
| where TimeGenerated > ago(15m)
| limit 10
| where ResourceProvider == "MICROSOFT.DBFORMYSQL"
| where MetricName == "cpu_percent"
| project TimeGenerated, Total, Maximum, Minimum, TimeGrain, UnitName
| top 1 by TimeGenerated
```

The table below, pulled from the [Microsoft documentation][22],
indicates the metrics exposed by Flexible Server instances:

  ------------------------------------------------------------------------------
  Metric display    Metric                   Unit              Description
  name                                                         
  ----------------- ------------------------ ----------------- -----------------
  Host CPU percent  cpu_percent              Percent           The percentage of
                                                               CPU utilization
                                                               on the server,
                                                               including CPU
                                                               utilization from
                                                               both customer
                                                               workload and
                                                               Azure MySQL
                                                               processes

  Host Network In   network_bytes_ingress    Bytes             Incoming network
                                                               traffic on the
                                                               server, including
                                                               traffic from both
                                                               customer database
                                                               and Azure MySQL
                                                               features like
                                                               replication,
                                                               monitoring, logs
                                                               etc.

  Host Network out  network_bytes_egress     Bytes             Outgoing network
                                                               traffic on the
                                                               server, including
                                                               traffic from both
                                                               customer database
                                                               and Azure MySQL
                                                               features like
                                                               replication,
                                                               monitoring, logs
                                                               etc.

  Replication Lag   replication_lag          Seconds           The time since
                                                               the last replayed
                                                               transaction. This
                                                               metric is
                                                               available for
                                                               replica servers
                                                               only.

  Active            active_connection        Count             The number of
  Connections                                                  active
                                                               connections to
                                                               the server.

  Backup Storage    backup_storage_used      Bytes             The amount of
  Used                                                         backup storage
                                                               used.

  IO percent        io_consumption_percent   Percent           The percentage of
                                                               IO in use.

  Host Memory       memory_percent           Percent           The percentage of
  Percent                                                      memory in use on
                                                               the server,
                                                               including memory
                                                               utilization from
                                                               both customer
                                                               workload and
                                                               Azure MySQL
                                                               processes

  Storage Limit     storage_limit            Bytes             The maximum
                                                               storage for this
                                                               server.

  Storage Percent   storage_percent          Percent           The percentage of
                                                               storage used out
                                                               of the server's
                                                               maximum.

  Storage Used      storage_used             Bytes             The amount of
                                                               storage in use.
                                                               The storage used
                                                               by the service
                                                               may include the
                                                               database files,
                                                               transaction logs,
                                                               and the server
                                                               logs.

  Total connections total_connections        Count             The number of
                                                               total connections
                                                               to the server

  Aborted           aborted_connections      Count             The number of
  Connections                                                  failed attempts
                                                               to connect to the
                                                               MySQL, for
                                                               example, failed
                                                               connection due to
                                                               bad credentials.

  Queries           queries                  Count             The number of
                                                               queries per
                                                               second
  ------------------------------------------------------------------------------

> For a similar list for Single Server, consult [this document.][23]

## MySQL Audit Logs

MySQL has a robust built-in audit log feature. By default, this [audit
log feature is disabled] in Azure Database for MySQL. Server level
logging can be enabled by changing the `audit_log_enabled` server
parameter. Once enabled, logs can be accessed through [Azure
Monitor][21] and [Log Analytics] by turning on [diagnostic logging].

In addition to metrics, you can also enable MySQL logs to be ingested
into Azure Monitor. While metrics are better suited for real-time
decision-making, logs are also useful for deriving insights. One source
of logs generated by Flexible Server is MySQL *audit logs*, which
indicate connections, DDL and DML operations, and more. Many businesses
utilize audit logs to meet compliance requirements, but they can impact
performance.

Once enabled, you can query the logs with KQL. For example, to query for
user connection related events, run the following KQL query:

``` kql
AzureDiagnostics
| where ResourceProvider =="MICROSOFT.DBFORMYSQL"
| where Category == 'MySqlAuditLogs' and event_class_s == "connection_log"
| project TimeGenerated, LogicalServerName_s, event_class_s, event_subclass_s, event_time_t, user_s , ip_s , sql_text_s
| order by TimeGenerated asc
```

Note that excessive audit logging can degrade server performance, so be
mindful of the events and users configured for logging.

-   [Single Server Audit Logs]
-   [Flexible Server Audit Logs]

### Enabling Audit Logs

Audit logging is controlled by the `audit_log_enabled` server parameter
in Flexible Server. Azure provides granularity over the events logged
(`audit_log_events`), the database users subject to logging
(`audit_log_include_users`), and an explicit list of the database users
exempt from logging (`audit_log_exclude_users`).

> For more details about the logging server parameters, including the
> type of events that can be logged, consult [the
> documentation.][Flexible Server Audit Logs]

Besides being sent to Azure Monitor, MySQL audit logs can be sent to
Azure Storage accounts and Azure Event Hubs for integration with other
systems.

Reference [Configure and access audit logs for Azure Database for MySQL
in the Azure portal] for more information.

### Notes about the Flexible Server Portal Example

If you try to run the KQL query in the Flexible Server Azure portal
example, but you encounter errors, try to generate some activity and/or
expand the scope of the `audit_log_events` parameter. Here are some
actions which generated activity for my KQL queries:

-   Connecting to the Flexible Server instance from MySQL Workbench
-   Creating and dropping a dummy table (DDL activity)

As you work through the sample, note that Log Analytics is not just
limited to the events generated by the MySQL audit logging
functionality: logs generated by the Azure platform, such as starting or
stopping a Flexible Server instance, are also recorded.

You can query the activity log from the samples provided on the **Logs**
page.

![This image demonstrates a sample query of the Activity Log from the
Logs tab of the Azure portal.]

![This image demonstrates the query results from the opened sample.]

As you can see, KQL imposes a schema on logs to facilitate analysis.
Consult [the documentation][Flexible Server Audit Logs] for more
information.

### Helpful links - Monitoring

-   Flexible Server : [Configure audit logs (Azure portal)]

-   Single Server : [Configure and access audit logs in the Azure
    portal]

-   [Configure and access audit logs in the Azure CLI]

-   [Write your first query with Kusto Query Language (Microsoft Learn)]

-   [Azure Monitor Logs Overview]

## Metrics Resources

### Azure CLI

Azure CLI provides the `az monitor` series of commands to manipulate
action groups (`az monitor action-group`), alert rules and metrics
(`az monitor metrics`), and more.

-   [Azure CLI reference commands for Azure Monitor]
-   [Monitor and scale an Azure Database for MySQL Flexible Server using
    Azure CLI]

### Azure Portal

While the Azure portal does not provide automation capabilities like the
CLI or the REST API, it does support configurable dashboards and
provides a strong introduction to monitoring metrics in MySQL.

-   [Set up alerts on metrics for Azure Database for MySQL - Flexible
    Server]
-   [Tutorial: Analyze metrics for an Azure resource]

### Azure Monitor REST API

The REST API allows applications to access metric values for integration
with other applications or data storage systems, like Azure SQL
Database. It also allows applications to manipulate alert rules.

To interact with the REST API, applications first need to obtain an
authentication token from Azure Active Directory.

-   [REST API Walkthrough]
-   [Azure Monitor REST API Reference]

## Sample - Azure portal

In this example, I configured an alert rule called
**AbortedConnections** on the Flexible Server instance I provisioned
previously. It fires an alert if there were 10 or more aborted
connections in the last 30 minutes, polled at a frequency of five
minutes. The alert files an action group called **ServerNotifications**
that sends me an email.

![This image demonstrates the alert rule configuration and the
configured action groups.]

After initiating multiple failed connections to the Flexible Server
instance, I receive the following warning on my configured notification
email address.

![This image demonstrates the Azure Monitor alert rule sent to my email
after attempting multiple failed connections.]

## PowerShell Module

The Azure Portal and Windows PowerShell can be used for managing the
Azure Database for MySQL. To get started with PowerShell, install the
Azure PowerShell cmdlets for MySQL with the following PowerShell
command:

``` powershell
Install-Module -Name Az.MySql
```

After the modules are installed, reference tutorials like the following
to learn ways you can take advantage of scripting your management
activities:

-   [Tutorial: Design an Azure Database for MySQL using PowerShell]
-   [How to back up and restore an Azure Database for MySQL server using
    PowerShell]
-   [Configure server parameters in Azure Database for MySQL using
    PowerShell]
-   [Auto grow storage in Azure Database for MySQL server using
    PowerShell]
-   [How to create and manage read replicas in Azure Database for MySQL
    using PowerShell]
-   [Restart Azure Database for MySQL server using PowerShell]

# Alerting

## Concepts

Once you have created your KQL queries, you will then create [log
alerts] from these queries.

-   **Alert rules** specify the metric to monitor
    (e.g. `aborted_connections`), an aggregation for that metric
    (e.g. the `total`), a threshold for the aggregated value
    (e.g. `10 connections`), a time window for the aggregation
    (e.g. `30 minutes`), and a polling frequency (e.g. check if the
    previous conditions are met every `5 minutes`)

-   **Action groups** define notification actions, such as emailing or
    texting an administrator, and other actions to take, like calling a
    webhook or [Azure Automation Runbooks]

-   **Alert processing rules** is a *preview* feature that filters
    alerts as they are generated to modify the actions taken in response
    to that alert (i.e. by disabling action groups)

### Best Practices with Alerting Metrics

Here are some scenarios of how aggregating metrics over time generates
insights. Read the [Microsoft blog] for more examples.

-   If there were **10** or more failed connections (total of
    `aborted_connections` in Flexible Server) in the last **30**
    minutes, then send an email alert
    -   This may indicate incorrect credentials or an SSL issue in the
        application
-   If IOPS was **90%** or more of capacity (average of
    `io_consumption_percent` in Flexible Server) for at least **1**
    hour, then call a webhook
    -   Excessive IO usage affects the performance of transactional
        workloads, so [scale storage to increase IOPS capacity or
        provision additional IOPS]
    -   See the linked CLI examples for automatic scaling based on
        metrics \# Security

Moving to a cloud-based service doesn't mean the entire internet will
have access to it at all times. Azure provides best in class security
that ensures data workloads are continually protected from bad actors
and rouge programs. An additional critical factor for many organizations
is being compliant with local and industry based regulations.

Organizations must take proactive security measures to protect their
workloads and Azure simplifies through the following best practices.

## Authentication

Azure Database for MySQL supports the [basic authentication mechanisms]
for MySQL user connectivity, but also supports [integration with Azure
Active Directory]. This security integration works by issuing tokens
that act like passwords during the MySQL login process. [Configuring
Active Directory integration] is incredibly simple to do and supports
not only users, but AAD groups as well.

This tight integration allows administrators and applications to take
advantage of the enhanced security features of [Azure Identity
Protection] to further surface any identity issues.

> **Note:** This security feature is supported by MySQL 5.7 and later.
> Most [application drivers][Configuring Active Directory integration]
> are supported as long as the `clear-text` option is provided.

## Threat Protection

In the event that user or application credentials are compromised, logs
are not likely to reflect any failed login attempts. Compromised
credentials can allow bad actors to access and download the data. [Azure
Threat Protection] and [Microsoft Defender for open-source relational
databases] can watch for anomalies in logins (such as unusual locations,
rare users or brute force attacks) and other suspicious activities.
Administrators can be notified in the event something does not `look`
right which can then assist with patching vulnerabilities. You can
enable Microsoft Defender for open-source relational databases by
following the [Enable Microsoft Defender for open-source relational
databases and respond to alerts] article.

## Encryption

Both Azure Database for MySQL offerings, Single Server and Flexible
Server, offers various encryption features including encryption for
data, backups, and temporary files created during query execution.

Data in the MySQL instances are encrypted at rest by default. Any
automated backups are also encrypted to prevent potential leakage of
data to unauthorized parties. This encryption is typically performed
with a key that is created when the instance is created. In addition to
this default service encryption key, administrators have the option to
[bring your own key (BYOK)]. This feature is only supported in the
General Purpose and Memory Optimized tiers.

When using a customer-managed key strategy, it is vital to understand
responsibilities around key lifecycle management. Customer keys are
stored in an [Azure Key Vault] and then accessed via policies. It is
vital to follow all recommendations for key management, the loss of the
encryption key equates to the loss of data access.

In addition to a customer-managed keys, use service-level keys to [add
double encryption]. Implementing this feature will provide highly
encrypted data at rest, but it does come with encryption performance
penalties. Testing should be performed.

Data can be encrypted during transit using SSL/TLS and is enabled by
default. As previously discussed, it may be necessary to [modify your
applications] to support this change and also configure the appropriate
TLS validation settings. It is possible to allow insecure connections
for legacy applications or enforce a minimum TLS version for connections
but this should be used sparingly and highly network protected
environments. Consult the guides below, as Flexible Server's TLS
enforcement status can be set through the `require_secure_transport`
MySQL server parameter.

-   [Single Server][24]
-   [Flexible Server][25]

## Firewall

Once users are set up and the data is encrypted at rest, the migration
team should review the network data flows. Azure Database for MySQL
provides several mechanisms to secure the networking layers by limiting
access to only authorized users, applications and devices.

The first line of defense for protecting the MySQL instance is to
implement [firewall rules]. IP addresses can be limited to only valid
locations when accessing the instance via internal or external IPs. If
the MySQL instance is destined to only serve internal applications, then
[restrict public access].

When moving an application to Azure along with the MySQL workload, it is
likely there will be multiple virtual networks setup in a hub and spoke
pattern that will require [Virtual Network Peering] to be configured.

## Security Checklist

-   Use Azure AD authentication where possible.
-   Enable Advanced Thread Protection and Microsoft Defender.
-   Enable all auditing features.
-   Consider a Bring-Your-Own-Key (BYOK) strategy.
-   Implement firewall rules.
-   Utilize private endpoints for workloads that do not travel over the
    Internet.

# Testing

TODO

## Tools

TODO

### Web

### Database

### 

# Optimization

## Monitoring Hardware and Query Performance

In addition to the audit and activity logs, server performance can also
be monitored with [Azure Metrics]. Azure metrics are provided in a
one-minute frequency and alerts can be configured from them. For more
information, reference [Monitoring in Azure Database for MySQL] for
specifics on what kind of metrics that can be monitored.

As previously mentioned, monitoring metrics such as the `cpu_percent` or
`memory_percent` can be important when deciding to upgrade the database
tier. Consistently high values could indicate a tier upgrade is
necessary.

Additionally, if cpu and memory do not seem to be the issue,
administrators can explore database-based options such as indexing and
query modifications for poor performing queries.

To find poor performing queries, run the following:

``` kql
AzureDiagnostics
| where ResourceProvider == "MICROSOFT.DBFORMYSQL"
| where Category == 'MySqlSlowLogs'
| project TimeGenerated, LogicalServerName_s, event_class_s, start_time_t , query_time_d, sql_text_s
| top 5 by query_time_d desc
```

## Query Performance Insight

In addition to the basic server monitoring aspects, Azure provides tools
to monitor application query performance. Correcting or improving
queries can lead to significant increases in the query throughput. Use
the [Query Performance Insight tool] to analyze the longest running
queries and determine if it is possible to cache those items if they are
deterministic within a set period, or modify the queries to increase
their performance.

The `slow_query_log` can be set to show slow queries in the MySQL log
files (default is OFF). The `long_query_time` server parameter can alert
users for long query times (default is 10 sec).

## Upgrading the Tier

The Azure Portal can be used to scale between from `General Purpose` and
`Memory Optimized`. If a `Basic` tier is chosen, there will be no option
to upgrade the tier to `General Purpose` or `Memory Optimized` later.
However, it is possible to utilize other techniques to perform a
migration/upgrade to a new Azure Database for MySQL instance.

For an example of a script that will migrate from Basic to another
server tier, reference [Upgrade from Basic to General Purpose or Memory
Optimized tiers in Azure Database for MySQL].

## Scale the Server

Within the tier, it is possible to scale cores and memory to the minimum
and maximum limits allowed in that tier. If monitoring shows a continual
maxing out of CPU or memory, follow the steps to [scale-up to meet your
demand][Upgrade from Basic to General Purpose or Memory Optimized tiers in Azure Database for MySQL].

## Moving Regions

Moving a database to a different Azure region depends on the approach
and architecture. Depending on the approach, it could cause system
downtime.

The recommended process is the same as utilizing read replicas for
maintenance failover. However, compared to the planned maintenance
method mentioned above, the speed to failover is much faster when a
failover layer has been implemented in the application. The application
should only be down for a few moments during the read replica failover
process. More details are covered in the [Business Continuity and
Disaster Recovery] section.

## Optimization Checklist

-   Monitor for slow queries.
-   Periodically review the Performance Insight dashboard.
-   Utilize monitoring to drive tier upgrades and scale decisions.
-   Consider moving regions if the users or application needs change.

## Server Parameters

As part of the migration, it is likely the on-premises [server
parameters][26] were modified to support a fast egress. Also,
modifications were made to the Azure Database for MySQL parameters to
support a fast ingress. The Azure server parameters should be set back
to their original on-premises workload optimized values after the
migration.

However, be sure to review and make server parameters changes that are
appropriate for the workload and the environment. Some values that were
great for an on-premises environment, may not be optimal for a
cloud-based environment. Additionally, when planning to migrate the
current on-premises parameters to Azure, verify that they can in fact be
set.

Some parameters are not allowed to be modified in Azure Database for
MySQL.

TODO -
https://wemakewaves.medium.com/migrating-our-php-applications-to-docker-without-sacrificing-performance-1a69d81dcafb
\# Server Parameters

MySQL server parameters allow database architects and developers to
optimize the MySQL engine for their specific application workloads.
Azure Database for MySQL exposes a small subset of the overall
parameters. Some parameters that cannot be configured at the server
level can be configured at the connection level. Moreover, *dynamic*
parameters can be changed without restarting the server, while modifying
*static* parameters warrants a restart.

One of the advantages of Flexible Server is its versatility over single
server instances. Some important exposed parameters are listed below,
and the instance's storage and compute tiers affect the possible
parameter values. Consult the [Microsoft documentation][27] for more
information.

-   [log_bin_trust_function_creators] is enabled by default and
    indicates whether users can create triggers

-   [innodb_buffer_pool_size] indicates the size of the buffer pool, a
    cache for tables and indexes

    > For this parameter, consult the [Microsoft documentation][28], as
    > database compute tier affects the parameter value range

-   [innodb_file_per_table] affects where table and index data are
    stored

Azure Database for MySQL Single Server includes support for the three
server parameters listed above. For a comprehensive list of Single
Server's supported parameters, consult the [Microsoft documentation.]

## Tools to Set Server Parameters

Standard Azure management tools, like the Azure portal, Azure CLI, and
Azure PowerShell, allow for configuring Azure Database for MySQL server
parameters.

### Flexible Server Articles

-   [Azure portal][29]
-   [Azure CLI][30]

### Single Server Articles

-   [Azure portal][31]
-   [Azure CLI][32]
-   [Azure PowerShell][33]

## Server Parameters Best Practices

The server parameters below may provide performance improvements for
your application. However, before modifying these values in production,
verify that they yield performance improvements without compromising
application stability.

-   Enable thread pooling by setting `thread_handling` to
    `pool-of-threads`: Thread pooling improves concurrency by serving
    connections through a pool of worker threads, instead of creating a
    new thread to serve each connection. Enabling thread pooling
    improves performance for transactional workloads, as connections are
    short-lived

    -   The degree of concurrency is set through the `thread_pool_size`
        parameter
    -   Only supported in MySQL 8.0

    ![This graph demonstrates the performance benefits of thread pooling
    for a Flexible Server instance.]

    The graph above, taken from the aforementioned TechCommunity post,
    demonstrates the performance improvements for a 16 vCore, 64 GiB
    memory Flexible Server instance. The x-axis represents the number of
    connections, and the y-axis represents the number of queries served
    per second (QPS). Read the associated [Microsoft TechCommunity post]
    for more details

-   Enable InnoDB buffer pool warmup by setting
    `innodb_buffer_pool_dump_at_shutdown` to `ON`: InnoDB buffer pool
    warmup loads data files from disk after a restart and before
    receiving queries on that data. This improves the latency of the
    first queries executed against the database after a restart, but it
    does increase the server's start-up time

    -   Microsoft only recommends this change for database instances
        with more than 335 GB of provisioned storage
    -   Learn more from the [Microsoft documentation][34]

# Business Continuity and Disaster Recovery (BCDR)

## Backup and Restore

As with any mission critical system, having a backup and restore as well
as a disaster recovery (BCDR) strategy is an important part of your
overall system design. If an unforseen event occurs, you should have the
ability to restore your data to a point in time (Recovery Point
Objective) in a reasonable amount of time (Recovery Time Objective).

### Backup

Azure Database for MySQL supports automatic backups for 7 days by
default. It may be appropriate to modify this to the current maximum of
35 days. It is important to be aware that if the value is changed to 35
days, there will be charges for any extra backup storage over 1x of the
storage allocated.

There are several current limitations to the database backup feature as
described in the [Backup and restore in Azure Database for MySQL] docs
article. It is important to understand them when deciding what
additional strategies that should be implemented.

Some items to be aware of include:

-   No direct access to the backups
-   Tiers that allow up to 4TB have a full backup once per week,
    differential twice a day, and logs every five minutes
-   Tiers that allow up to 16TB have backups that are snapshot based

> **Note:** [Some regions] do not yet support storage up to 16TB.

### Restore

Redundancy (local or geo) must be configured during server creation.
However, a geo-restore can be performed and allows the modification of
these options during the restore process. Performing a restore operation
will temporarily stop connectivity and any applications will be down
during the restore process.

During a database restore, any supporting items outside of the database
will also need to be restored. Review the migration process. See
[Perform post-restore tasks] for more information.

## Read Replicas

[Read replicas][35] can be used to increase the MySQL read throughput,
improve performance for regional users and to implement disaster
recovery. When creating one or more read replicas, be aware that
additional charges will apply for the same compute and storage as the
primary server.

## Deleted Servers

If an administrator or bad actor deletes the server in the Azure Portal
or via automated methods, all backups and read replicas will also be
deleted. It is important that [resource locks][36] are created on the
Azure Database for MySQL resource group to add an extra layer of
deletion prevention to the instances.

## Regional Failure

Although rare, if a regional failure occurs geo-redundant backups or a
read replica can be used to get the data workloads running again. It is
best to have both geo-replication and a read replica available for the
best protection against unexpected regional failures.

> **Note** Changing the database server region also means the endpoint
> will change and application configurations will need to be updated
> accordingly.

### Load Balancers

If the application is made up of many different instances around the
world, it may not be feasible to update all of the clients. Utilize an
[Azure Load Balancer] or [Application Gateway] to implement a seamless
failover functionality. Although helpful and time-saving, these tools
are not required for regional failover capability.

## WWI Case Study

WWI wanted to test the failover capabilities of read replicas so they
performed the steps outlined below.

### Creating a read replica

-   Open the Azure Portal.
-   Browse to the Azure Database for MySQL instance.
-   Under **Settings**, select **Replication**.
-   Select **Add Replica**.
-   Type a server name.
-   Select the region.
-   Select **OK**, wait for the instance to deploy. Depending on the
    size of the main instance, it could take some time to replicate.

> **Note:** Each replica will incur additional charges equal to the main
> instance.

### Failover to read replica

Once a read replica has been created and has completed the replication
process, it can be used for failed over. Replication will stop during a
failover and make the read replica its own main instance.

Failover Steps:

-   Open the Azure Portal.
-   Browse to the Azure Database for MySQL instance.
-   Under **Settings**, select **Replication**.
-   Select one of the read replicas.
-   Select **Stop Replication**. This will break the read replica.
-   Modify all applications connection strings to point to the new main
    instance.

## BCDR Checklist

-   Modify backup frequency to meet requirements.
-   Setup read replicas for read intensive workloads and regional
    failover.
-   Create resource locks on resource groups.
-   Implement a load balancing strategy for applications for quick
    failover.

TODO -
https://semaphoreci.com/blog/7-continuous-integration-tools-for-php-laravel
\# Business Continuity and Disaster Recovery

Businesses implement *business continuity* (BC) and *disaster recovery*
(DR) strategies to minimize disruptions. While *business continuity*
emphasizes preserving business operations through policies, *disaster
recovery* explains how IT teams will restore access to data and
services.

## High Availability

Flexible Server implements high availability by provisioning another VM
to serve as a standby. It is possible to provision this secondary
Flexible Server VM in another availability zone, as shown below. This HA
option is only supported for Azure regions with availability zones.
While this option does provide redundancy against zonal failure, there
is more latency between the zones that affects replication.

![This image demonstrates Zone-Redundant HA for MySQL Flexible Server.]

To compensate for the latency challenges, Azure provides HA within a
single zone. In this configuration, both the primary node and the
standby node are in the same zone. All Azure regions support this mode.
Of course, it does not insulate against zonal failure.

![This image demonstrates HA for MySQL Flexible Server in a single
zone.]

Both of these HA solutions have transparent failover: in a failover
event, the standby server becomes the primary server, and DNS records
point to the new primary. If the old primary comes back online, it
becomes the secondary.

Critically, note that replication is not synchronous to avoid the
performance penalty of synchronous replication. A transaction committed
to the primary node is not necessarily committed to the secondary node;
the secondary node is brought up to the latest committed transaction
during failover.

To learn more about HA with MySQL Flexible Server, consult the
[documentation.]

### Implementing Cross-Region High Availability

Flexible Server does not currently support cross-region high
availability. However, it is possible to achieve this using MySQL native
replication, instead of replicating log files at the Azure storage
level. The image below demonstrates two Flexible Server instances
deployed in two virtual networks in two Azure regions. The virtual
networks are peered to provide network connectivity for MySQL native
replication. As the image indicates, developers can employ MySQL native
replication for scenarios like replicating from an on-premises primary
to an Azure secondary.

One disadvantage of this setup is that it is customer-managed.

![This image demonstrates a possible cross-region HA scenario using two
virtual networks.]

## Backup and Restore

Flexible Server takes backups of data and transaction log files. These
backups can be stored in locally-redundant storage (replicated multiple
times in a datacenter); zone-redundant storage (multiple copies are
stored in two separate availability zones in a region); and
geo-redundant storage (multiple copies are stored in two separate Azure
regions).

By default, backups are retained for seven days, though the retention
time is configurable from 1 to 35 days. Data file backups are taken once
daily, while transaction log backups are taken every five minutes.

Azure provides the same amount of backup storage as the provisioned
server storage for no cost. However, additional backup storage is
charged monthly. A higher backup retention period increases backup
storage consumption. Find additional pricing details for Flexible Server
[here.]

Lastly, note that performing a restore from a backup provisions a new
Flexible Server instance. Most of the new server's configuration is
inherited from the old server, though it depends on the type of restore
performed.

Learn more about backup and restore in Flexible Server from the
[Microsoft documentation.][37]

### Flexible Server Samples

-   [Point-in-time restore with Azure portal]
-   [Point-in-time restore with CLI]

### Single Server Samples

-   [Restore with Azure portal]
-   [Restore with Azure CLI]
-   [Restore with Azure PowerShell]

# Replication

Replication in Flexible Server allows applications to scale by providing
**read-only** replicas to serve queries while dedicating write
operations to the main Flexible Server instance. Replication from the
main instance to the read replicas is asynchronous: consequently, there
is lag between the source instance and the replicas. Microsoft estimates
that this lag typically ranges between a few seconds to a few minutes.

> Replication is not a high availability strategy: consult the BCDR
> document for more details. Replication is designed to improve
> application performance, so it does not support automatic failover or
> bringing replicas up to the latest committed transaction during
> failover.

Replication is only supported in the General Purpose and Memory
Optimized tiers of Flexible Server. Also, it is possible to promote a
read replica to being a read-write instance; however, that severs the
replication link between the main instance and the former replica, as
the former replica cannot return to being a replica.

## Use Cases

Often, developers use load balancers, like ProxySQL, to direct read
operations to read replicas automatically. ProxySQL can [run on an Azure
VM] or [Azure Kubernetes Service.]

Moreover, analytical systems often benefit from read replicas. BI tools
can connect to read replicas, while data is written to the main instance
and replicated to the read replicas asynchronously.

Using read replicas also helps implement microservices architectures.
The image below demonstrates how APIs that solely access data can
connect to read replicas, while APIs that modify data reference the main
instance.

![This image demonstrates a possible microservices architecture with
MySQL read replicas.]

## Configuring Read Replicas

### Flexible Server

-   [Azure portal][38]
-   [Azure CLI][39]

### Single Server

-   [Azure portal][40]
-   [Azure CLI & REST API]
-   [Azure PowerShell][41]

# Service Maintenance

Like any Azure service, Flexible Server receives patches and
functionality upgrades from Microsoft. To ensure that planned
maintenance does not blindside administrators, Azure provides them
control over when patching occurs.

With Flexible Server, administrators can specify a custom **Day of
week** and **Start time** for maintenance, or they can let the platform
choose a day of week and time. If the maintenance schedule is chosen by
the platform, maintenance will always occur between 11 PM and 7 AM in
the region time zone.

> See [this][42] list from Microsoft to determine the physical location
> of Azure regions and thus the regional time zone.

Azure always rolls out updates to servers with platform-managed
schedules before instances with custom schedules. Platform-managed
schedules allow developers to evaluate Flexible Server feature
improvements in non-production environments. Moreover, maintenance
events are relatively infrequent; there are typically 30 days of gap
unless a critical security fix must be applied.

> As a general rule, only set a maintenance schedule for production
> instances.

## Notifications

In most cases, irrespective of whether you configure a platform-managed
or custom maintenance schedule, Azure will notify you five days before a
maintenance event. The exception is critical security fixes.

Use Azure Service Health to view upcoming infrastructure updates and set
notifications. Refer to the links at the end of the document.

## Differences for Single Server

Single Server uses a gateway to access database instances, unlike
Flexible Server. These gateways have public IP addresses that are
retired and replaced, which may impede access from on-premises. Azure
notifies customers about gateway retirements three months before. Learn
more [here.][43]

Single Server does not support custom schedules for maintenance. Azure
notifies administrators 72 hours before the maintenance event.

## Configure Maintenance Scheduling & Alerting

-   [Manage scheduled maintenance settings using the Azure portal
    (Flexible Server)]
-   [View service health notifications in the Azure portal]
-   [Configure resource health alerts using Azure portal]

# MySQL Architectures

As you have progressed through this guide you have learned about various
ways to build and deploy applications using many different services in
Azure. Although we covered many topics, there are many other creative
ways one could build and deploy MySQL based services.

The [Azure Architecture center] provides many different examples of how
to create different architectures. Although some of them utlize other
database persistence technologies, these could easily be subsituted with
Azure Database for MySQL.

## Sample Architectures

The following are a few examples of architectures using different
patterns and focused on various industries from the Azure Architecture
Center.

### Digital marketing using Azure Database for MySQL

-   [Digital marketing using Azure Database for MySQL]

### Finance management apps using Azure Database for MySQL

-   [Finance management apps using Azure Database for MySQL]

### Intelligent apps using Azure Database for MySQL

-   [Intelligent apps using Azure Database for MySQL]

### Gaming using Azure Database for MySQL

-   [Gaming using Azure Database for MySQL]

### Retail and e-commerce using Azure MySQL

-   [Retail and e-commerce using Azure MySQL]

### Scalable web and mobile applications using Azure Database for MySQL

-   [Scalable web and mobile applications using Azure Database for
    MySQL] \# Customer Stories

Azure Database for MySQL is used by customers all over the world and
many have shared their stories on the [Microsoft Customer Stories
portal].

## Case Studies

The following are a set of case studies from the Microsoft Customer
Stories page focused on the usage of Azure Database for MySQL.

### TODO

TODO \# Zero to Hero

Now that you have read through this entire guide, you can now assess
where you are in your application and MySQL evolution and knowledge and
determine what things you need to do to take your application
architecture to the next level.

## Determining your evolutionary period

In module 4, we explored an evolution from classic development and
deployment to current modern methods. It is important to understand
where you are now and where you would like to be in the future.

## Summary of Tasks

-   Have the right tools available
-   Determine how you are going to deploy your application
-   Utilize code repositories with CI/CD enabled
-   Ensure you have configured the target environment to support your
    workloads
-   Secure your application configurations
-   Secure your database configurations
-   Secure your virtual networks
-   Monitor your applications and database workloads for performance
-   Perform regular testing
-   Ensure you have setup policies and procedures for auditing your
    application and database workloads
-   Setup backup and restore based on your RTO and RPO objectives
-   Be familiar with potential issues and how to remediate them \#
    Summary

We hope you have found this guide insightful and rich with information
on how to get started with developing with Azure Database for MySQL. You
should have a nice foundation for how to get setup with the right tools
and how to make decisions on the target deployment model. We provided
several sample architectures and real world customers that are using
Azure Database for MySQL that can be referenced in your platform
selection decisions.

Although there are several options for hosting MySQL in Azure, the
preferred method is to utilize Azure Database for MySQL Flexible Server
for its rich set of features and flexability.

# Resources

## Questions and Feedback

For any questions or suggestions about working with Azure Database for
MySQL, send an email to the Azure Database for MySQL Team
(AskAzureDBforMySQL\@service.microsoft.com). Please note that this
address is for general questions rather than support tickets.

In addition, consider these points of contact as appropriate:

-   To contact Azure Support or fix an issue with your account, [file a
    ticket from the Azure portal].
-   To provide feedback or to request new features, create an entry via
    [UserVoice].

## Find a partner to assist in migrating

This guide can be overwhelming, but don't fret! There are many experts
in the community with a proven migration track record. [Search for a
Microsoft Partner] or [Microsoft MVP] to help with finding the most
appropriate migration strategy. You are not alone!

You can also browse the technical forums and social groups for more
detailed real-world information:

-   [Microsoft Community Forum]
-   [StackOverflow for Azure MySQL]
-   [Azure Facebook Group]
-   [LinkedIn Azure Group]
-   [LinkedIn Azure Developers Group]

  [Azure MySQL Developer Guide]: #azure-mysql-developer-guide
  [Introduction and common use cases for MySQL]: #introduction-and-common-use-cases-for-mysql
  [Comparison with Other RDBMS offerings]: #comparison-with-other-rdbms-offerings
  [Infrastructure deployment models]: #infrastructure-deployment-models
  [Introduction to Azure and hosting options]: #introduction-to-azure-and-hosting-options
  [Advantages of choosing Azure]: #advantages-of-choosing-azure
  [MySQL on Azure Hosting Options]: #mysql-on-azure-hosting-options
  [Introduction to Azure resource management]: #introduction-to-azure-resource-management
  [The Azure Resource Management Hierarchy]: #the-azure-resource-management-hierarchy
  [Create your Landing zone]: #create-your-landing-zone
  [Automating and managing with Azure services]: #automating-and-managing-with-azure-services
  [Azure Management Tools]: #azure-management-tools
  [Azure Deployment resources]: #azure-deployment-resources
  [Introduction to Azure Database for MySQL deployment options]: #introduction-to-azure-database-for-mysql-deployment-options
  [Azure Database for MySQL Deployment Modes]: #azure-database-for-mysql-deployment-modes
  [Getting Started - Setup and Tools]: #getting-started---setup-and-tools
  [Azure Free Account]: #azure-free-account
  [Azure Subscriptions and Limits]: #azure-subscriptions-and-limits
  [Azure Authentication]: #azure-authentication
  [Development editor tools]: #development-editor-tools
  [Development languages]: #development-languages
  [Example Code]: #example-code
  [Application Connectors]: #application-connectors
  [Resources]: #resources
  [1]: #example-code-1
  [2]: #application-connectors-1
  [Tooling]: #tooling
  [Python Language Support]: #python-language-support
  [3]: #example-code-2
  [4]: #application-connectors-2
  [5]: #resources-2
  [Other Notable Languages for MySQL Apps]: #other-notable-languages-for-mysql-apps
  [.NET]: #net
  [Ruby]: #ruby
  [Provision Flexible Server and Database]: #provision-flexible-server-and-database
  [Azure Portal]: #azure-portal-1
  [Azure CLI]: #azure-cli
  [ARM Template]: #arm-template
  [Connect and Query Azure Database for MySQL using MySQL Workbench]: #connect-and-query-azure-database-for-mysql-using-mysql-workbench
  [Setup]: #setup
  [Instructions]: #instructions
  [Connect and Query Azure Database for MySQL Using the Azure CLI]: #connect-and-query-azure-database-for-mysql-using-the-azure-cli
  [6]: #setup-1
  [7]: #instructions-1
  [PHP Language Support]: #php-language-support
  [8]: #setup-2
  [9]: #instructions-2
  [10]: #python-language-support-1
  [11]: #setup-3
  [12]: #instructions-3
  [Java (Spring Boot) Language Support]: #java-spring-boot-language-support
  [13]: #setup-4
  [Run the App]: #run-the-app
  [Testing the App]: #testing-the-app
  [Stop the App]: #stop-the-app
  [End to End Development]: #end-to-end-development
  [Development Evolution]: #development-evolution
  [Classic Deployment]: #classic-deployment
  [Azure VM Deployment]: #azure-vm-deployment
  [Simple App Service Deployment with Azure Database for MySQL Single Server]:
    #simple-app-service-deployment-with-azure-database-for-mysql-single-server
  [App Service with InApp MySQL]: #app-service-with-inapp-mysql
  [Continous Integration (CI) and Continous Delivery (CD)]: #continous-integration-ci-and-continous-delivery-cd
  [Containerizing your layers with Docker]: #containerizing-your-layers-with-docker
  [Azure Container Instances (ACI)]: #azure-container-instances-aci
  [App Service Containers]: #app-service-containers
  [Azure Kubernetes Service (AKS)]: #azure-kubernetes-service-aks
  [AKS with MySQL Flexible Server]: #aks-with-mysql-flexible-server
  [Deploying a Laravel app backed by a Java REST API to AKS]: #deploying-a-laravel-app-backed-by-a-java-rest-api-to-aks
  [App Introduction]: #app-introduction
  [Provision the Database]: #provision-the-database
  [Create Docker Images]: #create-docker-images
  [Provision Azure Kubernetes Service]: #provision-azure-kubernetes-service
  [Deploy the API to Azure Kubernetes Service]: #deploy-the-api-to-azure-kubernetes-service
  [Deploy the Laravel App to Azure Kubernetes Service]: #deploy-the-laravel-app-to-azure-kubernetes-service
  [Browse to the App]: #browse-to-the-app
  [MySQL Migration]: #mysql-migration
  [Monitoring]: #monitoring
  [Azure Monitor]: #azure-monitor
  [MySQL Audit Logs]: #mysql-audit-logs
  [Metrics Resources]: #metrics-resources
  [Sample - Azure portal]: #sample---azure-portal
  [PowerShell Module]: #powershell-module
  [Alerting]: #alerting
  [Concepts]: #concepts
  [Authentication]: #authentication
  [Threat Protection]: #threat-protection
  [Encryption]: #encryption
  [Firewall]: #firewall
  [Security Checklist]: #security-checklist
  [Testing]: #testing
  [Tools]: #tools
  [Optimization]: #optimization
  [Monitoring Hardware and Query Performance]: #monitoring-hardware-and-query-performance
  [Query Performance Insight]: #query-performance-insight
  [Upgrading the Tier]: #upgrading-the-tier
  [Scale the Server]: #scale-the-server
  [Moving Regions]: #moving-regions
  [Optimization Checklist]: #optimization-checklist
  [Server Parameters]: #server-parameters
  [Tools to Set Server Parameters]: #tools-to-set-server-parameters
  [Server Parameters Best Practices]: #server-parameters-best-practices
  [Business Continuity and Disaster Recovery (BCDR)]: #business-continuity-and-disaster-recovery-bcdr
  [Backup and Restore]: #backup-and-restore
  [Read Replicas]: #read-replicas
  [Deleted Servers]: #deleted-servers
  [Regional Failure]: #regional-failure
  [WWI Case Study]: #wwi-case-study
  [BCDR Checklist]: #bcdr-checklist
  [High Availability]: #high-availability
  [14]: #backup-and-restore-1
  [Replication]: #replication
  [Use Cases]: #use-cases
  [Configuring Read Replicas]: #configuring-read-replicas
  [Service Maintenance]: #service-maintenance
  [Notifications]: #notifications
  [Differences for Single Server]: #differences-for-single-server
  [Configure Maintenance Scheduling & Alerting]: #configure-maintenance-scheduling-alerting
  [MySQL Architectures]: #mysql-architectures
  [Sample Architectures]: #sample-architectures
  [Case Studies]: #case-studies
  [Determining your evolutionary period]: #determining-your-evolutionary-period
  [Summary of Tasks]: #summary-of-tasks
  [15]: #resources-3
  [Questions and Feedback]: #questions-and-feedback
  [Find a partner to assist in migrating]: #find-a-partner-to-assist-in-migrating
  [MySQL]: https://www.mysql.com/
  [Microsoft Azure]: https://portal.azure.com/
  [The diagram shows the progression of development evolution in the guide.]:
    media/mysql-journey.png "MySQL Journey"
  [Azure Database for MySQL]: https://docs.microsoft.com/en-us/azure/mysql/
  [Azure Marketplace]: https://azuremarketplace.microsoft.com/en-us/marketplace/
  [SQL -- Structured Query Language]: https://en.wikipedia.org/wiki/SQL
  [MySQL Documentation]: https://dev.mysql.com/doc/refman/8.0/en/features.html
  [WordPress]: https://wordpress.org/
  [Drupal]: https://www.drupal.org/
  [LAMP]: https://en.wikipedia.org/wiki/LAMP_(software_bundle)
  [MariaDB]: https://mariadb.org/
  [Oracle purchased Sun Microsystems]: https://www.oracle.com/webfolder/college-recruiting/projects/mysql.html#.YexR-P7ML8o
  [PostgreSQL]: https://www.postgresql.org/
  [Azure Database for PostgreSQL]: https://docs.microsoft.com/en-us/azure/postgresql/overview
  [in Microsoft Learn.]: https://docs.microsoft.com/learn/modules/deploy-mariadb-mysql-postgresql-azure/2-describe-open-source-offerings
  [Docker image]: https://hub.docker.com/_/mysql
  [Azure Partner Builder's Program]: https://partner.microsoft.com/marketing/azure-isv-technology-partners
  [Visual Studio]: https://visualstudio.microsoft.com/
  [Azure DevOps]: https://dev.azure.com/
  [GitHub]: https://github.com/
  [Power Apps]: https://powerapps.microsoft.com/en-us/
  [2020 McKinsey & Company report.]: https://azure.microsoft.com/mediahandler/files/resourcefiles/developer-velocity-how-software-excellence-fuels-business-performance/Developer-Velocity-How-software-excellence-fuels-business-performance-v4.pdf
  [This image demonstrates common development tools on the Microsoft cloud platform to expedite application development.]:
    media/ISV-Tech-Builders-tools.png "Microsoft cloud tooling"
  [free subscription]: https://azure.microsoft.com/free/search/
  [Diagram shows the cloud adoption strategy.]: media/cloud-adoption-strategies.png
    "Cloud adoption strategy"
  [16]: https://azure.microsoft.com/services/mysql/#features
  [Microsoft Learn.]: https://docs.microsoft.com/learn/modules/cmu-cloud-computing-overview/4-building-blocks
  [Azure Fundamentals Microsoft Learn Module]: https://docs.microsoft.com/learn/modules/intro-to-azure-fundamentals/
  [IaaS and PaaS Azure service classification and categories]: ./media/azure-services.png
    "Categories of Azure services"
  [Virtual Machines (IaaS)]: https://docs.microsoft.com/en-us/azure/virtual-machines/windows/overview
  [Azure App Service (PaaS)]: https://docs.microsoft.com/en-us/azure/app-service/overview
  [Azure Container Instances (PaaS)]: https://docs.microsoft.com/en-us/azure/container-instances/container-instances-overview
  [Azure Kubernetes Service (PaaS)]: https://docs.microsoft.com/en-us/azure/aks/intro-kubernetes
  [Azure Fundamentals Microsoft Learn]: https://docs.microsoft.com/learn/modules/intro-to-azure-fundamentals/tour-of-azure-services
  [Management groups]: https://docs.microsoft.com/en-us/azure/governance/management-groups/overview
  [Resource groups]: https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/manage-resource-groups-portal
  [This image shows Azure resource scopes.]: ./media/scope-levels.png
    "fig:Azure resource scopes"
  [Azure Landing zone]: https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/ready/landing-zone/
  [Azure Resource Manager]: https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/overview
  [17]: https://docs.microsoft.com/en-us/cli/azure/what-is-azure-cli
  [Azure PowerShell]: https://docs.microsoft.com/en-us/powershell/azure/what-is-azure-powershell?view=azps-7.1.0
  [Azure REST API]: https://docs.microsoft.com/en-us/rest/api/azure/
  [Identity and access management (IAM)]: https://docs.microsoft.com/en-us/azure/role-based-access-control/overview
  [This image demonstrates how the Azure Resource Manager provides a robust, secure interface to Azure resources.]:
    media/consistent-management-layer.png
    "Azure Resource Manager explained"
  [Azure service management tool maturity progression.]: media/azure-management-tool-maturity.png
    "Azure service management tool"
  [Azure mobile app]: https://azure.microsoft.com/en-us/get-started/azure-portal/mobile-app/
  [The picture shows the some of the initial Azure service list.]: media/azure-portal-services.png
    "Azure Portal Services"
  [Shows an example of the Azure CLI.]: media/azure-cli-example.png
    "Azure CLI Example"
  [Azure command-line tool guide]: https://docs.microsoft.com/en-us/azure/developer/azure-cli/choose-the-right-azure-command-line-tool
  [Azure Cloud Shell]: shell.azure.com
  [download the CLI tools from Microsoft.]: https://docs.microsoft.com/cli/azure/install-azure-cli
  [installation document.]: https://docs.microsoft.com/powershell/azure/install-az-ps?view=azps-6.6.0
  [Infrastructure as Code (Iac)]: https://docs.microsoft.com/en-us/devops/deliver/what-is-infrastructure-as-code
  [ARM templates]: https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/
  [The picture shows an example of an ARM template JSON export.]: media/azure-template-json-example.png
    "Azure Template JSON"
  [Bicep]: https://docs.microsoft.com/en-us/azure/azure-resource-manager/bicep/overview
  [Terraform]: https://docs.microsoft.com/en-us/azure/developer/terraform/overview
  [resource tags]: https://docs.microsoft.com/azure/azure-resource-manager/management/tag-resources?tabs=json
  [resource locks]: https://docs.microsoft.com/azure/azure-resource-manager/management/lock-resources?tabs=json
  [multiple support plans for businesses]: https://azure.microsoft.com/support/plans/
  [StackOverflow Azure Tag]: https://stackoverflow.com/questions/tagged/azure
  [Azure Certifications & Exams]: https://docs.microsoft.com/learn/certifications/browse/?products=azure
  [Microsoft Learn]: https://docs.microsoft.com/learn/
  [Azure Fundamentals (AZ-900) Learning Path]: https://docs.microsoft.com/learn/paths/az-900-describe-cloud-concepts/
  [MySQL Workbench]: https://www.mysql.com/products/workbench/
  [This image demonstrates the control plane for Azure PaaS MySQL.]: ./media/mysql-conceptual-diagram.png
    "Control plane for Azure PaaS MySQL"
  [Choose the right MySQL Server option in Azure]: https://docs.microsoft.com/azure/mysql/select-right-deployment-type
  [pause the Single Server offering]: https://docs.microsoft.com/azure/mysql/how-to-stop-start-server
  [SLA of 99.99%]: https://azure.microsoft.com/updates/azure-database-for-mysql-general-availability/
  [Microsoft Learn Module.]: https://docs.microsoft.com/learn/modules/choose-azure-services-sla-lifecycle/
  [Flexible Server can also be paused]: https://docs.microsoft.com/azure/mysql/flexible-server/how-to-restart-stop-start-server-cli
  [This image demonstrates how MySQL Flexible Server works, with compute, storage, and backup storage.]:
    ./media/flexible-server.png "Operation of MySQL Flexible Server"
  [this video by Data Exposed]: https://docs.microsoft.com/shows/data-exposed/top-3-reasons-to-consider-azure-database-for-mysql-flexible-server/
  [Data Exposed]: https://docs.microsoft.com/shows/data-exposed/
  [Azure Pricing Calculator]: https://azure.microsoft.com/pricing/calculator/
  [Azure TCO Calculator]: https://azure.microsoft.com/pricing/tco/calculator/
  [detailed list of the limitations of Flexible Server]: https://docs.microsoft.com/azure/mysql/flexible-server/concepts-limitations
  [Innovate faster with fully managed MySQL and an Azure free account]: https://azure.microsoft.com/en-in/free/mysql/
  [Azure's comprehensive list of service and subscription limits]: https://docs.microsoft.com/azure/azure-resource-manager/management/azure-subscription-service-limits
  [Microsoft docs.]: https://docs.microsoft.com/azure/mysql/concepts-azure-ad-authentication
  [Microsoft download page.]: https://code.visualstudio.com/download
  [18]: https://marketplace.visualstudio.com/items?itemName=formulahendry.vscode-mysql
  [Connect and Query sample for PHP]: ./03_Connect_Query_PHP.md
  [Backend libraries for mysqli and PDO_MySQL]: https://www.php.net/manual/en/mysqlinfo.library.choosing.php
  [Introduction to PDO]: https://www.php.net/manual/en/intro.pdo.php
  [PDO_MYSQL Reference]: https://www.php.net/manual/en/ref.pdo-mysql.php
  [Connect and Query sample for Java]: ./03_Connect_Query_Java_IntelliJ.md
  [MySQL drivers and management tools compatible with Azure Database for MySQL]:
    https://docs.microsoft.com/azure/mysql/concepts-compatibility
  [MySQL Connector/J Introduction]: https://dev.mysql.com/doc/connector-j/8.0/en/connector-j-overview.html
  [Single Server]: https://docs.microsoft.com/azure/mysql/connect-java
  [Flexible Server]: https://docs.microsoft.com/azure/mysql/flexible-server/connect-java
  [Introduction to Spring Data JPA]: https://www.baeldung.com/the-persistence-layer-with-spring-data-jpa
  [Hibernate ORM]: https://hibernate.org/orm/
  [Installing the Azure Toolkit for Eclipse]: https://docs.microsoft.com/azure/developer/java/toolkit-for-eclipse/installation
  [Create a Hello World web app for Azure App Service using Eclipse]: https://docs.microsoft.com/azure/developer/java/toolkit-for-eclipse/create-hello-world-web-app
  [End-to-End development story.]: ../04_EndToEndDev/04_End_To_End_Development.md
  [Maven Introduction]: https://maven.apache.org/guides/getting-started/index.html
  [Develop Java web app on Azure using Maven (App Service)]: https://docs.microsoft.com/learn/modules/publish-web-app-with-maven-plugin-for-azure-app-service/
  [Deploy Spring microservices to Azure (Spring Cloud)]: https://docs.microsoft.com/learn/modules/azure-spring-cloud-workshop/
  [Develop Java serverless Functions on Azure using Maven]: https://docs.microsoft.com/learn/modules/develop-azure-functions-app-with-maven-plugin/
  [Connect and Query sample for Python.]: ./03_Connect_Query_Python.md
  [Introduction to MySQL Connector/Python]: https://dev.mysql.com/doc/connector-python/en/connector-python-introduction.html
  [PyMySQL Samples]: https://pymysql.readthedocs.io/en/latest/user/examples.html
  [MySQLdb (mysqlclient) User's Guide]: https://mysqlclient.readthedocs.io/user_guide.html#mysqldb
  [Django ORM Support for MySQL]: https://docs.djangoproject.com/en/3.2/ref/databases/#mysql-notes
  [MySQL Connector/NET]: https://github.com/mysql/mysql-connector-net
  [from the MySQL documentation]: https://dev.mysql.com/doc/connector-net/en/connector-net-entityframework-core.html
  [Async MySQL Connector for .NET]: https://github.com/mysql-net/MySqlConnector
  [*Mysql2*]: https://github.com/brianmario/mysql2
  [quickstart document]: https://docs.microsoft.com/azure/mysql/flexible-server/quickstart-create-server-portal
  [Azure's quickstart guide]: https://docs.microsoft.com/azure/mysql/flexible-server/quickstart-create-server-cli
  [`flexible-server create`]: https://docs.microsoft.com/cli/azure/mysql/flexible-server?view=azure-cli-latest#az_mysql_flexible_server_create
  [`flexible-server db create`]: https://docs.microsoft.com/cli/azure/mysql/flexible-server/db?view=azure-cli-latest#az_mysql_flexible_server_db_create
  [This image demonstrates the MySQL Flexible Server provisioned through Bash CLI commands.]:
    ./media/mysql-flex-params.png "CLI provisioning"
  [19]: https://docs.microsoft.com/azure/mysql/flexible-server/quickstart-create-arm-template#review-the-template
  [sample ARM template]: mysql-flexible-server-template.json
  [Provision MySQL Flexible Server]: 03_05_Provision_MySQL_Flexible_Server.md
  [MySQL Downloads.]: https://dev.mysql.com/downloads/workbench/
  [Use MySQL Workbench with Azure Database for MySQL Flexible Server]: https://docs.microsoft.com/azure/mysql/flexible-server/connect-workbench
  [SSL public certificate]: https://dl.cacerts.digicert.com/DigiCertGlobalRootCA.crt.pem
  [Add the SSL CA file on the SSL tab of the Setup New Connection dialog box.]:
    ./media/new-ssl-connection-with-ca-file.png "Add SSL CA file"
  [Quickstart: Connect and query with Azure CLI with Azure Database for MySQL - Flexible Server]:
    https://docs.microsoft.com/azure/mysql/flexible-server/connect-azure-cli#create-a-database
  [20]: ./03_05_Provision_MySQL_Flexible_Server.md
  [This image demonstrates running queries against the Flexible Server instance using the Azure CLI.]:
    ./media/analyst-query.png
    "Running an admin query from the Azure CLI"
  [this document.]: https://docs.microsoft.com/azure/mysql/howto-create-users?tabs=flexible-server
  [downloads page.]: https://windows.php.net/download/
  [quickstart guide]: https://docs.microsoft.com/azure/mysql/flexible-server/connect-php
  [Downloads page]: https://www.python.org/downloads/
  [Microsoft's sample]: https://docs.microsoft.com/azure/mysql/flexible-server/connect-python
  [working with Flexible Server in MySQL Workbench.]: 03_06_Query_MySQL_Workbench.md
  [IntelliJ IDEA]: https://www.jetbrains.com/idea/download
  [Azure Toolkit for IntelliJ]: https://plugins.jetbrains.com/plugin/8053-azure-toolkit-for-intellij/
  [this]: https://docs.microsoft.com/azure/developer/java/toolkit-for-intellij/sign-in-instructions
  [This image demonstrates the Azure Toolkit for IntelliJ plugin, with the Azure Database for MySQL node expanded.]:
    ./media/azure-explorer-intellij.png
    "Azure Toolkit for IntelliJ plugin installation success"
  [gs-accessing-data-mysql]: https://github.com/spring-guides/gs-accessing-data-mysql
  [This image shows the complete project opened in IntelliJ in the Project tab.]:
    ./media/intellij-complete-spring-boot-project.png "Complete project"
  [This image demonstrates how to create a new MySQL Single Server instance from IntelliJ and populate it with the parameters above.]:
    ./media/intellij-create-single-server.png
    "Creating a new MySQL Single Server instance"
  [This image demonstrates Single Server MySQL connection information from the IntelliJ Azure explorer.]:
    ./media/mysql-instance-information.png
    "MySQL connection information"
  [This image demonstrates how to edit the application.properties file.]:
    ./media/edit-application-properties.png
    "Editing application.properties"
  [This image demonstrates the Azure Resource Connector dialog box.]: ./media/azure-resource-connector-intellij.png
    "Azure Resource Connector"
  [This image shows how to start the Spring Boot app from IntelliJ.]: ./media/start-app-intellij.png
    "Starting Spring Boot app"
  [This image shows how to make a POST request to the Java app endpoint.]:
    ./media/post-request-postman.png "POST to endpoint"
  [This image shows how to make a GET request to the Java app endpoint.]:
    ./media/get-request-postman.png "GET request from Postman"
  [This image shows the user data persisted to the MySQL Single Server instance with a query in MySQL Workbench.]:
    ./media/result-set-mysql-workbench.png
    "Data persisted to Single Server"
  [Classic Deployment to PHP enabled IIS server]: ./../artifacts/01-ClassicDeploy/README.md
  [Cloud Deployment to Azure VM]: ./../artifacts/02-01-CloudDeploy-Vm/README.md
  [Cloud Deployment to Azure App Service]: ./../artifacts/02-02-CloudDeploy-AppSvc/README.md
  [App Service Plan]: https://azure.microsoft.com/en-us/pricing/details/app-service/windows/
  [Announcing Azure App Service MySQL in-app]: https://azure.microsoft.com/en-us/blog/mysql-in-app-preview-app-service/
  [Cloud Deployment to Azure App Service with MySQL InApp]: ./../artifacts/02-03-CloudDeploy-InApp/README.md
  [Deployment via CI/CD]: ./../artifacts/02-04-CloudDeploy-CICD/README.md
  [Migrate to Docker Containers]: ./../artifacts/03-00-Docker/README.md
  [Migrate to Azure Container Instances (ACI)]: ./../artifacts/03-01-CloudDeploy-ACI/README.md
  [Migrate to Azure App Service Containers]: ./../artifacts/03-02-CloudDeploy-AppService-Container/README.md
  [Migrate to Azure Kubernetes Services (AKS)]: ./../artifacts/04-AKS/README.md
  [Utilize AKS and Azure Database for MySQL Flexible Server]: ./../artifacts/05-CloudDeploy-MySQLFlex/README.md
  [Microsoft documentation]: https://docs.microsoft.com/azure/mysql/flexible-server/tutorial-deploy-springboot-on-aks-vnet
  [This image demonstrates the IP address of the LoadBalancer service for the Laravel app.]:
    ./media/laravel-service-ip.png "Laravel service IP address"
  [This image demonstrates that the Laravel app functions without a problem when deployed to AKS.]:
    ./media/app-loads-aks.png "Laravel app loads"
  [Migrate MySQL on-premises to Azure Database for MySQL]: https://docs.microsoft.com/azure/mysql/migrate/mysql-on-premises-azure-db/01-mysql-migration-guide-intro
  [21]: https://docs.microsoft.com/en-us/azure/azure-monitor/overview
  [Log Analytics]: https://docs.microsoft.com/en-us/azure/azure-monitor/platform/design-logs-deployment
  [Azure Sentinel]: https://docs.microsoft.com/en-us/azure/sentinel/overview
  [Azure run books]: https://docs.microsoft.com/en-us/azure/automation/automation-quickstart-create-runbook
  [Kusto Query Language (KQL)]: https://docs.microsoft.com/en-us/azure/data-explorer/kusto/query/
  [here]: https://docs.microsoft.com/en-us/azure/data-explorer/kusto/query/sqlcheatsheet
  [Get started with log queries in Azure Monitor]: https://docs.microsoft.com/en-us/azure/azure-monitor/log-query/get-started-queries
  [22]: https://docs.microsoft.com/azure/mysql/flexible-server/concepts-monitoring
  [23]: https://docs.microsoft.com/azure/mysql/concepts-monitoring
  [audit log feature is disabled]: https://docs.microsoft.com/en-us/azure/mysql/concepts-audit-logs
  [diagnostic logging]: https://docs.microsoft.com/en-us/azure/mysql/howto-configure-audit-logs-portal#set-up-diagnostic-logs
  [Single Server Audit Logs]: https://docs.microsoft.com/azure/mysql/concepts-audit-logs
  [Flexible Server Audit Logs]: https://docs.microsoft.com/azure/mysql/flexible-server/concepts-audit-logs
  [Configure and access audit logs for Azure Database for MySQL in the Azure portal]:
    https://docs.microsoft.com/en-us/azure/mysql/howto-configure-audit-logs-portal
  [This image demonstrates a sample query of the Activity Log from the Logs tab of the Azure portal.]:
    ./media/activity-log-sample-query.png "Activity log sample query"
  [This image demonstrates the query results from the opened sample.]: ./media/activity-log-query-results.png
    "Sample query output"
  [Configure audit logs (Azure portal)]: https://docs.microsoft.com/azure/mysql/flexible-server/tutorial-configure-audit
  [Configure and access audit logs in the Azure portal]: https://docs.microsoft.com/azure/mysql/howto-configure-audit-logs-portal
  [Configure and access audit logs in the Azure CLI]: https://docs.microsoft.com/azure/mysql/howto-configure-audit-logs-cli
  [Write your first query with Kusto Query Language (Microsoft Learn)]: https://docs.microsoft.com/learn/modules/write-first-query-kusto-query-language/
  [Azure Monitor Logs Overview]: https://docs.microsoft.com/azure/azure-monitor/logs/data-platform-logs
  [Azure CLI reference commands for Azure Monitor]: https://docs.microsoft.com/cli/azure/azure-cli-reference-for-monitor
  [Monitor and scale an Azure Database for MySQL Flexible Server using Azure CLI]:
    https://docs.microsoft.com/azure/mysql/flexible-server/scripts/sample-cli-monitor-and-scale
  [Set up alerts on metrics for Azure Database for MySQL - Flexible Server]:
    https://docs.microsoft.com/azure/mysql/flexible-server/how-to-alert-on-metric
  [Tutorial: Analyze metrics for an Azure resource]: https://docs.microsoft.com/azure/azure-monitor/essentials/tutorial-metrics
  [REST API Walkthrough]: https://docs.microsoft.com/azure/azure-monitor/essentials/rest-api-walkthrough
  [Azure Monitor REST API Reference]: https://docs.microsoft.com/rest/api/monitor/
  [This image demonstrates the alert rule configuration and the configured action groups.]:
    ./media/aborted-connections-alert-rule.png
    "AbortedConnections alert rule and ServerNotifications action group"
  [This image demonstrates the Azure Monitor alert rule sent to my email after attempting multiple failed connections.]:
    ./media/alert-rule-sent-to-email.png "Azure Monitor alert rule"
  [Tutorial: Design an Azure Database for MySQL using PowerShell]: https://docs.microsoft.com/en-us/azure/mysql/tutorial-design-database-using-powershell
  [How to back up and restore an Azure Database for MySQL server using PowerShell]:
    https://docs.microsoft.com/en-us/azure/mysql/howto-restore-server-powershell
  [Configure server parameters in Azure Database for MySQL using PowerShell]:
    https://docs.microsoft.com/en-us/azure/mysql/howto-configure-server-parameters-using-powershell
  [Auto grow storage in Azure Database for MySQL server using PowerShell]:
    https://docs.microsoft.com/en-us/azure/mysql/howto-auto-grow-storage-powershell
  [How to create and manage read replicas in Azure Database for MySQL using PowerShell]:
    https://docs.microsoft.com/en-us/azure/mysql/howto-read-replicas-powershell
  [Restart Azure Database for MySQL server using PowerShell]: https://docs.microsoft.com/en-us/azure/mysql/howto-restart-server-powershell
  [log alerts]: https://docs.microsoft.com/en-us/azure/azure-monitor/platform/alerts-unified-log
  [Azure Automation Runbooks]: https://docs.microsoft.com/azure/automation/automation-runbook-types
  [Microsoft blog]: https://azure.microsoft.com/blog/best-practices-for-alerting-on-metrics-with-azure-database-for-mysql-monitoring/
  [scale storage to increase IOPS capacity or provision additional IOPS]:
    https://docs.microsoft.com/azure/mysql/flexible-server/concepts-compute-storage
  [basic authentication mechanisms]: https://docs.microsoft.com/azure/mysql/howto-create-users
  [integration with Azure Active Directory]: https://docs.microsoft.com/en-us/azure/mysql/concepts-azure-ad-authentication
  [Configuring Active Directory integration]: https://docs.microsoft.com/en-us/azure/mysql/howto-configure-sign-in-azure-ad-authentication
  [Azure Identity Protection]: https://docs.microsoft.com/en-us/azure/active-directory/identity-protection/overview-identity-protection
  [Azure Threat Protection]: https://docs.microsoft.com/en-us/azure/mysql/concepts-data-access-and-security-threat-protection
  [Microsoft Defender for open-source relational databases]: https://docs.microsoft.com/azure/defender-for-cloud/defender-for-databases-introduction
  [Enable Microsoft Defender for open-source relational databases and respond to alerts]:
    https://docs.microsoft.com/azure/defender-for-cloud/defender-for-databases-usage
  [bring your own key (BYOK)]: https://docs.microsoft.com/en-us/azure/mysql/concepts-data-encryption-mysql
  [Azure Key Vault]: https://docs.microsoft.com/en-us/azure/key-vault/general/basic-concepts
  [add double encryption]: https://docs.microsoft.com/en-us/azure/mysql/concepts-infrastructure-double-encryption
  [modify your applications]: https://docs.microsoft.com/en-us/azure/mysql/howto-configure-ssl
  [24]: https://docs.microsoft.com/azure/mysql/concepts-ssl-connection-security
  [25]: https://docs.microsoft.com/azure/mysql/flexible-server/how-to-connect-tls-ssl
  [firewall rules]: https://docs.microsoft.com/en-us/azure/mysql/concepts-firewall-rules
  [restrict public access]: https://docs.microsoft.com/en-us/azure/mysql/howto-deny-public-network-access
  [Virtual Network Peering]: https://docs.microsoft.com/en-us/azure/virtual-network/virtual-network-peering-overview
  [Azure Metrics]: https://docs.microsoft.com/en-us/azure/azure-monitor/platform/data-platform-metrics
  [Monitoring in Azure Database for MySQL]: https://docs.microsoft.com/en-us/azure/mysql/concepts-monitoring
  [Query Performance Insight tool]: https://docs.microsoft.com/en-us/azure/mysql/concepts-query-performance-insight
  [Upgrade from Basic to General Purpose or Memory Optimized tiers in Azure Database for MySQL]:
    https://techcommunity.microsoft.com/t5/azure-database-for-mysql/upgrade-from-basic-to-general-purpose-or-memory-optimized-tiers/ba-p/830404
  [Business Continuity and Disaster Recovery]: 03_BCDR.md
  [26]: https://docs.microsoft.com/en-us/azure/mysql/concepts-server-parameters
  [27]: https://docs.microsoft.com/azure/mysql/flexible-server/concepts-server-parameters
  [log_bin_trust_function_creators]: https://dev.mysql.com/doc/refman/8.0/en/replication-options-binary-log.html#sysvar_log_bin_trust_function_creators
  [innodb_buffer_pool_size]: https://dev.mysql.com/doc/refman/8.0/en/innodb-parameters.html#sysvar_innodb_buffer_pool_size
  [28]: https://docs.microsoft.com/en-us/azure/mysql/flexible-server/concepts-server-parameters
  [innodb_file_per_table]: https://dev.mysql.com/doc/refman/8.0/en/innodb-parameters.html#sysvar_innodb_file_per_table
  [Microsoft documentation.]: https://docs.microsoft.com/azure/mysql/concepts-server-parameters
  [29]: https://docs.microsoft.com/azure/mysql/flexible-server/how-to-configure-server-parameters-portal
  [30]: https://docs.microsoft.com/azure/mysql/flexible-server/how-to-configure-server-parameters-cli
  [31]: https://docs.microsoft.com/azure/mysql/howto-server-parameters
  [32]: https://docs.microsoft.com/azure/mysql/howto-configure-server-parameters-using-cli
  [33]: https://docs.microsoft.com/azure/mysql/howto-configure-server-parameters-using-powershell
  [This graph demonstrates the performance benefits of thread pooling for a Flexible Server instance.]:
    ./media/thread-pooling-performance.png
    "Performance benefits of thread pooling"
  [Microsoft TechCommunity post]: https://techcommunity.microsoft.com/t5/azure-database-for-mysql-blog/achieve-up-to-a-50-performance-boost-in-azure-database-for-mysql/ba-p/2909691
  [34]: https://docs.microsoft.com/azure/mysql/concept-performance-best-practices
  [Backup and restore in Azure Database for MySQL]: https://docs.microsoft.com/en-us/azure/mysql/concepts-backup
  [Some regions]: https://docs.microsoft.com/en-us/azure/mysql/concepts-pricing-tiers#storage
  [Perform post-restore tasks]: https://docs.microsoft.com/en-us/azure/mysql/concepts-backup#perform-post-restore-tasks
  [35]: https://docs.microsoft.com/en-us/azure/mysql/concepts-read-replicas
  [36]: https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/lock-resources
  [Azure Load Balancer]: https://docs.microsoft.com/en-us/azure/load-balancer/load-balancer-overview
  [Application Gateway]: https://docs.microsoft.com/en-us/azure/application-gateway/overview
  [This image demonstrates Zone-Redundant HA for MySQL Flexible Server.]:
    media/1-flexible-server-overview-zone-redundant-ha.png
    "Zone-Redundant HA"
  [This image demonstrates HA for MySQL Flexible Server in a single zone.]:
    ./media/flexible-server-overview-same-zone-ha.png
    "HA in a single zone"
  [documentation.]: https://docs.microsoft.com/azure/mysql/flexible-server/concepts-high-availability
  [This image demonstrates a possible cross-region HA scenario using two virtual networks.]:
    ./media/cross-region-ha.png "Cross-region HA scenario"
  [here.]: https://azure.microsoft.com/pricing/details/mysql/flexible-server/
  [37]: https://docs.microsoft.com/azure/mysql/flexible-server/concepts-backup-restore
  [Point-in-time restore with Azure portal]: https://docs.microsoft.com/azure/mysql/flexible-server/how-to-restore-server-portal
  [Point-in-time restore with CLI]: https://docs.microsoft.com/azure/mysql/flexible-server/how-to-restore-server-cli
  [Restore with Azure portal]: https://docs.microsoft.com/azure/mysql/howto-restore-server-portal
  [Restore with Azure CLI]: https://docs.microsoft.com/azure/mysql/howto-restore-server-cli
  [Restore with Azure PowerShell]: https://docs.microsoft.com/azure/mysql/howto-restore-server-powershell
  [run on an Azure VM]: https://techcommunity.microsoft.com/t5/azure-database-for-mysql-blog/load-balance-read-replicas-using-proxysql-in-azure-database-for/ba-p/880042
  [Azure Kubernetes Service.]: https://techcommunity.microsoft.com/t5/azure-database-for-mysql-blog/deploy-proxysql-as-a-service-on-kubernetes-using-azure-database/ba-p/1105959
  [This image demonstrates a possible microservices architecture with MySQL read replicas.]:
    ./media/microservices-with-replication.png
    "Possible microservices architecture"
  [38]: https://docs.microsoft.com/azure/mysql/flexible-server/how-to-read-replicas-portal
  [39]: https://docs.microsoft.com/azure/mysql/flexible-server/how-to-read-replicas-cli
  [40]: https://docs.microsoft.com/azure/mysql/howto-read-replicas-portal
  [Azure CLI & REST API]: https://docs.microsoft.com/azure/mysql/howto-read-replicas-cli
  [41]: https://docs.microsoft.com/azure/mysql/howto-read-replicas-powershell
  [42]: https://azure.microsoft.com/global-infrastructure/data-residency/#select-geography
  [43]: https://docs.microsoft.com/azure/mysql/concepts-connectivity-architecture
  [Manage scheduled maintenance settings using the Azure portal (Flexible Server)]:
    https://docs.microsoft.com/azure/mysql/flexible-server/how-to-maintenance-portal
  [View service health notifications in the Azure portal]: https://docs.microsoft.com/azure/service-health/service-notifications
  [Configure resource health alerts using Azure portal]: https://docs.microsoft.com/azure/service-health/resource-health-alert-monitor-guide
  [Azure Architecture center]: https://docs.microsoft.com/en-us/azure/architecture/
  [Digital marketing using Azure Database for MySQL]: https://docs.microsoft.com/en-us/azure/architecture/solution-ideas/articles/digital-marketing-using-azure-database-for-mysql
  [Finance management apps using Azure Database for MySQL]: https://docs.microsoft.com/en-us/azure/architecture/solution-ideas/articles/finance-management-apps-using-azure-database-for-mysql
  [Intelligent apps using Azure Database for MySQL]: https://docs.microsoft.com/en-us/azure/architecture/solution-ideas/articles/intelligent-apps-using-azure-database-for-mysql
  [Gaming using Azure Database for MySQL]: https://docs.microsoft.com/en-us/azure/architecture/solution-ideas/articles/gaming-using-azure-database-for-mysql
  [Retail and e-commerce using Azure MySQL]: https://docs.microsoft.com/en-us/azure/architecture/solution-ideas/articles/retail-and-ecommerce-using-azure-database-for-mysql
  [Scalable web and mobile applications using Azure Database for MySQL]:
    https://docs.microsoft.com/en-us/azure/architecture/solution-ideas/articles/scalable-web-and-mobile-applications-using-azure-database-for-mysql
  [Microsoft Customer Stories portal]: https://customers.microsoft.com/en-us/search?sq=%22Azure%20Database%20for%20MySQL%22&ff=&p=2&so=story_publish_date%20desc
  [file a ticket from the Azure portal]: https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade/overview
  [UserVoice]: https://feedback.azure.com/forums/597982-azure-database-for-mysql
  [Search for a Microsoft Partner]: https://www.microsoft.com/solution-providers/home
  [Microsoft MVP]: https://mvp.microsoft.com/MvpSearch
  [Microsoft Community Forum]: https://docs.microsoft.com/en-us/answers/topics/azure-database-mysql.html
  [StackOverflow for Azure MySQL]: https://stackoverflow.com/questions/tagged/azure-database-mysql
  [Azure Facebook Group]: https://www.facebook.com/groups/MsftAzure
  [LinkedIn Azure Group]: https://www.linkedin.com/groups/2733961/
  [LinkedIn Azure Developers Group]: https://www.linkedin.com/groups/1731317/
