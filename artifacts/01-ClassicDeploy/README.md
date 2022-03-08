# Classic Deployment to PHP enabled IIS server

This is a simple app that runs PHP code to connect to a MYSQL database.

## Test the PHP Setup

1. Open a chrome browser window
2. Navigate to `http://localhost:8080/default.php`, **Hello World** should be displayed.
3. Navigate to `http://localhost:8080/database.php`, **12 results** should be displayed.

## Database Deployment

1. Run the following commands to create the database (type `yes` when prompted):

    ```PowerShell
    cd C:\labfiles\microsoft-mysql-developer-guide\artifacts\sample-php-app

    php artisan config:clear
    
    php artisan migrate

    php artisan db:seed
    ```

2. Several tables should get created

## Test the Store Application

1. Open a chrome browser window
2. Navigate to `http://localhost:8080`, the store front will load with a random user.

    ![This image demonstrates the loading screen for the Contoso NoshNow app.](./media/noshnow-app-load.png "Loading screen with random user")

## Manual Deployment

The above resources were deployed as part of the ARM template.  In order to setup a developer machine, do the following in order to get the machine setup:

1. Install IIS
2. Install PHP Extensions
3. Install PHP 8.0
4. Copy the web application files to the `c:\inetpub\wwwroot` folder
5. Install MySQL
