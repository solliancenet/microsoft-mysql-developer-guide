# Introduction to hosting MySQL on Azure

Now that you understand the benefits of a MySQL deployment and a few common models to operate MySQL, this section explains approaches to host MySQL on Azure and the advantages of the Azure platform.

## Azure Platform

Microsoft announced Azure, formally known as Windows Azure, in 2008. At its inception, the only database offering that Windows Azure had was *SQL Azure*, based on Microsoft SQL Server. Ever since Windows Azure became generally available in 2010, Microsoft has made its cloud platform far more flexible, including support for open source databases such as MySQL and VM (IaaS) offerings. 

### Advantages

### Free Subscription Offering

To facilitate developers' adoption of Azure, Microsoft offers a [free subscription](https://azure.microsoft.com/free/search/) with $200 credit, applicable for thirty days; yearlong access to free quotas for popular services, including Azure Database for MySQL; and access to always free Azure service tiers.  

## MySQL on Azure Hosting Options

The concepts IaaS (Infrastructure as a Service) and PaaS (Platform as a Service) describe the responsibilities of the public cloud provider and the enterprise customer to manage their data. Both approaches are common to host MySQL on Azure.

### IaaS

In the IaaS model, developers deploy MySQL on Azure Virtual Machines. This provides the customer with the flexibility to choose when to patch the VM OS and MySQL engine, and the option to install other software on the database server, such as antivirus utilities. Microsoft is responsible for the underlying VM hardware that constitutes the Azure infrastructure.

Because IaaS MySQL hosting gives greater control over the MySQL database engine and the OS, many organizations choose it to migrate on-premises solutions while minimizing capital expenditure.

### PaaS (DBaaS)

In the PaaS model, developers deploy a managed MySQL environment on Azure. Unlike IaaS, they cede control over patching the MySQL engine and OS to the Azure platform, and Azure automates many administrative tasks, like providing high availability, backups, and protecting data.

Like IaaS, customers are still responsible for managing query performance, database access, and database objects, such as indexes. It is suitable for applications where the MySQL configuration exposed by Azure is sufficient and access to the OS is unnecessary.
