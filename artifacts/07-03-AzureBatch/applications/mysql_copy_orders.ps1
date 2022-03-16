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

#install azure powershell
choco install az.powershell

#install mysql
choco install mysql-cli

#install .net connector
choco install mysql-connector -y
#Install-package MySql.Data

Connect-AzAccount -identity

[void][System.Reflection.Assembly]::LoadWithPartialName("MySql.Data") 

#$path = "C:\Program Files (x86)\MySQL\MySQL Connector Net 8.0.28\Assemblies\v4.8\MySql.Data.dll";
#[void][System.Reflection.Assembly]::Load($path) 

$server = "server_name";
$database = "contosostore";
$user = "wsuser";
$password = "S0lliance123";

#run the queries...
$myconnection = New-Object MySql.Data.MySqlClient.MySqlConnection

$myconnection.ConnectionString = "server=$server;user id=$user;password=$password;database=$database;pooling=false"

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
add-content "data.txt" $res;