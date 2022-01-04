$path = "c:\inetpub\wwwroot\";

# create a new IIS directory
mkdir $path

# copy the php files
copy ./sample-php-app $path

#deploy the database
$username = "s2admin"
$password = "S2@dmins2@dmin"
$server = "localhost"
$database = "ContosoStore"

mysql -h $server -u $username $database < "$path/database/schema.sql"