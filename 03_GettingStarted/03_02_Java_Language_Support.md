### Java

This section describes tools to interact with Azure Database for MySQL Flexible Server through Java.

#### Example code

Refer to the [Quickstart: Use Java and JDBC with Azure Database for MySQL](https://docs.microsoft.com/azure/mysql/connect-java)

### Application connectors

*MySQL Connector/J* is a JDBC-compatible API that natively implements the MySQL protocol in Java, rather than utilizing client libraries. The Connect and Query sample does not directly utilize *MySQL Connector/J*, but Microsoft provides a sample that uses this technology.

To allow developers to focus on implementing business logic, applications commonly use persistence frameworks like Spring Data JPA. Spring Data JPA extends the JPA specification, which governs *object-relational mapping* (ORM) technologies in Java. It functions on top of JPA implementations, like the Hibernate ORM. The Connect and Query sample leverages Spring Data JPA and *MySQL Connector/J* to access the Azure MySQL instance and expose data through a web API.

Flexible Server is compatible with all Java client utilities for MySQL Community Edition. However, Microsoft has only validated *MySQL Connector/J* for use with Single Server due to its network connectivity setup. Refer to the [MySQL drivers and management tools compatible with Azure Database for MySQL](https://docs.microsoft.com/azure/mysql/concepts-compatibility) article for more information about drivers compatible with Single Server.

### Resources

1. [MySQL Connector/J Introduction](https://dev.mysql.com/doc/connector-j/8.0/en/connector-j-overview.html)
2. MySQL Connector/J Microsoft Samples
    - [Flexible Server](https://docs.microsoft.com/azure/mysql/flexible-server/connect-java)
    - [Single Server](https://docs.microsoft.com/azure/mysql/connect-java)

3. [Introduction to Spring Data JPA](https://www.baeldung.com/the-persistence-layer-with-spring-data-jpa)
4. [Hibernate ORM](https://hibernate.org/orm/)

### Tooling

#### IntelliJ IDEA

Flexible Server will be supported in the future.

#### Eclipse

Eclipse is another popular IDE for Java development. It supports extensions for enterprise Java development, including powerful utilities for Spring applications. Moreover, through the Azure Toolkit for Eclipse, developers can quickly deploy their applications to Azure directly from Eclipse.

**Tool-Specific Resources**

1. [Installing the Azure Toolkit for Eclipse](https://docs.microsoft.com/azure/developer/java/toolkit-for-eclipse/installation)
2. [Create a Hello World web app for Azure App Service using Eclipse](https://docs.microsoft.com/azure/developer/java/toolkit-for-eclipse/create-hello-world-web-app)

#### Maven

Maven improves the productivity of Java developers by managing builds, dependencies, releases, documentation, and more. Maven projects are created from archetypes. Microsoft provides the Maven Plugins for Azure to help Java developers work with Azure Functions, Azure App Service, and Azure Spring Cloud from their Maven workflows.

> **Note**: Application patterns with Azure Functions, Azure App Service, and Azure Spring Cloud are addressed in the [End to End application development] story.

**Tool-Specific Resources**

1. [Azure for Java developer documentation](https://docs.microsoft.com/en-us/azure/developer/java/?view=azure-java-stable)
2. [Maven Introduction](https://maven.apache.org/guides/getting-started/index.html)
3. [Develop Java web app on Azure using Maven (App Service)](https://docs.microsoft.com/learn/modules/publish-web-app-with-maven-plugin-for-azure-app-service/)
4. [Deploy Spring microservices to Azure (Spring Cloud)](https://docs.microsoft.com/learn/modules/azure-spring-cloud-workshop/)
5. [Develop Java serverless Functions on Azure using Maven](https://docs.microsoft.com/learn/modules/develop-azure-functions-app-with-maven-plugin/)
