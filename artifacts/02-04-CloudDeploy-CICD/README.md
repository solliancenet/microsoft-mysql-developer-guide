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

1. Open the Azure Publish Settings page (https://portal.azure.com/#blade/Microsoft_Azure_ClassicResources/PublishingProfileBlade)
2. Select your target subscription, then select **Validate**
3. Select **Download Publish Settings**, copy the file to the root of your repository
4. Select **Project Settings**
5. Under **Pipelines**, select **Service Connections**
6. Select **Create service connection**
7. Select **Azure Resource Manager**
8. Select **Next**
9. For the authentication, select **Service principal (automatic)**
10. Select **Next**
11. For the service connection name, type **MySQL Dev**
12. Select **Grant access permission to all pipelines**
13. Select **Save**

### Create Pipeline

1. Select **Pipelines**
2. Select **Set up build**
3. Select **Existing Azure Pipelines YAML file**
4. Select the **azure-pipelines.yaml** file
5. Select **Continue**

### Commit changes

1. Run the following:

    ```powershell
    git add -A
    git commit -a -m "Pipeline settings"
    git push
    ```

### Test the deployment

1. TODO

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

### Test the code

1. TODO