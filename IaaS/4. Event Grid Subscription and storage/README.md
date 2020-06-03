# Create Azure Blob Storage account with Event Grid subscription

Introduction
------------

This template creates an Azure Storage Account and then creates an Event Grid subscription to that storage account. This template helps to route Blob storage events to web endpoint by using Event Grid.

### Azure services support sending events to Event Grid
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

### List of events for Blob REST APIs
These events are triggered when a client creates, replaces, or deletes a blob by calling Blob REST APIs.

- Microsoft.Storage.BlobCreated	

Triggered when a blob is created or replaced.
Specifically, this event is triggered when clients use the `PutBlob`, `PutBlockList`, or `CopyBlob` operations that are available in the Blob REST API.

- Microsoft.Storage.BlobDeleted	
Triggered when a blob is deleted. Specifically, this event is triggered when clients call the `DeleteBlob` operation that is available in the Blob REST API.



You need a WebHook endpoint for receiving the events. If you have one, pass that URI as the `endpoint` parameter. If you do not have an existing endpoint, the template in the **prereqs** folder deploys a web app that displays the event messages. Deploy this template to your subscription. Pass that URI in the format `https://<your-site>/api/updates/` For more information, see [Create a message endpoint](https://docs.microsoft.com/azure/event-grid/custom-event-quickstart#create-a-message-endpoint).

Please click on the link below to find the template:

https://github.com/Azure/azure-quickstart-templates/tree/master/101-event-grid-subscription-and-storage

(Click on Deploy to Azure button available there to deploy the template)

Below are the step-by-step instructions and an explanation of each step. 




