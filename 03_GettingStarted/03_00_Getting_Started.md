# Setup and Tools

## Azure Free Account

As described in the [Why Move to Azure document](../02_IntroToMySQL/02_01_Why_Move_To_Azure.md) document, Azure offers a $200 free credit for developers to trial Azure. Enroll today to explore MySQL offerings on Azure.

## Azure Subscriptions and Limits - TODO

## Azure Authentication - TODO

## Creating Landing Zones

The term *landing zone* refers to an Azure environment that supports application migration and modernization by facilitating scalability, security, governance, and more. Resources can be deployed to an Azure environment through the following tools.

## Azure CLI Tools

The Azure CLI is geared towards Bash shell users and is useful for automating tasks that cannot easily be performed in the Azure portal. Note that the CLI follows an *imperative* approach, meaning that users must explicitly script the creation of resources in the correct order, handle errors, and more.

It is possible to run the Azure CLI from the [Azure Cloud Shell](shell.azure.com) or to [download the CLI tools locally from Microsoft.](https://docs.microsoft.com/cli/azure/install-azure-cli)

## Azure PowerShell

Like the Azure CLI, Azure PowerShell is a useful automation tool that falls into the imperative infrastructure management category. It is geared towards Windows administrators, though PowerShell is cross-platform.

Again, developers can run Azure PowerShell directly from the [Azure Cloud Shell](shell.azure.com) or install the `Az` module from the PowerShell Gallery, as described in the [installation document.](https://docs.microsoft.com/powershell/azure/install-az-ps?view=azps-6.6.0)

## Visual Studio Code

Visual Studio Code is an open-source, cross-platform text editor. It offers useful utilities for various languages through extensions. Download Visual Studio Code from the [Microsoft download page.](https://code.visualstudio.com/download)

There is a [MySQL](https://marketplace.visualstudio.com/items?itemName=formulahendry.vscode-mysql) extension that allows developers to organize their database connections, administer databases, and query databases. Consider adding it to your Visual Studio Code workflow for MySQL.
