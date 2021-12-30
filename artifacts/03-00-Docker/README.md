# Migrate to Docker Containers

This is a simple app that runs PHP code to connect to a MYSQL database.  Both the application and database are deployed via Docker containers.

## Migrate Application to Docker

### Migrate to ENV variables

1. Update the your php MySQL connection environment variables by removing the `APPSETTING_` from each:

    ```php
    $servername = getenv("MYSQL_SERVERNAME");
    $username = getenv("MYSQL_USERNAME");
    $password = getenv("MYSQL_PASSWORD");
    $dbname = getenv("MYSQL_DATABASE");
    ```

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
    $sourcePath = "c:\labfiles\microsoft-mysql-developer-guide\sample-php-app";

    cd $sourcePath;
    ```

6. Create a `Dockerfile.web` with the following:

    ```text
    # Dockerfile
    FROM php:7.4-apache

    COPY 000-default.conf /etc/apache2/sites-available/000-default.conf
    COPY start-apache.sh /usr/local/bin

    RUN a2enmod rewrite

    COPY src /var/www/public
    RUN chown -R www-data:www-data /var/www/public

    RUN chmod 755 /usr/local/bin/start-apache.sh

    CMD ["start-apache.sh"]

    ARG MYSQL_DATABASE
    ARG MYSQL_USERNAME
    ARG MYSQL_PASSWORD
    ARG MYSQL_SERVERNAME

    ENV MYSQL_DATABASE=$MYSQL_DATABASE
    ENV MYSQL_USERNAME=$MYSQL_USERNAME
    ENV MYSQL_PASSWORD=$MYSQL_PASSWORD
    ENV MYSQL_SERVERNAME=$MYSQL_SERVERNAME

    EXPOSE 80
    EXPOSE 443
    ```

7. Run the following to create the image:

    ```PowerShell
    docker build -t store-web --file Dockerfile.web . 
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
    docker build -t store-db --file Dockerfile.db .
    ```

## Run the Docker images

1. Create the following `docker-compose.yml` docker compose file:

    ```yaml
    version: '3'
    services:
    web:
      image: store-web
      environment:
        - MYSQL_DATABASE=contosocoffee
        - MYSQL_USER=root
        - MYSQL_PASSWORD=
        - MYSQL_SERVERNAME=localhost
      ports:
        - "80:80" 
        - "443:443"
      expose:
        - "80" 
        - "443" 
    db:
      image: store-db 
        - MYSQL_DATABASE=contosocoffee
        - MYSQL_USER=root
        - MYSQL_PASSWORD=
        - MYSQL_SERVERNAME=localhost
      ports:
        - "3306:3306"
      expose:
        - "3306"
   ```

2. Run the following to create the web container:

    ```PowerShell
    docker compose run web
    ```

3. Run the following to create the db container:

    ```docker
    docker compose run db
    ```

## Test the Docker images

1. Open a browser to `http:\\localhost:80\default.php`
2. 

## Fix Storage persistence

1. Create a new docker volume:

    ```docker
    docker volume create vol-db
    ```

## Re-test the Docker images

1. TODO

## Save the images to Azure Container Registry (ACR)

1. Open the Azure Portal
2. Browse to the **mysqldevSUFFIX** Azure Container Registry
3. Under **Settings**, select **Access keys**
4. Copy the username and password
5. In the **paw-1** virtual machine, run the following:

    ```powershell
    docker login {acrName}.azurecr.io -u {username} -p {password}

    docker tag store-db {acrName}.azurecr.io/store-db

    docker tag store-web {acrName}.azurecr.io/store-web

    docker push {acrName}.azurecr.io/store-db

    docker push {acrName}.azurecr.io/store-web
    ```

6. You should now see two images in your Azure Container Registry that we will use later for deployment to other container based runtimes.
