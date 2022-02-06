# Azure Function with MySQL (Python)

https://techcommunity.microsoft.com/t5/azure-database-for-mysql-blog/how-to-connect-to-azure-database-for-mysql-using-managed/ba-p/1518196

## Setup

You can utilize Visual Studio or Visual Studio code to create Azure Functions.  

### Visual Studio

- Install the [Azure Functions core tools](https://github.com/Azure/azure-functions-core-tools)

## Create the Function Application

The application here is based on an Http Trigger that will then make a call into the Azure Database for MySQL instance and add some records. You can create this function by performing the following steps.

- Install the required software above
- Open Visual Studio, select **Create a new project**
- Search for **Azure Functions**
- Select **C#** for the language
- Select **Next**
- For the name, type **AddCustomerFunction**
- Select your project path
- Select **Create**
- Select the **HTTP trigger**
- For the Storage account, select **Storage Emulator**
- For the authorization level, select **Function**
- Select **Create**
- Update the function class to the following, be sure to replace the connection information:

```csharp
public static class AddCustomerFunction
    {
        [FunctionName("AddCustomerFunction")]
        public static async Task<IActionResult> Run(
            [HttpTrigger(AuthorizationLevel.Function, "get", "post", Route = null)] HttpRequest req,
            ILogger log)
        {
            builder = new MySqlConnectionStringBuilder
            {
                Server = "mysqldevflexmbsjnv3m.mysql.database.azure.com",
                UserID = "s2admin",
                Password = "Solliance123",
                SslMode = MySqlSslMode.Required
            };

            string responseMessage = "";

            using (var conn = new MySqlConnection(builder.ConnectionString))
            {
                conn.Open();

                using (var command = conn.CreateCommand())
                {
                    command.CommandText = "SHOW DATABASES;";
                    MySqlDataReader r = command.ExecuteReader();

                    while (r.Read())
                    {
                        responseMessage += r["Database"] + "\r\n";
                    }
                }
            }

            return new OkObjectResult(responseMessage);
        }
    }
```

> **NOTE** You do not have to specify the certificate and the SslMode is set to required.

- Right-click the project, select **Manage Nuget Pacakges**
- Search for **MySqlConnector**, select **Install**
- Select **Ok** if prompted
- Press **F5** to start the function
- Open a browser window to the following:

```text
http://localhost:7071/api/AddCustomerFunction
```

## Deploy the Function Application

Now that you have the function app created and working locally, the next step is to publish the function app to Azure. 

- Right click the project, select **Publish**
- Select **Azure**, then select **Next**
- For the target, select **Azure Function App (Linux)**
- Select **Next**
- Select your account, subscription and resource group
- Select the **mysqldevSUFFIXAddCustomerFunction** function app
- Select **Finish**
- Select **Publish**, if prompted, select **OK** to update the runtime version.

You should now be able to browse to the function endpoint and see your data:

```text
https://mysqldevSUFFIX-addcustomerfunction.azurewebsites.net/api/addcustomerfunction?code=SOMECODE
```