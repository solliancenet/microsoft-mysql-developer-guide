# Cloud Deployment to Azure VM

This is a simple app that runs PHP code to connect to a MYSQL database.

The app is running in an Azure VM.  The App needs to be exposed to the internet via port 80 in order for it you to see the results.

## Test the Application #1

1. Open a browser to the Azure Portal
2. Navigate to the **paw-1** virtual machine
3. In the **Essentials** section, copy the public IP Address
4. Open a browser to the virtual machine ip address (ex `http:\\IP_ADDRESS:8080`)
5. You should get a **ERR_CONNECTION_TIMED_OUT** error.  This is because the network security group on the virtual machine does not allow port 8080 access.

## Open Port 8080

1. Navigate to the **Paw-1** machine, select it
2. Under **Settings**, select **Networking**
3. Select **Add inbound port rule**
4. For the destination port, type **8080**
5. For the name, type **Port_8080**
6. Select **Add**

## Test the Application #2

1. Retry connecting to the web application (ex `http:\\IP_ADDRESS:8080`), you will get another timeout error
2. Switch back to the **paw-1** machine, run the following PowerShell:

   ```PowerShell
   New-NetFirewallRule -DisplayName 'Port 8080' -Direction Inbound -Action Allow -Protocol TCP -LocalPort 8080
   ```

3. You should see your application load
4. Open a browser to the virtual machine ip address (ex `http:\\IP_ADDRESS:8080\database.php`)
5. You should see your results

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

1. Retry connecting to the web application (ex `https:\\IP_ADDRESS:443`), you should get an error
2. Switch back to the **paw-1** machine, run the following PowerShell:

   ```PowerShell
   New-NetFirewallRule -DisplayName 'Port 443' -Direction Inbound -Action Allow -Protocol TCP -LocalPort 443
   ```

3. Select the **Advanced** button
4. Select **Proceed to IP_ADDRESS (unsafe)**
5. You should see your application load
6. Open a browser to the virtual machine ip address (ex `https:\\IP_ADDRESS:8080\database.php`)
7. You should see your results
