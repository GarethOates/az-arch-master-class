# Linux VM with MSI Accessing Azure Storage

### Introduction
This template deploys a **Linux VM Ubuntu** with a system assigned MSI that has a role assignment to a storage account in a different resource group.

### Pre-requisites

You need a existing storage account in different resource group. If you have one, pass that Resource Group Name and Storage Account Name to the template present in the link. If you do not have an existing storage account, the template in the **prereqs** folder deploys a storage account. Deploy this template to your subscription in different resource group.

### Instructions

Below are the step-by-step instructions and an explanation of each step. 

1. Click on the link below to find the template:

   https://github.com/Azure/azure-quickstart-templates/tree/master/201-vm-msi-storage
   
2. Click **Deploy to Azure** available there to deploy the solution to your subscription. 
   
3. In the Azure portal, provide values for the parameters.

4. Select **Purchase** to deploy the template.

5. The deployment may take a few minutes to complete. After the deployment has succeeded, view the Virtual Machine.

6. Click on **Identity**. You will see the System-Assigned Identity is selected. Click on the **Persmissions: Azure Role Assignment** button to view the Azure RBAC roles assigned to this managed identity and the permissions to this role.

7. Follow the below steps to test the Managed Identity to access the Azure Storage. We will Get an access token and use it to call Azure Storage using these steps:

   - In the Azure portal, navigate to Storage account which we created in other resource group, go to containers, create a "test" container and upload a file "test.txt" with the content of your choice to the container.

   - In the Azure portal, navigate to Virtual Machines, go to your Linux virtual machine, then from the Overview page click Connect. Copy the string to connect to your VM.

   - Connect to the VM with the SSH client of your choice.

   - In the terminal window, using CURL, make a request to the local Managed Identity endpoint to get an access token for Azure Storage.

       `curl 'http://169.254.169.254/metadata/identity/oauth2/token?api-version=2018-02-01&resource=https%3A%2F%2Fstorage.azure.com%2F' -H Metadata:true`

   - Now use the access token to access Azure Storage, for example to read the contents of the sample file which you previously uploaded to the container. Replace the values of `<STORAGE ACCOUNT>`, `<CONTAINER NAME>`, and `<FILE NAME>` with the values you specified earlier, and `<ACCESS TOKEN>` with the token returned in the previous step.

      `curl https://<STORAGE ACCOUNT>.blob.core.windows.net/<CONTAINER NAME>/<FILE NAME> -H "x-ms-version: 2017-11-09" -H "Authorization: Bearer <ACCESS TOKEN>"`

   - The response contains the contents of the file which you uploaded to the container.
