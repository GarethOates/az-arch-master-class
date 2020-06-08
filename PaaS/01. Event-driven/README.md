# Azure Event Grid (Partner Topic)

### Introduction

By using partner topics, you can connect third-party event sources directly to Azure Event Grid. This integration allows you to subscribe to events from partners in the same way you subscribe to events from Azure services.

The first partner available through Event Grid partner topics is Auth0. You can use the Auth0 partner topic to connect your Auth0 and Azure accounts. The integration allows you to react to, log, and monitor Auth0 events in real time.

Please refer [documentation](https://docs.microsoft.com/en-us/azure/event-grid/partner-topics-overview) for details.

### Instructions

Below are the step-by-step instructions and an explanation of each step.

#### Enable Event Grid resource provider
Before you can create the log stream, you will need to register the Event Grid resource provider. If you've used Event Grid before, skip to the next section.

To do so, go to your Azure portal:

1. Select Subscriptions
2. Select the subscription you're using for Event Grid
3. On the left menu, under Settings, select Resource providers
4. Find Microsoft.EventGrid
5. Select Register
6. Refresh and make sure that the status changes to Registered
Once the Event Grid resource provider is registered, please create the Log Stream and continue to the next section.

#### Create Event grid partner topic. 
Follow the below steps:
1. In the Azure portal, search for **Event Grid Partner Topic**. Click on it.
2. Click on Create button present there for Auth0 Partner topic.
3.Provide the values for **Subscription ID** and **Resource Group Name**.
4.Click on **To Auth0 website**.
5. Login to the website using GitHub or other account you wish. Then Go to **Open Dashboard**
6. Click on the **Monitoring** -> **Streams**
7. Click on **Create Stream**. Provide the inputs for Event Grid.
8. In the Azure portal, Check for the Partner topic that you created.

#### Activate your Auth0 Partner Topic in Azure
Activating the Auth0 topic in Azure allows events to flow from Auth0 to Azure.

1. Log in to the Azure Portal
2. Search 'Partner Topics' at the top and click 'Event Grid Partner Topics' under services.
3. Click on the topic that matches the stream you created in your Auth0 Dashboard.
4. Confirm the 'Source' field matches your Auth0 account.
5. Click Activate.

#### Subscribe to Your Auth0 Partner Topic
1. On the Event Grid topic page, select '+ Event Subscription' on the toolbar
2. On the Create Event Subscription page:
- Enter a name for event subscription
- Select your desired Azure service or WebHook for the Endpoint type.
- Follow the instructions for the particular service.
- Back on the Create Event Subscription page, select Create.

#### Create a message endpoint for Subscriber
1. Before subscribing to the partner topic, let's create the endpoint for the event message. 
2. Use the below Azure CLI command to deploy the webapp.

    `az group deployment create --resource-group gridResourceGroup --template-uri "https://raw.githubusercontent.com/Azure-Samples/azure-event-grid-viewer/master/azuredeploy.json" --parameters siteName=<site_name> hostingPlanName=viewerhost`
  
3. Replace `<site-name>` with a unique name for your web app. The web app name must be unique because it's part of the DNS entry.
4. The deployment may take a few minutes to complete. 
5. After the deployment has succeeded, view your web app to make sure it's running. 
6. In a web browser, navigate to: https://<your-site-name>.azurewebsites.net
  
Refer this [section](https://docs.microsoft.com/en-us/azure/event-grid/custom-event-quickstart) to know more on creating WebHook for the endpoint. 
  
  

