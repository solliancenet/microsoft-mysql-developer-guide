# Introduction to the guide sample application

## Overview and application story

ContosoNoshNow is a delivery service and logistics company focused on making delicious food accessible to their customers no matter where they are located. The company started with a simple web application they could easily maintain and add features to as the business grew. A few years later, their CIO realized the application performance and their current on-premises environment were not meeting their business's growing demand. The application deployment process took hours, yielded unreliable results, and the admin team could not easily find production issues quickly. During the busy hours, customers complained the web application was slow.

The development team knew moving to Azure could help with these issues.
## Solution architecture
TODO: Diagram

## Site map and example default page
TODO
## Quick start: Manual Azure set up instructions

TODO: Update details about the steps.

- Step 1: Create Azure Web App + Flexible Server database resources.
- Step 2: Log into App Service and add Composer to project directory.
- Step 3: Clone MS repo locally. Add Git Local configuration via Deployment Center and capture.
- Step 4: Configure local Git project settings. Add remote Deployment Center upstream.
- Step 5: Push PHP app to repo. Run composer update and php artisan generate key.
- Step 6: Configure URL redirect.
- Step 7: Configure the environment variables.

[Sample application evolution artifact repo](https://)

## What happens to my app during an Azure deployment?

All the officially supported deployment methods make changes to the files in the /home/site/wwwroot folder of your app. These files are used to run your app.  The web framework of your choice may use a subdirectory as the site root. For example, Laravel, uses the public/ subdirectory as the site root.

TODO: add more specific information related to getting PHP/Laravel running in Azure.

## Resources

[How PHP apps are detected and built.](https://github.com/microsoft/Oryx/blob/main/doc/runtimes/php.md)
