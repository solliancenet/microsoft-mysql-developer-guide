# Azure Function with MySQL (Python)

https://techcommunity.microsoft.com/t5/azure-database-for-mysql-blog/how-to-connect-to-azure-database-for-mysql-using-managed/ba-p/1518196

## Setup

You can utilize Visual Studio or Visual Studio code to create Azure Functions.  

### Visual Studio Code

- Install the `Azure Functions` extension.
- Install Python 3.9.x
- Install the [Azure Functions core tools](https://github.com/Azure/azure-functions-core-tools)

## Create the Function Application

The application here is based on an Http Trigger that will then make a call into the Azure Database for MySQL instance and add some records. You can create this function by performing the following steps.

- Install the required software above
- Open Visual Studio Code, type **Ctrl-Shift-P**
- Select **Azure Functions: Create new Project**
- Select your project path
- Select **Python**
- Select the **py-3.9** option
- Select the **HTTP trigger**
- For the name, type **AddCustomerFunction**
- For the authorization level, select **Function**
- Select **Open in current window**
- Update the function code to the following, be sure to replace the connection information:

```python
import logging
import azure.functions as func
import mysql.connector

def main(req: func.HttpRequest) -> func.HttpResponse:
    logging.info('Python HTTP trigger function processed a request.')
    # Connect to MySQL
    cnx = mysql.connector.connect(
        user="s2admin", 
        password='Solliance123', 
        host="mysqldevflexmbsjnv3m.mysql.database.azure.com", 
        port=3306
    )
    logging.info(cnx)
    # Show databases
    cursor = cnx.cursor()
    cursor.execute("SHOW DATABASES")
    result_list = cursor.fetchall()
    # Build result response text
    result_str_list = []
    for row in result_list:
        row_str = ', '.join([str(v) for v in row])
        result_str_list.append(row_str)
    result_str = '\n'.join(result_str_list)
    return func.HttpResponse(
        result_str,
        status_code=200
    )
```

- Open the terminal window
- Run the following:

```bash
func start run
```

- Open a browser window to the following:

```text
http://localhost:7071/api/AddCustomerFunction
```

- You should get an error
- Download the [Azure certificate](https://www.digicert.com/CACerts/BaltimoreCyberTrustRoot.crt.pem)
- Add the following lines to the python code:

```
crtpath = '../BaltimoreCyberTrustRoot.crt.pem'
#crtpath = '../DigiCertGlobalRootCA.crt.pem' #THIS IS THE OLD CERT, USE THE BALTIMORE CERT

# Connect to MySQL
cnx = mysql.connector.connect(
    user="ctao@azure-mysql-test", 
    password='<your_password>', 
    host="azure-mysql-test.mysql.database.azure.com", 
    port=3306,
    ssl_ca=crtpath,
    tls_versions=['TLSv1.2']
)
```

- Open the terminal window
- Run the following to install the `mysql` library:

```bash
#pip install mysql-connector #NOTE this is the older 2.2 and does not support TLS1.2

pip install mysql-connector-python
```

- Run the following:

```bash
func start run
```

## Deploy the Function Application

Now that you have the function app created and working locally, the next step is to publish the function app to Azure.  This will require some small changes.

- Add the following function

```Python
import pathlib

def get_ssl_cert():
    current_path = pathlib.Path(__file__).parent.parent
    return str(current_path / 'BaltimoreCyberTrustRoot.crt.pem')
```

- Modify the parameter to call the function and get the cert

```python
ssl_ca=get_ssl_cert(),
```

- Open the `requirements.txt` file and add the following:

```text
azure-functions
mysql-connector-python
```

- Switch to the terminal window and run the following and then follow the instructions to login to your Azure subscription:

```PowerShell
az login
```

- If necessary, switch to your target subscription:

```PowerShell
az account set --subscription 'SUBSCRIPTION NAME'
```

- Switch to the terminal window and run the following:

```PowerShell
func azure functionapp publish mysqldevSUFFIX-addcustomerfunction
```

You should now be able to browse to the function endpoint and see your data (the output of the previous command will include this information):

```text
https://mysqldevSUFFIX-addcustomerfunction.azurewebsites.net/api/addcustomerfunction?code=SOMECODE
```