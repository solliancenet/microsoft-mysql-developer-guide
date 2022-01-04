# Classic Deployment to PHP enabled IIS server

This is a simple app that runs PHP code to connect to a MYSQL database.

## Test the PHP Setup

1. Open a chrome browser window
2. Navigate to `http://localhost:8080/default.php`, you should see **Hello World** displayed.
3. Navigate to `http://localhost:8080/database.php`, you should see **12 results** displayed.

## Database Deployment

1. Run the following commands to create the database (type `yes` when prompted):

    ```PowerShell
    cd C:\labfiles\microsoft-mysql-developer-guide\artifacts\sample-php-app

    php artisan migrate

    php artisan db:seed
    ```

2. You should see several tables get created

## Test the Store Application

1. Open a chrome browser window
2. Navigate to `http://localhost:8080`, you should see the store front load.

## Manual Deployment

The above resources were deployed as part of the ARM template.  You would need to do the following in order to get your Windows machine setup:

1. Install IIS
2. Install PHP Extensions
3. Install PHP 8.0
4. Copy the web application files to the `c:\inetpub\wwwroot` folder
5. Install MySQL
