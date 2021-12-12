# Deployment via CI/CD

This is a simple app that runs PHP code to connect to a MYSQL database.  Both the application and database are deployed via Docker containers.

## Azure DevOps Option

### Create DevOps Project

1. Login to Azure Dev Ops (https://dev.azure.com)
2. Select **New project**
3. For the name, type **contosocoffee**
4. Select **Create**

### Setup Git Origin and push code

1. Select **Repos**
2. In the **Push an existing repository from command line** section, select the **Copy** button
3. Switch to Visual Studio code
4. In the terminal window, run the following:

    ```powershell
    git remote remove origin
    ```

5. In the terminal window, paste the code you copied above, press **ENTER**

    ```powershell
    git remote add origin https://PROJECT_NAME@dev.azure.com/PROJECT_NAME/contosocoffee/_git/contosocoffee
    git push -u origin --all
    ```

6. In the dialog, login using your Azure Active Directory credentials for the repo.  You should see the files get pushed to the repo
7. Switch back to Azure Dev Ops, refresh the repo, you should see all the repo files

### Create Service Connection

1. Select **Project Settings**
2. Under **Pipelines**, select **Service Connections**
3. Select **Create service connection**
4. Select **Azure Resource Manager**
5. Select **Next**
6. For the authentication, select **Service principal (automatic)**
7. Select **Next**
8. Select your lab subscription and resource group

    > **NOTE** If you do not see any subscriptions displayed, open Azure Dev Ops in a in-private window and try again

9. For the service connection name, type **MySQL Dev**
10. Select **Grant access permission to all pipelines**
10.Select **Save**

### Create Pipeline

1. Select **Pipelines**
2. Select **Set up build**
3. Select **Existing Azure Pipelines YAML file**
4. Select the **/azure-pipelines.yaml** file
5. Select **Continue**
6. Select **Run**

### Create Release

1. Select **Releases**
2. Select **New pipeline**
3. Select the **Azure App Service Deployment**
4. Select **Apply**
5. In the **Artifacts** section, select the **Add an artifact** shape
6. For the project, select **contosocoffee**
7. For the source, select **contosocoffee**
8. Select **Add**

### Commit changes

1. Run the following:

    ```powershell
    git add -A
    git commit -a -m "Pipeline settings"
    git push
    ```

### Perform the deployment

1. TODO

### Test the DevOps deployment

1. Browse to `https://mysqldevSUFFIX.azurewebsites.net/default.php`, you should see `Hello World`
2. Browse to `https://mysqldevSUFFIX.azurewebsites.net/database.php`, you should see results.

## GitHub Option

### Create Github repo

1. Browse to https://github.com
2. Login with your GitHub credentials
3. In the top right, select the **+** then select **New repository**
4. For the name, type **contosocoffee**
5. Select **Create repository**

### Upload your application

1. Switch to Visual Studio code
2. In the terminal window, run the following:

    ```powershell
    git remote remove origin
    ```

3. In the terminal window, paste the code you copied above, press **ENTER**

    ```powershell
    git remote add origin https://github.com/USERNAME/contosocoffee.git
    git branch -M main
    git push -u origin main
    ```

4. In the dialog, login using your Azure Active Directory credentials for the repo.  You should see the files get pushed to the repo
5. Switch back to GitHub, refresh the repo, you should see all the repo files

### Deploy the code

1. TODO

### Test the GitHub deployment

1. Browse to `https://mysqldevSUFFIX.azurewebsites.net/default.php`, you should see `Hello World`
2. Browse to `https://mysqldevSUFFIX.azurewebsites.net/database.php`, you should see results.
