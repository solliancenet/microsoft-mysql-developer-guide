# Azure Batch with MySQL

## Setup

- Create a `Batch Service` in Azure (one is created for you in the arm templates)
- Set the MySQL instance to have private endpoint

## Configure Batch Service

- Browse to the Azure Portal
- Select the `mysqldevSUFFIX` batch service
- Under **Features** select **Pools**
- Ensure you have a pool called **main**
- TODO

## Create a Batch Job

- Under **Features**, select **Jobs**
- Select **+ Add**
- For the name, type **mysql_job**
- Select the **main** pool
- Select **OK**

## Create a Batch Task

- Select the new **mysql_job**
- Under **General**, select **Tasks**
- Select **+ Add**
- For the name, type **mysql_copy_orders**
- For the script, type `powershell mysql_copy_orders.ps1`
- Select **OK**

## Upload Script

- Create a new container called `input`
- Create a file called `mysql_copy_orders.ps1`, copy the following into it, be sure to replace the connection variables:

```powershell
#install chocolaty
$item = get-item "C:\ProgramData\chocolatey\choco.exe" -ea silentlycontinue;

if (!$item)
{
    write-host "Installing Chocolaty";

    $env:chocolateyUseWindowsCompression = 'true'
    Set-ExecutionPolicy Bypass -Scope Process -Force; 
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; 
    iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine")

choco feature enable -n allowGlobalConfirmation

#install mysql
choco install mysql-cli

#run the queries...
$myconnection = New-Object MySql.Data.MySqlClient.MySqlConnection

$myconnection.ConnectionString = "server=yoursever;user id=youruser;password=yourpassword;database=yourdb;pooling=false"

$myconnection.Open()

$mycommand = New-Object MySql.Data.MySqlClient.MySqlCommand
$mycommand.Connection = $myconnection
$mycommand.CommandText = "SHOW DATABASES"
$myreader = $mycommand.ExecuteReader();

$res = "";

while($myreader.Read())
{ 
    $res += $myreader.GetString(0) 
}

$myconnection.Close()

#write out to a file...

```

- Upload the file to the `input` container

## Run the Batch Job and Task

- TODO