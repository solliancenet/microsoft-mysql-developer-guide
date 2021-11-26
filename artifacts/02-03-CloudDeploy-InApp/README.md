# Cloud Deployment to Azure App Service with MySQL InApp

This is a simple app that runs PHP code to connect to a MYSQL database.  The application and database must be migrated to Azure App Service and Azure Database for MySQL.

## Basic Deployment

### Deploy the Application

1. Open the `` folder in Visual Studio code
2. If prompted, select **Yes, I trust the authors**
3. Open a terminal window, run the following:

    ```PowerShell
    Compress-Archive -Path .\app\*.* -DestinationPath app.zip
    ```

4. Deploy the zip to Azure, run the following:

    ```PowerShell
    Connect-AzAccount

    $suffix = "SUFFIX";
    $resourceGroupName = "RESOURCE_GROUP_NAME";

    $appName = "mysqldev$suffix";
    $app = Get-AzWebApp -ResourceGroupName $resourceGroupName -Name $appName

    Compress-Archive -Path .\src\*.* -DestinationPath src.zip -force
    
    Publish-AzWebApp -WebApp $app -ArchivePath "C:\labfiles\microsoft-mysql-developer-guide\Artifacts\02-01-CloudDeploy\src.zip"
    ```

### Test the Application

1. Open the Azure Portal
2. Browse to the `` app service
3. Under **Settings**, select **Configuration**
4. Select the **General settings** tab
5. For the stack, select **PHP**
6. For the php version, select **7.4**
7. Select **Save**
8. Browse to `https://mysqldevSUFFIX.azurewebsites.net/default.php`, you should see `Hello World`
9. Browse to `https://mysqldevSUFFIX.azurewebsites.net/database.php`, you should get an error.  This is because the connection details were embedded in the php file.

### Export the Database

1. In the virtual machine, open the MySQL Workbench
2. Connect to the local instance
3. Export the `ContosoCoffee` database

### Enable MySQL In App

1. Switch to the Azure Portal
2. Browse to the `mysqldevSUFFIX` app service
3. Under **Settings**, select **MySQL in App**
4. For the **MySQL in App** toggle, set to **On**
5. Set the slow query log to **On**
6. Set the general log to **On**
7. Select **Save**, take note of the connection string environment variable.

## Import the database

1. In the Data import and export section, select **Import/Export**
2. Select the **Manage** link, the `myphpadmin` panel will open
3. In the left navigation, select **New**
4. For the name, type **ContosoCoffee**
5. Select the **Import** tab
6. Browse to your export file, run it

## Update the connection string

1. Under **Settings**, select **Confgiuration**
2. Add or update the **StoreDb** connection string to the MySql connection string you recorded above

## Test the Application

1. Browse to `https://mysqldevSUFFIX.azurewebsites.net/default.php`, you should see `Hello World`
2. Browse to `https://mysqldevSUFFIX.azurewebsites.net/database.php`, you should see results.
