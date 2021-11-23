# Migrate to Docker Containers

This is a simple app that runs PHP code to connect to a MYSQL database.  Both the application and database are deployed via Docker containers.

## Migrate Application to Docker

### Migrate to ENV variables

1. TODO

### Download Docker container

1. Open Docker Desktop, if prompted, select **OK**
2. In the agreement dialog, select the checkbox and then select  **Accept**
3. It will take a few minutes for the Docker service to start, when prompted, select **Skip tutorial**
4. Open a PowerShell window, run the following to download and start a php-enabled docker container

    ```Powershell
    docker run -d php:7.4-apache
    ```

5. Change the directory to the application directory

    ```PowerShell
    $sourcePath = "c:\labfiles\microsoft-mysql-developer-guide\artifacts\01-ClassicDeploy";

    cd $sourcePath;
    ```

6. Create a `Dockerfile.web` with the following:

    ```text
    # Dockerfile
    FROM php:7.4-apache

    COPY 000-default.conf /etc/apache2/sites-available/000-default.conf
    COPY start-apache.sh /usr/local/bin

    RUN a2enmod rewrite

    COPY src /var/www/
    RUN chown -R www-data:www-data /var/www

    RUN chmod 755 /usr/local/bin/start-apache.sh

    CMD ["start-apache.sh"]

    ENV MYSQL_ROOT_PASSWORD=root
    ENV MYSQL_ROOT_USER=root
    ```

7. Run the following to create the image:

    ```PowerShell
    docker build -t store-php --file Dockerfile.web . 
    ```

## Migrate Database to Docker

1. Create a new `Dockerfile.db` docker compose file:

    ```text
    FROM mysql:5.7
    RUN chown -R mysql:root /var/lib/mysql/

    ARG MYSQL_DATABASE
    ARG MYSQL_USER
    ARG MYSQL_PASSWORD
    ARG MYSQL_ROOT_PASSWORD

    ENV MYSQL_DATABASE=$MYSQL_DATABASE
    ENV MYSQL_USER=$MYSQL_USER
    ENV MYSQL_PASSWORD=$MYSQL_PASSWORD
    ENV MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD

    ADD data.sql /etc/mysql/data.sql

    RUN sed -i 's/MYSQL_DATABASE/'$MYSQL_DATABASE'/g' /etc/mysql/data.sql
    RUN cp /etc/mysql/data.sql /docker-entrypoint-initdb.d

    EXPOSE 3306
    ```

2. Run the following to export the database:

    ```powershell
    $username = "root";
    $password = "";
    $server = "localhost";
    $database = "ContosoCoffee";

    $mysqlPath = "C:\Program Files\MySQL\MySQL Workbench 8.0 CE"

    & "$mysqlPath\mysqldump" -h $server -u $username $database > data.sql
    ```

3. Build the container:

    ```PowerShell
    docker build -t store-mysql --file Dockerfile.db .
    ```

## Run the Docker images

1. Run the following to create the web container:

    ```PowerShell
    ```

2. Run the following to create the database container:

    ```PowerShell
    ```
