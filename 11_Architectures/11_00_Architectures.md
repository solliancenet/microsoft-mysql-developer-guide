# 11 / MySQL architectures

By progressing through this guide, there have been various ways presented to build and deploy applications using many different services in Azure.  Although we covered many topics, there are many other creative and different ways to build and deploy MySQL-based services.

The [Azure Architecture center](https://docs.microsoft.com/azure/architecture/) provides many different examples of how to create different architectures.  Although some of them utilize other database persistence technologies, these could easily be substituted with Azure Database for MySQL - Flexible Server.  

## Sample architectures

The following are a few examples of architectures using different patterns and focused on various industries from the Azure Architecture Center.

### Digital marketing using Azure Database for MySQL

- [Digital marketing using Azure Database for MySQL:](https://docs.microsoft.com/azure/architecture/solution-ideas/articles/digital-marketing-using-azure-database-for-mysql) In this architecture, corporations serve digital marketing campaigns through content management systems, like WordPress or Drupal, running on Azure App Service. These CMS offerings access user data in PaaS MySQL. Azure Cache for Redis caches data and sessions, while Azure Application Insights monitors the CMS app for issues and performance.

### Finance management apps using Azure Database for MySQL

- [Finance management apps using Azure Database for MySQL:](https://docs.microsoft.com/azure/architecture/solution-ideas/articles/finance-management-apps-using-azure-database-for-mysql) This architecture demonstrates a three-tier app, coupled with advanced analytics served by Power BI. Tier-3 clients, like mobile applications, access tier-2 APIs, which reference tier-1 PaaS MySQL. To offer additional value, [Power BI](https://docs.microsoft.com/power-bi/fundamentals/power-bi-overview) accesses PaaS MySQL (possibly read replicas) through its MySQL connector.

### Intelligent apps using Azure Database for MySQL

- [Intelligent apps using Azure Database for MySQL:](https://docs.microsoft.com/azure/architecture/solution-ideas/articles/intelligent-apps-using-azure-database-for-mysql) This solution demonstrates an innovative app that utilizes serverless computing (Azure Function Apps), machine learning (Azure Machine Learning Studio & Cognitive Services APIs), PaaS MySQL, and Power BI.

### Gaming using Azure Database for MySQL

- [Gaming using Azure Database for MySQL:](https://docs.microsoft.com/azure/architecture/solution-ideas/articles/gaming-using-azure-database-for-mysql) This architecture demonstrates how to develop apps that must process API requests at scale, such as gaming backends. It utilizes Azure Traffic Manager, to geographically distribute traffic; Azure API Management, to provide rate limiting, among other features; Azure App Service, to host gaming APIs; and PaaS MySQL. Firms can perform analysis on gaming data in PaaS MySQL using Azure HDInsight and visualize the data in Power BI.

### Retail and e-commerce using Azure MySQL

- [Retail and e-commerce using Azure MySQL:](https://docs.microsoft.com/azure/architecture/solution-ideas/articles/retail-and-ecommerce-using-azure-database-for-mysql) This application architecture focuses on processing transactions quickly and creating tailored customer experiences. It consists of Azure App Service, PaaS MySQL (for storing product and session information), and Azure Search (for full-text search capability).

### Scalable web and mobile applications using Azure Database for MySQL

- [Scalable web and mobile applications using Azure Database for MySQL:](https://docs.microsoft.com/azure/architecture/solution-ideas/articles/scalable-web-and-mobile-applications-using-azure-database-for-mysql) This generic architecture utilizes the scaling capabilities (vertical and horizontal) of Azure App Service and MySQL Flexible Server.
