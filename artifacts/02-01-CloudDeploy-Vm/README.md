# Cloud Deployment to Azure VM

This is a simple app that runs PHP code to connect to a MYSQL database.

The app is running in an Azure VM.  The App needs to be exposed to the internet via port 80 in order for it you to see the results.

## Test the Application #1

1. Open a browser to the Azure Portal
2. Navigate to the **paw-1** virtual machine
3. In the **Essentials** section, copy the public IP Address
4. Open a browser to the virtual machine ip address (ex `http:\\IP_ADDRESS\01-ClassicDeploy\default.php`)
5. You should get a **ERR_CONNECTION_TIMED_OUT** error.  This is because the network security group on the virtual machine does not allow port 80 access.

## Open Port 80

1. Navigate to the **Paw-1** machine, select it
2. Under **Settings**, select **Networking**
3. Select **Add inbound port rule**
4. For the destination port, type **80**
5. For the name, type **Port_80**
6. Select **Add**

## Test the Application #2

1. Retry connecting to the web application (ex `http:\\IP_ADDRESS\01-ClassicDeploy\default.php`)
2. You should see your `Hello World` text
3. Open a browser to the virtual machine ip address (ex `http:\\IP_ADDRESS\01-ClassicDeploy\database.php`)
4. You should see your results

## Enable Port 443

As part of any secured web application, you should enable SSL/TLS.

1. Setup certificate on web machine
   - Open IIS Manager
   - Select the server node
   - Select **Server certificates**
   - Select **Create self-signed certificate**
   - Select **OK**
<!--
   - For the friendly name, type **paw-1**
   - For the certificate store, select **Web Hosting**
   - For Common name, type **PHP Dev**
   - For Organization, type **PHP Dev**
   - For Organizational unit, type **Dev**
   - For City/locality, type **Redmond**
   - For State/province, type **WA**
   - Click **Next**
-->
2. Setup SSL
   - Expand the **Sites** node
   - Select the **Default Web Site**
   - In the actions, select **Bindings**
   - Select **Add**
   - For the type, select **https**
   - For the SSL certificate, select **paw-1**
   - Select **OK**

## Open Port 443

1. Navigate to the **Paw-1** machine, select it
2. Under **Settings**, select **Networking**
3. Select **Add inbound port rule**
4. For the destination port, type **443**
5. For the name, type **Port_443**
6. Select **Add**

## Test the Application #3

1. Retry connecting to the web application (ex `https:\\IP_ADDRESS\01-ClassicDeploy\default.php`)
2. Select the **Advanced** button
3. Select **Proceed to IP_ADDRESS (unsafe)**
4. You should see your `Hello World` text
5. Open a browser to the virtual machine ip address (ex `https:\\IP_ADDRESS\01-ClassicDeploy\database.php`)
6. You should see your results
