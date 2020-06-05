# Multi-container app using a Docker Compose configuration

### Introduction

Azure App Service is a fully managed compute platform that is optimized for hosting websites and web applications. Customers can use App Service on Linux to host web apps natively on Linux for supported application stacks.

Web App for Containers provides a flexible way to use Docker images. This quickstart shows how to deploy a multi-container app (preview) to Web App for Containers in the Cloud Shell using a Docker Compose configuration.

Please refer [documentation](https://docs.microsoft.com/en-us/azure/app-service/containers/quickstart-multi-container) for details.

### Instructions

Below are the step-by-step instructions and an explanation of each step.

1. In the Azure portal, Go to CloudShell.

2. In the Cloud Shell, create a quickstart directory and then change to it.

	`mkdir quickstart`

	`cd $HOME/quickstart`

3. Run the following command to clone the sample app repository to your quickstart directory. Then change to the multicontainerwordpress directory.

	`git clone https://github.com/Azure-Samples/multicontainerwordpress`

	`cd multicontainerwordpress`

4. Create a Resource Group, using the following command:
	
	`az group create --name <resource_group_name> --location "South Central US"`

5. Create an Azure App Service plan, using the following command:

	`az appservice plan create --name <app_service_plan> --resource-group <resource_group_name> --sku S1 --is-linux`

6. Create a Docker Compose app, using the following command:

	`az webapp create --resource-group myResourceGroup --plan <app_service_plan> --name <app_name> --multicontainer-config-type compose --multicontainer-config-file compose-wordpress.yml`

7. Browse to the deployed app at `http://<app_name>.azurewebsites.net`. The app may take a few minutes to load. If you receive an error, allow a few more minutes then refresh the browser.

Note: You can also use the Azure CLI to execute these commands.
