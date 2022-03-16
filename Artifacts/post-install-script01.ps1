#Disable-InternetExplorerESC
function DisableInternetExplorerESC
{
  $AdminKey = "HKLM:\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A7-37EF-4b3f-8CFC-4F3A74704073}"
  $UserKey = "HKLM:\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A8-37EF-4b3f-8CFC-4F3A74704073}"
  Set-ItemProperty -Path $AdminKey -Name "IsInstalled" -Value 0 -Force -ErrorAction SilentlyContinue -Verbose
  Set-ItemProperty -Path $UserKey -Name "IsInstalled" -Value 0 -Force -ErrorAction SilentlyContinue -Verbose
  Write-Host "IE Enhanced Security Configuration (ESC) has been disabled." -ForegroundColor Green -Verbose
}

#Enable-InternetExplorer File Download
function EnableIEFileDownload
{
  $HKLM = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3"
  $HKCU = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3"
  Set-ItemProperty -Path $HKLM -Name "1803" -Value 0 -ErrorAction SilentlyContinue -Verbose
  Set-ItemProperty -Path $HKCU -Name "1803" -Value 0 -ErrorAction SilentlyContinue -Verbose
  Set-ItemProperty -Path $HKLM -Name "1604" -Value 0 -ErrorAction SilentlyContinue -Verbose
  Set-ItemProperty -Path $HKCU -Name "1604" -Value 0 -ErrorAction SilentlyContinue -Verbose
}

function ConfigurePhp($iniPath)
{
    $content = get-content $iniPath -ea SilentlyContinue;

    if ($content)
    {
      $content = $content.replace(";extension=curl","extension=curl");
      $content = $content.replace(";extension=fileinfo","extension=fileinfo");
      $content = $content.replace(";extension=mbstring","extension=mbstring");
      $content = $content.replace(";extension=openssl","extension=openssl");
      $content = $content.replace(";extension=pdo_mysql","extension=pdo_mysql");

      set-content $iniPath $content;
    }
}

function AddPhpApplication($path, $port)
{
  #create an IIS web site on the path and port
  New-IISSite -Name "ContosoStore" -BindingInformation "*:$($port):" -PhysicalPath "$path\Public"

  #add IIS permissions
  $ACL = Get-ACL -Path "$path\storage";
  $AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("IUSR","FullControl","Allow");
  $ACL.SetAccessRule($AccessRule);
  $ACL | Set-Acl -Path "$path\storage";

  $ACL = Get-ACL -Path "$path\bootstrap\cache";
  $AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("IUSR","FullControl","Allow");
  $ACL.SetAccessRule($AccessRule);
  $ACL | Set-Acl -Path "$path\bootstrap\cache";

  iisreset /restart 
}

Start-Transcript -Path C:\WindowsAzure\Logs\CloudLabsCustomScriptExtension.txt -Append

[Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls
[Net.ServicePointManager]::SecurityProtocol = "tls12, tls11, tls" 

mkdir "c:\temp" -ea SilentlyContinue;
mkdir "c:\labfiles" -ea SilentlyContinue;

#download the solliance pacakage
$WebClient = New-Object System.Net.WebClient;
$WebClient.DownloadFile("https://raw.githubusercontent.com/solliancenet/common-workshop/main/scripts/common.ps1","C:\LabFiles\common.ps1")
$WebClient.DownloadFile("https://raw.githubusercontent.com/solliancenet/common-workshop/main/scripts/httphelper.ps1","C:\LabFiles\httphelper.ps1")
$WebClient.DownloadFile("https://raw.githubusercontent.com/solliancenet/common-workshop/main/scripts/rundeployment.ps1","C:\LabFiles\rundeployment.ps1")

#run the solliance package
. C:\LabFiles\Common.ps1
. C:\LabFiles\HttpHelper.ps1

Set-Executionpolicy unrestricted -force

DisableInternetExplorerESC

EnableIEFileDownload

EnableDarkMode

SetFileOptions

InstallChocolaty

InstallAzPowerShellModule

InstallChrome

InstallNotepadPP

InstallGit
        
InstallAzureCli

InstallIIs

Install7z

InstallWebPI

InstallWebPIPhp "PHP80x64,MySQLConnector,UrlRewrite2,ARRv3_0"

$version = "8.0.16"
InstallPhp $version;

ConfigurePhp "C:\tools\php80\php.ini";
ConfigurePhp "C:\tools\php81\php.ini";

$phpDirectory = "C:\tools\php80\";
$phpPath = "$phpDirectory\php-cgi.exe";

Set-WebHandler -Name "PHP_via_FastCGI" -Path "*.php" -ScriptProcessor "$phpPath"

# Set the max request environment variable for PHP
$configPath = "system.webServer/fastCgi/application[@fullPath='$php']/environmentVariables/environmentVariable"
$config = Get-WebConfiguration $configPath
if (!$config) {
    $configPath = "system.webServer/fastCgi/application[@fullPath='$php']/environmentVariables"
    Add-WebConfiguration $configPath -Value @{ 'Name' = 'PHP_FCGI_MAX_REQUESTS'; Value = 10050 }
}

# Configure the settings
# Available settings: 
#     instanceMaxRequests, monitorChangesTo, stderrMode, signalBeforeTerminateSeconds
#     activityTimeout, requestTimeout, queueLength, rapidFailsPerMinute, 
#     flushNamedPipe, protocol   
$configPath = "system.webServer/fastCgi/application[@fullPath='$phpPath']"
Set-WebConfigurationProperty $configPath -Name instanceMaxRequests -Value 10000
Set-WebConfigurationProperty $configPath -Name monitorChangesTo -Value '$phpDirectory\php.ini'

InstallMySql

InstallPython "3.9";

#install composer globally
choco install composer

choco install openssl

$version = "8.0.26";
InstallMySQLWorkbench $version;

cd "C:\Program Files\MySQL\MySQL Workbench 8.0 CE"

#setup the sql database.

.\mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 's2admin'@'localhost' IDENTIFIED BY 'P@s`$w0rd123!';"
.\mysql -u root -e "CREATE DATABASE contosostore;"

$extensions = @("ms-vscode-deploy-azure.azure-deploy", "ms-azuretools.vscode-docker", "ms-python.python", "ms-azuretools.vscode-azurefunctions");

InstallVisualStudioCode $extensions;

InstallVisualStudio "community";

Install7Zip;

InstallFiddler;

#to add the user to docker group
$global:localusername = "wsuser";

InstallDockerDesktop $global:localusername;

Uninstall-AzureRm -ea SilentlyContinue

$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine")

cd "c:\labfiles";

$branchName = "main";
$workshopName = "microsoft-mysql-developer-guide";
$repoUrl = "solliancenet/$workshopName";

#download the git repo...
Write-Host "Download Git repo." -ForegroundColor Green -Verbose
git clone https://github.com/solliancenet/$workshopName.git $workshopName

ConfigurePhp "c:\tools\php80\php.ini";

$path = "C:\labfiles\$workshopName\sample-php-app";
$port = "8080";
AddPhpApplication $path $port;

#run composer on app path
cd "$path";
composer install;

Stop-Transcript