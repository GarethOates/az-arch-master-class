# Azure Bastion Host

### Introduction

This template will deploy Azure Bastion in a new or existing Azure Virtual Network, along with dependent resources such as the AzureBastionSubnet, Public Ip Address for Azure Bastion, and Network Security Group rules.

Please refer this [documentation](https://docs.microsoft.com/en-us/azure/bastion/bastion-overview) for more details on Azure Bastion Host.

### Instructions

Below are the step-by-step instructions and an explanation of each step. 

1. Click on the link below to find the template:

   https://github.com/Azure/azure-quickstart-templates/tree/master/101-azure-bastion
   
2. Click **Deploy to Azure** available there to deploy the solution to your subscription. 
   
3. In the Azure portal, provide values for the parameters.

4. Select **Purchase** to deploy the template.

5. The deployment may take a few minutes to complete. After the deployment has succeeded, view your Azure Bastion Host.

6. Now, Let try to connect the Virtual Machine through the Azure Bastion Host. Follow the below steps:

   - In the Azure portal, Create a Virtual Machine.

   - Go to **Overview** -> **Connect** -> **Bastion**

   - Provide User name and Password to connect to VM.

   - Click **Connect**.

   - The SSH/RDP connection to this virtual machine via Bastion will open directly in the Azure portal (over HTML5) using port 443 and the Bastion service.



