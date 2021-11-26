# Cloud Deployment to Azure VM

This is a simple app that runs PHP code to connect to a MYSQL database.

The app is running in an Azure VM.  The App needs to be exposed to the internet via port 80 in order for it you to see the results.

## Open Port 80

1. Switch to the Azure Portal
2. Navigate to the **Paw-1** machine, select it
3. Under **Settings**, select **Networking**
4. Select **Add inbound port rule**
5. For the destination port, type **80**
6. For the name, type **Port_80**
7. Select **Add**

## Test the Application

1. Open a browser to the virtual machine ip address (ex `http:\\IP_ADDRESS\01-ClassicDeploy\default.php`)
2. You should see your `Hello World` text
3. Open a browser to the virtual machine ip address (ex `http:\\IP_ADDRESS\01-ClassicDeploy\database.php`)
4. You should see your results
