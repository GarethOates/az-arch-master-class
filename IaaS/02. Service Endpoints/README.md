# Add service endpoints to a subnet in a Virtual Network and secure a storage account

### Introduction
This template creates a new VNet with 2 subnets, a NIC in each subnet. Enables service endpoint to Storage on one of the subnets and secures a new storage account to that subnet.

### Instructions

Below are the step-by-step instructions and an explanation of each step. 

1. Click on the link below to find the template:

   https://github.com/Azure/azure-quickstart-templates/blob/master/201-vnet-2subnets-service-endpoints-storage-integration
   
2. Click **Deploy to Azure** available there to deploy the solution to your subscription. 
   
3. In the Azure portal, provide values for the parameters.

4. Select **Purchase** to deploy the template.

5. The deployment may take a few minutes to complete. After the deployment has succeeded, view your Virtual Network.

6. You see the 2 subnets are created, follow the below steps to check service endpoint:

   - Go to **Virtual Network** -> **Subnets**.
   
   - You will be able to see 2 Subnets. Go to **subnet1**.
   
   - Check under the **Service Endpoints**. **Microsoft.Storage** is selected under the services.
   
7. Lets check under the storage account. Follow the below steps:

   - Go to **Storage account**, we created using this template.
   
   - Go to **Settings** -> **Firewalls and virtual networks**. 
   
   - Under **Selected networks**, you can see the Virtual network we created through the template.

8. Now, lets test the storage account access. Go to the storage account we created using this template. 

   - Create a "test" container.
   
   - Click on the container to upload a file.
   
   - You will see a error saying "This request is not authorized to perform this operation".
