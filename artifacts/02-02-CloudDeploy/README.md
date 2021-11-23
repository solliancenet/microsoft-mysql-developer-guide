# Cloud Deployment to Azure App Service

This is a simple app that runs PHP code to connect to a MYSQL database.  The application and database must be migrated to Azure App Service and Azure Database for MySQL.

## Basic Deployment

### Deploy the Application

1. Open the `` folder in Visual Studio code
2. If prompted, select **Yes, I trust the authors**
3. Open a terminal window, run the following:

    ```PowerShell
    Compress-Archive -Path .\app -DestinationPath app.zip
    ```

4. Deploy the zip to Azure, run the following:

    ```PowerShell
    Connect-AzAccount

    $suffix = "SUFFIX";
    $resourceGroupName = "RESOURCE_GROUP_NAME";

    $appName = "mysqldev$suffix";
    $app = Get-AzWebApp -ResourceGroupName $resourceGroupName -Name $appName
    Publish-AzWebApp -WebApp $app -ArchivePath "C:\labfiles\microsoft-mysql-developer-guide\Artifacts\01-ClassicDeploy\app.zip"
    ```

### Migrate the Database

1. Open the MySQL Workbench
2. Connect to the local instance
3. Export the `ConsotoCoffee` database
4. Connect to the Azure MySQL instance
5. Import the backup

### Test the Application

1. Open the Azure Portal
2. Browse to the `` app service
3. Under **Settings**, select **Configuration**
4. Select the **General settings** tab
5. For the stack, select **PHP**
6. For the php version, select **7.4**
7. Select **Save**
8. Browse to `https://mysqldevSUFFIX.azurewebsites.net/default.php`, you should see `Hello World`

## CI/CD Deployment (Github)

### Setup GitHub

1. Right click the **app** folder, select **Configure CI/CD Pipeline**
2. When prompted, select **Sign In**
3. Login with your Azure credentials
4. Enter your github personal access token
5. TODO
