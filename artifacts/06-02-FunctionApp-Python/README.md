# Azure Function with MySQL (Python)

https://techcommunity.microsoft.com/t5/azure-database-for-mysql-blog/how-to-connect-to-azure-database-for-mysql-using-managed/ba-p/1518196

## Setup

You can utilize Visual Studio or Visual Studio Code to create Azure Functions.  

### Visual Studio Code

- Install the [`Azure Functions`](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurefunctions) and [`Python`](https://marketplace.visualstudio.com/items?itemName=ms-python.python) extensions
- Install [Python 3.9.x](https://www.python.org/downloads/)
- Install the [Azure Functions core tools MSI](https://go.microsoft.com/fwlink/?linkid=2174087)

## Create the Function Application

The application here is based on an HTTP Trigger that will then make a call into the Azure Database for MySQL instance and add some records. You can create this function by performing the following steps.

- Install the required software above
- Open Visual Studio Code, type **Ctrl-Shift-P**
- Select **Azure Functions: Create New Project**

    ![This image demonstrates how to create a new Function App project.](./media/create-function-app-vscode.png "New Function App project")

- Select your project path
- Select **Python**
- Select the **python 3.9.x** option
- Select the **HTTP trigger**

    ![This image demonstrates configuring the HTTP Trigger for the new Function App.](./media/http-trigger-vscode.png "Configuring HTTP Trigger")

- For the name, type **AddCustomerFunction**
- For the authorization level, select **Function**
- Select **Open in current window**
- Update the function code in `__init__.py` to the following, ensuring that you replace the connection information. This Function completes the following tasks when its HTTP endpoint receives a request:
  - Connecting to the MySQL Flexible Server instance provisioned in the ARM template
  - Generating a list of databases on the MySQL instance
  - Building a formatted response
  - Returning the formatted response to the caller

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
        host="mysqldevflex[SUFFIX].mysql.database.azure.com", 
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
  - Verify that you are using the virtual environment created by the Azure Functions extension (the command prompt will be prefaced by `(.venv)`)
    - If the virtual environment is not active, open the command palette, select `Python: Select Interpreter`, and choose the virtual environment
  - Install the MySQL connector:

    ```powershell
    pip install mysql-connector-python
    ```

    ![This image demonstrates the Virtual Environment and MySQL connector installation in the PowerShell terminal.](./media/terminal-set-up.png "Virtual environment and connector installation")

  - Run the function app:

    ```powershell
    func start run
    ```

- Open a browser window to the following. You should see a list of databases load

    ```text
    http://localhost:7071/api/AddCustomerFunction
    ```

- Azure recommends that Flexible Server clients use the service's public SSL certificate for secure access. Download the [Azure SSL certificate](https://www.digicert.com/CACerts/BaltimoreCyberTrustRoot.crt.pem) to the Function App project root directory
- Add the following lines to the Python code to utilize the Flexible Server public certificate and support connections over TLS 1.2:

```python
crtpath = '../BaltimoreCyberTrustRoot.crt.pem'
#crtpath = '../DigiCertGlobalRootCA.crt.pem' #THIS IS THE OLD CERT, USE THE BALTIMORE CERT

# Connect to MySQL
cnx = mysql.connector.connect(
    user="s2admin", 
    password='Solliance123', 
    host="mysqldevflex[SUFFIX].mysql.database.azure.com", 
    port=3306,
    ssl_ca=crtpath,
    tls_versions=['TLSv1.2']
)
```

- Call the endpoint again in your browser. The Function App should still operate

## Deploy the Function Application

Now that you have the Function App created and working locally, the next step is to publish the Function App to Azure.  This will require some small changes.

- Add the following Python function:

```Python
import pathlib

def get_ssl_cert():
    current_path = pathlib.Path(__file__).parent.parent
    return str(current_path / 'BaltimoreCyberTrustRoot.crt.pem')
```

- Modify the `ssl_ca` parameter to call the `get_ssl_cert()` function and get the certificate file path

```python
ssl_ca=get_ssl_cert(),
```

- Open the `requirements.txt` file and add the following. The Azure Functions runtime will install the dependencies in this file

```text
azure-functions
mysql-connector-python
```

- Switch to the terminal window and run the following. Follow the instructions to log in to your Azure subscription:

```PowerShell
az login
```

- If necessary, switch to your target subscription:

```PowerShell
az account set --subscription 'SUBSCRIPTION NAME'
```

- Switch to the terminal window and run the following from the repository root:

```PowerShell
func azure functionapp publish mysqldevSUFFIX-addcustomerfunction
```

You should now be able to browse to the function endpoint and see your data (the output of the previous command will include this information):

```text
https://mysqldevSUFFIX-addcustomerfunction.azurewebsites.net/api/addcustomerfunction?code=SOMECODE
```

## Azure portal

- Navigate to the Azure portal and select **AddCustomerFunction** from the **mysqldev[SUFFIX]-addcustomerfunction** Function App instance

    ![This image demonstrates how to select the AddCustomerFunction from the Function App instance.](./media/select-function-from-portal.png "Selecting the Function")

- On the **AddCustomerFunction** page, **Code + Test**. Then, select **Test/Run** to access the built-in testing interface
- Issue a simple GET request to the Function App endpoint. You can use a *function key*, which is scoped to an individual Function App, or a *host key*, which is scoped to an Azure Functions instance.

    ![This image demonstrates how to configure a GET request to the Function App endpoint from the Azure portal.](./media/azure-portal-function-test.png "GET request test")

- You should immediately see the Function App execute successfully, with logs indicating a successful connection to MySQL Flexible Server

    ![This image demonstrates the logs of a successful Function App invocation.](./media/function-app-logs.png "Function App invocation logs")
