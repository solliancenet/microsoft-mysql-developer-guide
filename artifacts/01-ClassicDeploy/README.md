# Classic Deployment to PHP enabled IIS server

This is a simple app that runs PHP code to connect to a MYSQL database.

## Test the Application

1. Open a chrome browser window
2. Navigate to `http://localhost/01-ClassicDeploy/default.php`, you should see **Hello World** displayed.
3. Navigate to `http://localhost/01-ClassicDeploy/database.php`, you should see **1 results** displayed.

## Manual Deployment

These resources were deployed as part of the ARM template.  You would need to do the following in order to get your Windows machine setup:

1. Install IIS
2. Copy the web application files to the `c:\inetpub\wwwroot` folder
3. Install MySQL
4. Run your database schema and data import scripts
