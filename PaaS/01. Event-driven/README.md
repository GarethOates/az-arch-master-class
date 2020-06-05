# Event-driven

### Introduction


### Instructions

Below are the step-by-step instructions and an explanation of each step.

1. Create Event grid partner topic. Follow the below steps:

	- In the Azure portal, search for **Event Grid Partner Topic**. Click on it.
	
	- Click on Create button present there for Auth0 Partner topic.
	
	- Provide the values for **Subscription ID** and **Resource Group Name**.
	
	- Click on **To Auth0 website**.
	
	- Login to the website using GitHub or other account you wish. Then Go to **Open Dashboard**
	
	- Click on the **Monitoring** -> **Streams**
	
	- Click on **Create Stream**. Provide the inputs for Event Grid.
	
	- In the Azure portal, Check for the Partner topic that you created.


2. Create Azure Function App from the GitHub Code. Follow the below steps:

	- Clone the [repository] (https://github.com/jeffhollan/build-2020-eventdriven). Open the code in Visual Studio.
	
	- In the project, Go to **Connected Devices** -> **Publish** -> **Start**.
	
	- Choose **Azure** -> **Azure Function App**.
	
	- Create a new Function App.
	
	- Provide inputs for creating the Azure Function App. 
	
	- Publish the Function App.
	
	- In the Azure portal, View the Azure Function App which you created.

3. Create a Logic App. Follow the below steps:
	
	- In the Azure portal, search for **Logic App**. Click on it.
	
	- Click on **Add**. Provide inputs and create a Logic App.
	
	- After Logic App gets created. Go to **Logic App Designer**.
	
	- Create a event trigger. Provide the following values:
	
		- Resource Type - `Microsoft.EventGrid/partnerTopics`
		
		- Partner Topic Name - `<Name of Partner Topic created in Step -1>`

	- Create a action. Go to all -> Azure Functions
	
	- Select the App function which got created in Step-2
	
	- Choose Process_Event function from the function app
	
	- Add dynamic content "body" to the body.

