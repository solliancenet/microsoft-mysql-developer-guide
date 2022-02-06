# Introduction to the guide sample application

Instead of learning multiple sample applications, the guide focused on evolving deployment strategies. Readers could learn the sample application structure once and focus on how the application would need to be modified in order fit the deployment model.

## Sample application overview and story

ContosoNoshNow is a delivery service and logistics company focused on making delicious food accessible to their customers no matter where they are located. The company started with a simple web application they could easily maintain and add features to as the business grew. A few years later, their CIO realized the application performance and their current on-premises environment were not meeting their business's growing demand. The application deployment process took hours, yielded unreliable results, and the admin team could not easily find production issues quickly. During the busy hours, customers complained the web application was slow.

The development team knew moving to Azure could help with these issues.

## Solution architecture

TODO: Diagram

## Site map and example default page

TODO

## Prerequisites

TODO
- Azure subscription
- Git
- 

## Quick start: manual Azure set up instructions

As you continue with this guide, you will be able to take advantage of the environment automation scripts that will build and configure much of your environment. It is important to understand the basic Azure concepts before running automated scripts. Walking through each steps will help provide additional context and learning opportunities.

>**Note:** The sample application will work with PHP 7.X or 8.0. **We recommend deploying to 8.0 environment**. Deploying to a 7.X requires a slightly different configuration as the underlying web server has changed.

| PHP Version | Web Server |
|-------------|----------------|
| 7.3         | Apache         |
| 7.4         | Apache         |
| 8.0         | Nginx          |

The Azure App Service uses this [Docker image](https://github.com/Azure-App-Service/nginx-fpm) for its 8.0 container builds. Outdated runtimes are periodically removed from the Web Apps Create and Configuration blades in the Portal. These runtimes are hidden from the Portal when they are deprecated by the maintaining organization or found to have significant vulnerabilities. These options are hidden to guide customers to the latest runtimes where they will be the most successful. Older Azure App Service Docker images can be found [here](https://github.com/Azure-App-Service/php).

TODO: Update details about the steps.

## Sample application deployment steps

- Step 1: Log into the Azure Portal. Create Azure Web App + Flexible Server database resources.
- Step 2: Log into App Service terminal and add Composer to project directory.
- Step 3: Add Git Local configuration via Deployment Center and capture credential information.
- Step 4: Clone the MS MySQL Developer Guide Sample App repo locally. Configure Git project settings on your local machine. Add remote Deployment Center upstream repo URL and credentials.
- Step 5: Push PHP app to App Service repo. Run composer update and php artisan generate key.
- Step 6: Configure URL redirect.
- Step 7: Configure the environment variables.

[Sample application evolution artifact repo](https://)

## What happens to my app during an Azure deployment?

All the officially supported deployment methods make changes to the files in the /home/site/wwwroot folder of your app. These files are used to run your app.  The web framework of your choice may use a subdirectory as the site root. For example, Laravel, uses the public/ subdirectory as the site root.

TODO: add more specific information related to getting PHP/Laravel running in Azure.

## Troubleshooting tips

TODO

Azure resource activity log.

## Resources

[How PHP apps are detected and built.](https://github.com/microsoft/Oryx/blob/main/doc/runtimes/php.md)
