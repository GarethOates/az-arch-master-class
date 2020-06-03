# Azure Blob Storage account with Event Grid subscription

### Introduction
This template creates an Azure Storage Account and an Event Grid subscription to that storage account. This template helps to route Blob storage events to web endpoint by using Event Grid.

#### Azure services supported
Currently, the following Azure services support sending events to Event Grid:

- Azure App Configuration
- Azure Blob Storage
- Azure Container Registry
- Azure Event Hubs
- Azure IoT Hub
- Azure Key Vault
- Azure Machine Learning
- Azure Maps
- Azure Media Services
- Azure resource groups
- Azure Service Bus
- Azure SignalR
- Azure subscriptions

#### List of events for Blob REST APIs
These events are triggered when a client creates, replaces, or deletes a blob by calling Blob REST APIs.

- **Microsoft.Storage.BlobCreated**	- Triggered when a blob is created or replaced.Specifically, this event is triggered when clients use the `PutBlob`, `PutBlockList`, or `CopyBlob` operations that are available in the Blob REST API.

- **Microsoft.Storage.BlobDeleted**	- Triggered when a blob is deleted. Specifically, this event is triggered when clients call the `DeleteBlob` operation that is available in the Blob REST API.

### Pre-requisites

You need a WebHook endpoint for receiving the events. If you have one, pass that URI as the `endpoint` parameter to the template present in the link. If you do not have an existing endpoint, the template in the **prereqs** folder deploys a web app that displays the event messages. Deploy this template to your subscription. Pass that URI in the format `https://<your-site>/api/updates/`

For more information, see [Create a message endpoint](https://docs.microsoft.com/azure/event-grid/custom-event-quickstart#create-a-message-endpoint).

### Instructions

Below are the step-by-step instructions and an explanation of each step. 

1. Click on the link below to find the template:

   https://github.com/Azure/azure-quickstart-templates/tree/master/101-event-grid-subscription-and-storage 
   
2. Click **Deploy to Azure** available there to deploy the solution to your subscription. 
   
3. In the Azure portal, provide values for the parameters. Specify the endpoint: provide the URL of your web app and add api/updates to the home page URL (`https://<your-site>/api/updates/`).

4. Select **Purchase** to deploy the template.

5. The deployment may take a few minutes to complete. After the deployment has succeeded, view your web app to make sure it's running. In a web browser, navigate to: `https://<your-site-name>.azurewebsites.net`

6. You see the site but no events have been posted to it yet.

7. Now, let's trigger an event to see how Event Grid distributes the message to your endpoint.

8. You trigger an event for the Blob storage by uploading a file. The file doesn't need any specific content (you can use any file).

9. When you upload the file to the Azure Blob storage, Event Grid sends a message to the endpoint you configured when subscribing. Now view your web app again, and notice that a blob creation event has been sent to it. The message will in the JSON format and it contains an array with one or more events.
