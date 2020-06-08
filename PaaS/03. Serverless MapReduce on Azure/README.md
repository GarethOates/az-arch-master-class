# Serverless MapReduce on Azure

### Introduction

MapReduce is a programming model that allows processing and generating big data sets with a parallel, distributed algorithm on a cluster.

A MapReduce implementation consists of a:

`Map()` function that performs filtering and sorting, and a

`Reduce()` function that performs a summary operation on the output of the Map() function

Both the input and output of the MapReduce implementation are <key, value> pairs: `(input) <k1, v1>` -> `map()` -> `<k2, v2>` -> `combine()` -> `<k2, v2>` -> `reduce()` -> `<k3, v3>` (output)

The model is a specialization of the split-apply-combine strategy for data analysis and allows for significant increased speed in a multi-threaded implementation.

Please refer [documentation](https://docs.microsoft.com/en-us/samples/azure-samples/durablefunctions-mapreduce-dotnet/big-data-processing-serverless-mapreduce-on-azure/) for details.

### Instructions

Download the [code](https://github.com/vlele/az-arch-master-class/tree/master/PaaS/03.%20Serverless%20MapReduce%20on%20Azure/Serverless-MapReduce-on-Azure) present in the repo to work with this solution.

Below are the step-by-step instructions and an explanation of each step.

#### Copy the dataset to an Azure Blob Storage instance

1. In the Azure portal, Create a Storage account and create a container under the storage account.
2. Open a new PowerShell window.
3. Before running the script install the **Azure.Storage** module. Run the below command to install the module:
	 `Install-Module -Name Azure.Storage -AllowClobber`
4. Import the  module using the below command:
	 `Import-Module -Name Azure.Storage`
5. Execute `TaxiDataImporter.ps1` from the repo directory to copy each file from the NYC Taxi site in to your Azure Storage Account.
6. You'll be asked to provide the following: Subscription ID, Resource Group Name, Storage Account Name and Container Name

#### Deploy the Map Reduce code

Follow the steps to deploy this solution to your own Azure subscription:

> Note: By default all resources will be provisioned in the West US 2 region of Azure. If you wish to have them somewhere else, provide the -region parameter to the deployment script

1. Execute `deploy.ps1` with the following inputs:
	- Subscription ID
	- Base name for resources
2. Following resources will be provisioned for you
	- New Resource group
	- 2 Application Insights instances (one for each of v1 and v2 Function apps)
	- 2 Storage accounts
	- 1 Consumption App Service Plan
	- 2 Function Apps
3. Open `ServerlessMapReduce.sln` in Visual Studio. Build the solution.
4. You'll first notice there are two projects in the solution. One is a Function v2 (.Net Standard) project, the other is a Function v1 (.Net 4.x aka "netfx") project. The code for each project is identical, and shared between the two via linked files.
3. Right-click on first project and choose 'Publish' -> 'Azure'. Select the v1 app service that got created using the PowerShell script. Publish it to v1 app service.
4. Right-click on second project and choose 'Publish' -> 'Azure'. Select the v2 app service that got created using the PowerShell script. Publish it to v2 app service.
5. After the code is published to the app service. Lets test the app service.

#### Testing the Function App
1. Visit your **Function App v1** in the Azure portal.
2. Click the **StartAsync** function.
3. Click **Test**. It open a side window to test the connection.
4. Select the HTTP Method as **POST**.
5. Select the key provided in the dropdown.
6. In Query parameters, pass the Name as Path and value of the path. Value pf path will be path of `<path where code is downloaded>\ServerlessMapReduce.v1` on your local computer.
7. You'll receive back a list of URLs you can use to check status, issue new events (not handled by this sample), or terminate the orchestration.

