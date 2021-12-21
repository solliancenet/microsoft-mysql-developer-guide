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
    $content = get-content $iniPath;

    $content = $content.replace(";extension=curl","extension=curl");
    $content = $content.replace(";extension=fileinfo","extension=fileinfo");
    $content = $content.replace(";extension=mbstring","extension=mbstring");
    $content = $content.replace(";extension=openssl","extension=openssl");

    set-content $iniPath $content;
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

InstallWebPI

InstallWebPIPhp

$version = "8.0.8"
InstallPhp $version;

InstallMySql

#install composer globally
choco install composer

choco install openssl

$version = "8.0.26";
InstallMySQLWorkbench $version;

$extensions = @("ms-vscode-deploy-azure.azure-deploy");

InstallVisualStudioCode $extensions;

#to add the user to docker group
$global:localusername = "wsuser";

InstallDockerDesktop

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