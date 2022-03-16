# Securing Azure Function Apps

In the previous function apps the connection information was embedded into the function app code.  As was covered in the traditional deployment models, it is a best practice to remove this information and place it into Azure Key Vault.  Here we will utilize the features of Azure to use Managed Identities to connect to the database.

> **NOTE** This is currenlty only supported on Azure Database for Single Server.

## Enable MySQL Azure AD Authentication

- Switch to the Azure Portal
- Browse to the **mysqldevSUFFIX** Azure Database for MySQL Single Server instance
- Under **Settings**, select **Active Directory admin**
- Select **Set admin**
- For the administrator, select your lab credentials

## Create Managed Identity

- Browse to the **mysqldevSUFFIX-addcustomerfunction** Function App
- Under **Settings**, select **Identity**
- For the **System assigned** identity, toggle to **On**
- Select **Save**, then select **Yes**
- Browse to the **Azure Active Directory** blade
- Select **Enterprise Applications**
- Search for the **mysqldevSUFFIX-addcustomerfunction** function application name, then select it.
- Copy the **Application ID** for later use

## Add Users to Database

- Login to the Azure Database for MySQL using the Azure AD Adminsitrator account
- Run the following, replace the `AZURE_APPLICATION_ID` with the one copied from above:

```sql
SET aad_auth_validate_oids_in_tenant = OFF;
CREATE AADUSER 'mymsiuser' IDENTIFIED BY 'AZURE_APPLICATION_ID';
--It is recommended to GRANTS necessary permission in DB
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, RELOAD, PROCESS, REFERENCES, INDEX, ALTER, SHOW DATABASES, CREATE TEMPORARY TABLES, LOCK TABLES, EXECUTE, REPLICATION SLAVE, REPLICATION CLIENT, CREATE VIEW, SHOW VIEW, CREATE ROUTINE, ALTER ROUTINE, CREATE USER, EVENT, TRIGGER ON *.* TO 'myuser'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
```

## Modify the code

- Open the `C:\labfiles\microsoft-mysql-developer-guide\Artifacts\06-04-FunctionApp-MSI` function app folder in Visual Studio Code
- Add the following code to get an access token \ password for the managed identity:

```python
from azure.identity import DefaultAzureCredential, AzureCliCredential, ChainedTokenCredential, ManagedIdentityCredential
managed_identity = ManagedIdentityCredential()
scope = "https://management.azure.com"
token = managed_identity.get_token(scope)
access_token = token.token
```

- Update the connection code to use the application id and the access token:

```python
# Connect to MySQL
    cnx = mysql.connector.connect(
        user="mymsiuser@mysqldevSUFFIX", 
        password=access_token, 
        host="mysqldevSUFFIX.mysql.database.azure.com", 
        port=3306,
        ssl_ca=crtpath,
        tls_versions=['TLSv1.2']
    )
```

- Run the following to deploy the updated Azure Function App:

```powershell
func azure functionapp publish mysqldevSUFFIX-addcustomerfunction
```

Browse to the function endpoint and see the data (the output of the previous command will include this information):

```text
https://mysqldevSUFFIX-addcustomerfunction.azurewebsites.net/api/addcustomerfunction?code=SOMECODE
```
