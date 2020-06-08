# Serverless MapReduce on Azure

### Introduction

MapReduce is a programming model that allows processing and generating big data sets with a parallel, distributed algorithm on a cluster.

A MapReduce implementation consists of a:

`Map()` function that performs filtering and sorting, and a

`Reduce()` function that performs a summary operation on the output of the Map() function

Both the input and output of the MapReduce implementation are <key, value> pairs: `(input) <k1, v1>` -> `map()` -> `<k2, v2>` -> `combine()` -> `<k2, v2>` -> `reduce()` -> `<k3, v3>` (output)

The model is a specialization of the split-apply-combine strategy for data analysis and allows for significant increased speed in a multi-threaded implementation.

Please refer [documentation](https://docs.microsoft.com/en-us/samples/azure-samples/durablefunctions-mapreduce-dotnet/big-data-processing-serverless-mapreduce-on-azure/) for details.

### Prerequisites

If you choose to complete this setup using PowerShell script. Execute the `SetupEnvironment.ps1` PowerShell script from an Administrator PowerShell instance.

Note: If you've never run PowerShell scripts on your computer, you'll need to change the Execution Policy to allow script running by executing Set-ExecutionPolicy Bypass -Scope Process -Force before running the above command. Using -Scope Process here ensures ExecutionPolicy isn't permanently set to allow scripts on your machine, but rather just while you're doing the import

This performs the following permanent changes to your machine:

- Installs Chocolatey (for package installation automation)
- Installs Azure PowerShell
- Installs .Net Core SDK (to build v2 app)
- Installs .Net 4.6.1 Developer pack (to build v1 app)

### Instructions

Please click on the [GitHub link](https://github.com/Azure-Samples/durablefunctions-mapreduce-dotnet/tree/master/) to find the Code for Serverless MapReduce on Azure.

Below are the step-by-step instructions and an explanation of each step.

#### Copy the dataset to an Azure Blob Storage instance

1. In the Azure portal, Create a Storage account and create a conatiner under the storage account.
2. Open a new PowerShell window.
2. Execute TaxiDataImporter.ps1 from the repo directory to copy each file from the NYC Taxi site in to your Azure Storage Account.
3. You'll be asked to provide the following:
	- A connection string to your Azure Storage account
	- The container name within the storage account into which to copy the data.

#### Deploy the Map Reduce code

There are two ways to choose from to deploy this solution to your own Azure subscription:

#### **1. Visual Studio**
Follow the below steps to deploy the code using the Visual Studio:
1. Open `ServerlessMapReduce.sln` in Visual Studio.
2. You'll first notice there are two projects in the solution. One is a Function v2 (.Net Standard) project, the other is a Function v1 (.Net 4.x aka "netfx") project. The code for each project is identical, and shared between the two via linked files.
3. Right-click either/both of the project(s) and choose 'Publish...'
4. Walk through the wizard to create: 
	- App service plan
	- Storage account
	- Function app instance

#### **2. Powershell**
Follow the below steps to deploy the code using the PowerShell:

**Important**: Run `deploy.ps1` in a new PowerShell window only after you've executed `SetupEnvironment.ps1`. This refreshes environment variables so the build & deploy commands will execute successfully

1. Execute `deploy.ps1` with the following inputs:
	- Subscription ID
	- Base name for resources
	
   > Note: By default all resources will be provisioned in the West US 2 region of Azure. If you wish to have them somewhere else, provide the -region parameter to the deployment script
   
2.Following resources will be provisioned for you
	- New Resource group
	- 2 Application Insights instances (one for each of v1 and v2 Function apps)
	- 2 Storage accounts
	- 1 Consumption App Service Plan
	- 2 Function Apps

#### Testing
1. Visit your Function App in the Azure Portal.
2. Click the StartAsync function.
3. Click 'Get function URL' & copy it for usage in your favorite REST API testing program.
4. Issue an HTTP POST to that endpoint with the path parameter populated from the output of the PowerShell script you ran in 2.1.
5. You'll receive back a list of URLs you can use to check status, issue new events (not handled by this sample), or terminate the orchestration.




