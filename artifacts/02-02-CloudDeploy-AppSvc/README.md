# Cloud Deployment to Azure App Service

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

### Migrate the Database

1. In the virtual machine, open the MySQL Workbench
2. Connect to the local instance
3. Export the `ContosoCoffee` database
   1. Select **Server->Data Export**
   2. Select the **contosocoffee** schema
   3. Select the following:
      1. Dump Stored Procedures and Functions
      2. Dump Events
      3. Dump Triggers
   4. For the project folder, type `C:\temp\ContosoCoffee\export`
   5. Select **Start Export**, you should now see several files in the target folder
4. Connect to the Azure MySQL instance
   1. Select **Database->Connect to database**
   2. For the hostname, type the dns of the Azure Database for MySQL server (ex `mysqldevSUFFIX.mysql.database.azure.com`)
   3. For the username, type **wsuser@mysqldevSUFFIX**
   4. For the password type **Solliance123**
   5. Select **OK**
5. Import the backup
   1. Select **Server->Data Import**
   2. For the project folder, type `C:\temp\ContosoCoffee\export`
   3. Select **Load folder contents**
   4. For the default target schema, select **New**
   5. For the name, type **ContosoCoffee**, then select **OK**
   6. Select **Start Import**

## Update the connection string

1. Switch to the Azure Portal
2. Browse to the **mysqldevSUFFIX** web application
3. Under **Development Tools**, select **Advanced Tools**
4. Select **Go->**
5. Select **Debug console->CMD**
6. Browse to **site-.wwwroot**
7. Select the **edit** button for the `database.php` file
8. Set the servername variable to `mysqldevSUFFIX.mysql.database.azure.com`
9. Set the username to `wsuser@mysqldevSUFFIX`
10. Set the password to `Solliance123`
11. Select **Save**

## Test new settings #1

1. Browse to `https://mysqldevSUFFIX.azurewebsites.net/database.php`, you should get an error about SSL settings.

## Fix SSL error

1. Download the `https://dl.cacerts.digicert.com/DigiCertGlobalRootCA.crt.pem` certificate
2. Switch back to the kudo window
3. Drag the **DigiCertGlobalRootCA.crt.pem** into the window to upload it
4. Select the **edit** button for the `database.php` file
5. Update the database connection to use ssl by adding the `mysqli_ssl_set` method before the `mysqli_real_connect` method:

    ```php
    mysqli_ssl_set($conn,NULL,NULL, "DigiCertGlobalRootCA.crt.pem", NULL, NULL);
    ```

6. Select **Save**

## Test new settings #2

1. Browse to `https://mysqldevSUFFIX.azurewebsites.net/database.php`, you should get your results.

## Update to use Environment Variables

1. Putting credential in the PHP files is not a best practice, it is better to utilize environment variables for this.
2. Switch back to the kudo window
3. Select the **edit** button for the `database.php` file:
4. Update the connection variables to the following:

    ```php
    $servername = getenv("APPSETTING_servername");
    $username = getenv("APPSETTING_mysql_username");
    $password = getenv("APPSETTING_mysql_password");
    $dbname = getenv("APPSETTING_dbname");
    ```

5. Add the environment variables to the App Service:
   - Browse to the Azure Portal
   - Select the **mysqldevSUFFIX** app service
   - Under **Settings**, select **Configuration**
   - Select **New application setting**
   - Add the following:
     - `servername` = `mysqldevSUFFIX.mysql.database.azure.com`
     - `mysql_username` = `wsuser@mysqldevSUFFIX`
     - `mysql_password` = `Solliance123`
     - `dbname` = `contosocoffee`

## Test new settings #3

1. Browse to `https://mysqldevSUFFIX.azurewebsites.net/database.php`, you should get your results.

## Create Azure Key Vault values

1. Switch to the Azure Portal
2. Browse to the **mysqldevSUFFIX-kv** Key Vault
3. Under **Settings** select **Access Policies**
4. Select **Add Access Policy**
5. For the secret permission, select the dropdown, then select **All**
6. For the principal, select your user account
7. Select **Add**
8. Select **Save**
9. Under **Settings**, select **Secrets**
10. Select **Generate/Import**
11. For the name, type **MySQLPassword**
12. For the value, type **Solliance123**
13. Select **Create**

## Create Managed Service Identity

1. Switch to the Azure Portal
2. Browse to the ** app service
3. Under **Settings**, select **Identity**
4. For the system assigned identity, toggle to **On**
5. Select **Save**, in the dialog, select **Yes**
6. Copy the **Object ID** for later user
7. Browse to the **mysqldevSUFFIX-kv** Key Vault
8. Under **Settings** select **Access Policies**
9. Select **Add Access Policy**
10. For the secret permission, select the dropdown, then select **All**
11. For the principal, select the new managed identity for the app service (use the copied object ID)
12. Select **Add**
13. Select **Save**
14. Under **Settings**, select **Secrets**
15. Select the **MySQLPassword**
16. Select the current version
17. Copy the secret identifier for later use

## Configure Environment Variables

1. Browse to the Azure Portal
2. Select the **mysqldevSUFFIX** app service
3. Under **Settings**, select **Configuration**
4. Select the edit button for the **mysql_password** application setting
5. Update it to the following:

    ```text
    @Microsoft.KeyVault(SecretUri=https://mysqldevSUFFIX-kv.vault.azure.net/secrets/MySQLPassword/)
    ```

6. Select **Save**, ensure that you see a green check mark.

## Test new settings #4

1. Browse to `https://mysqldevSUFFIX.azurewebsites.net/database.php`, you should get your results.
