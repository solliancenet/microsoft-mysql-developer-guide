# Migrate to Docker Containers

This is a simple app that runs PHP code to connect to a MYSQL database.  Both the application and database are deployed via Docker containers.

## Migrate Application to Docker

### Migrate to ENV variables

1. Open the `\public\database.php` file, update the your php MySQL connection environment variables by removing the `APPSETTING_` from each:

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
    docker run -d php:8.0-apache
    ```

5. In the `c:\labfiles\microsoft-mysql-developer-guide\artifacts\03-00-Docker` directory, create the `Dockerfile.web` with the following:

    ```text
    # Dockerfile
    FROM php:8.0-apache

    RUN docker-php-ext-install mysqli pdo_mysql exif gd tidy zip
    RUN docker-php-ext-enable mysqli
    RUN apt-get update && apt-get upgrade -y

    COPY 000-default.conf /etc/apache2/sites-available/000-default.conf
    COPY start-apache.sh /usr/local/bin

    RUN a2enmod rewrite

    COPY sample-php-app /var/www
    RUN chown -R www-data:www-data /var/www

    RUN chmod 755 /usr/local/bin/start-apache.sh

    #CMD ["start-apache.sh"]

    EXPOSE 80
    ```

6. Run the following to create the image:

    ```PowerShell
    $sourcePath = "c:\labfiles\microsoft-mysql-developer-guide\artifacts";

    cd $sourcePath;

    docker build -t store-web --file Dockerfile.web . 
    ```

## Migrate Database to Docker

1. Run the following to export the database:

    ```powershell
    cd "c:\labfiles\microsoft-mysql-developer-guide\artifacts";

    $username = "root";
    $password = "";
    $server = "localhost";
    $database = "ContosoStore";

    $mysqlPath = "C:\Program Files\MySQL\MySQL Workbench 8.0 CE"

    & "$mysqlPath\mysqldump" -h $server -u $username $database > data.sql
    ```

2. In the `c:\labfiles\microsoft-mysql-developer-guide\artifacts` directory, create a new `Dockerfile.db` docker compose file:

    ```text
    FROM mysql:5.7
    RUN chown -R mysql:root /var/lib/mysql/

    ADD data.sql /etc/mysql/data.sql

    RUN cp /etc/mysql/data.sql /docker-entrypoint-initdb.d

    EXPOSE 3306
    ```

3. Build the container:

    ```PowerShell
    docker build -t store-db --file Dockerfile.db .
    ```

## Run the Docker images

1. Create the following `docker-compose.yml` docker compose file:

    ```yaml
    version: '3.8'
    services:
      web:
        image: store-web
        environment:
          - MYSQL_DATABASE=contosostore
          - MYSQL_USER=root
          - MYSQL_PASSWORD=root
          - MYSQL_PORT=3306
          - MYSQL_SERVERNAME=db
        ports:
          - "8080:80" 
      db:
        image: store-db 
        environment:
          - MYSQL_ROOT_PASSWORD=root
        ports:
          - "3306:3306"
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

1. Open a browser to `http:\\localhost:8080\index.php`
2. Create an order
  - TODO
3. Shutdown and restart the image:

  ```PowerShell
  ```

4. Open a browser to `http:\\localhost:8080\index.php`

## Fix Storage persistence

1. Create a new docker volume:

    ```docker
    docker volume create vol-db
    ```

2. Modify the `docker-compose.yml` docker compose file:

  ```yaml
    version: '3.8'
    services:
      web:
        image: store-web
        environment:
          - DB_DATABASE=contosostore
          - DB_USERNAME=root
          - DB_PASSWORD=root
          - DB_HOST=localhost
        volumes:
          - ./src:/var/www/html/
        ports:
          - "80:80" 
          - "443:443"
        expose:
          - "80" 
          - "443" 
      db:
        image: store-db 
          - MYSQL_DATABASE=contosostore
          - MYSQL_USER=root
          - MYSQL_PASSWORD=root
          - MYSQL_SERVERNAME=localhost
        volumes:
          - ./data:/var/lib/mysql
        ports:
          - "3306:3306"
        expose:
          - "3306"
   ```

## Re-test the Docker images

1. Run the following:

  ```PowerShell
  docker compose run web
  docker compose run db
  ```

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
