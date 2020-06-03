# Create Azure Blob Storage account with Event Grid subscription

Please click on the link below to find the template. Click on Deploy to Azure button available there to deploy the template:

https://github.com/Azure/azure-quickstart-templates/tree/master/101-event-grid-subscription-and-storage

This template creates an Azure Storage Account and then creates an Event Grid subscription to that storage account.

You need a WebHook endpoint for receiving the events. If you have one, pass that URI as the `endpoint` parameter. If you do not have an existing endpoint, the template in the **prereqs** folder deploys a web app that displays the event messages. Deploy this template to your subscription. Pass that URI in the format `https://<your-site>/api/updates/` For more information, see [Create a message endpoint](https://docs.microsoft.com/azure/event-grid/custom-event-quickstart#create-a-message-endpoint).

`Tags: eventgrid`


