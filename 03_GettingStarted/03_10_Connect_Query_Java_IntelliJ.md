# Java (Spring Boot) Language Support

This guide will demonstrate how to operate a Spring Framework application that queries Azure Database for MySQL through the Spring Data JPA. We will also present Azure extensions for popular Java development tools.

## Setup

### Prerequisites

Please complete the instructions for [working with Flexible Server in MySQL Workbench.](03_06_Query_MySQL_Workbench.md) Utilize version 8.0.26 as you complete the guide to ensure compatibility with Single Server.

Moreover, download Postman, a popular REST client. If you are more comfortable with another utility, such as `curl`, feel free to use it instead.

### IntelliJ Setup

Download the [IntelliJ IDEA](https://www.jetbrains.com/idea/download) IDE. Community edition will suffice. It comes with a custom JDK, so it is not necessary to install the JDK separately.

After installing IntelliJ, install the [Azure Toolkit for IntelliJ](https://plugins.jetbrains.com/plugin/8053-azure-toolkit-for-intellij/) plugin. Then, authenticate with Azure, as described in [this](https://docs.microsoft.com/azure/developer/java/toolkit-for-intellij/sign-in-instructions) document.

Once everything is equipped, you will see an **Azure Explorer** tab on the left side of the screen. Note that it is possible to manage Azure Database for MySQL Single Server instances from the Azure Explorer.

![This image demonstrates the Azure Toolkit for IntelliJ plugin, with the Azure Database for MySQL node expanded.](./media/azure-explorer-intellij.png "Azure Toolkit for IntelliJ plugin installation success")

### App Setup

Clone the [gs-accessing-data-mysql](https://github.com/spring-guides/gs-accessing-data-mysql) repository to your local machine. This is an example app from the Spring documentation.

Open the `complete` directory in the repository root in IntelliJ. If you are prompted to choose between using the Maven configuration or the Gradle configuration, choose the Maven one.

![This image shows the complete project opened in IntelliJ in the Project tab.](./media/intellij-complete-spring-boot-project.png "Complete project")

### Database Setup

The IntelliJ Azure explorer supports Azure Database for MySQL Single Server, but not Flexible Server. Luckily, you can provision a Single Server instance directly within the Azure Explorer.

1. Navigate to the **Azure Explorer** tab, right-click on **Azure Database for MySQL**, and select **+ Create**.

2. The **Create Azure Database for MySQL** dialog box will open. Select **+ More settings** (1) and populate the following parameters:

    - **Project details**
      - **Subscription** (2)
      - **Resource group** (3): choose an existing resource group from the dropdown or create a new one by pressing **+**
    - **Server details**
      - **Server name** (4): provide a unique value, like `springboot-single-server-SUFFIX`
      - **Location** (5): choose an Azure location near you
      - **Version** (6): choose `8.0`
    - **Administrator account**
      - **Admin username** (7): enter `sqlroot`
      - **Password/confirm password** (8): choose a secure password
    - **Connection security**
      - Select **Allow access from current local PC** (9)

    ![This image demonstrates how to create a new MySQL Single Server instance from IntelliJ and populate it with the parameters above.](./media/intellij-create-single-server.png "Creating a new MySQL Single Server instance")

3. Select **OK**. Allow the task to continue in the background.

4. Once provisioning completes (it should only take a few minutes), observe the new MySQL Single Server instance appear in the Azure explorer. Right-click the instance and select **Show properties**. A panel will open with basic information about the instance, including Spring connection information for the `application.properties` file.

    ![This image demonstrates Single Server MySQL connection information from the IntelliJ Azure explorer.](./media/mysql-instance-information.png "MySQL connection information")

5. Create a new connection to your Azure Database for MySQL Single Server instance from MySQL Workbench. Use the following SQL statement to create a new database called `newdatabase`. This application will not function with the provided `mysql` system database.

    ```sql
    CREATE DATABASE newdatabase;
    ```

## Run the App

1. Open `application.properties` from the project hierarchy: `src` > `main` > `resources`. Delete all the `spring.datasource.*` entries.

    ![This image demonstrates how to edit the application.properties file.](./media/edit-application-properties.png "Editing application.properties")

2. Navigate to the **Azure Explorer**, right-click the Single Server instance you provisioned, and select **Connect to Project (Preview)**.

3. In the **Azure Resource Connector** window, keep all parameters the same. Simply populate the **Password**. Then, select **OK**.

    ![This image demonstrates the Azure Resource Connector dialog box.](./media/azure-resource-connector-intellij.png "Azure Resource Connector")

4. Replace the contents you removed from the `application.properties` file with the following. Notice how the connection information is encapsulated in environment variables.

    ```
    spring.datasource.url=${AZURE_MYSQL_URL}
    spring.datasource.username=${AZURE_MYSQL_USERNAME}
    spring.datasource.password=${AZURE_MYSQL_PASSWORD}
    ```

5. Start the application from the upper right-hand corner of the screen.

    ![This image shows how to start the Spring Boot app from IntelliJ.](./media/start-app-intellij.png "Starting Spring Boot app")

## Testing the App

1. Open Postman, or the REST client of your choice. Make a `POST` request to `http://localhost:8080/demo/add` with the URL parameters `name` and `email`.

    ![This image shows how to make a POST request to the Java app endpoint.](./media/post-request-postman.png "POST to endpoint")

2. Make a `GET` request to `http://localhost:8080/demo/all`. The entries that you added through the POST request will be displayed.

    ![This image shows how to make a GET request to the Java app endpoint.](./media/get-request-postman.png "GET request from Postman")

3. As expected, the data is persisted to the MySQL Single Server instance.

    ![This image shows the user data persisted to the MySQL Single Server instance with a query in MySQL Workbench.](./media/result-set-mysql-workbench.png "Data persisted to Single Server")

## Stop the App

1. Stop the app in IntelliJ.

2. In the **Azure Explorer**, right-click the MySQL Single Server instance you created and select **Stop**.

Congratulations. You have successfully installed IntelliJ, the Azure Explorer extension, created a MySQL Single Server instance, and securely operated an app using the Single Server.
