# Private link for Azure SQL Database

### Introduction
This template allows you to create private endpoint to Azure SQL Database.

### Instructions

Below are the step-by-step instructions and an explanation of each step. 

1. Click on the link below to find the template:

   https://github.com/Azure/azure-quickstart-templates/tree/master/101-private-endpoint-sql
   
2. Click **Deploy to Azure** available there to deploy the solution to your subscription. 
   
3. In the Azure portal, provide values for the parameters.

4. Select **Purchase** to deploy the template.

5. The deployment may take a few minutes to complete. After the deployment has succeeded, view your Azure SQL Database.

6. Now, lets Connect to the VM from the internet as follows:

   - In the portal's search bar, enter myVm{uniqueid}.

   - Select the Connect button. After selecting the Connect button, Connect to virtual machine opens. 
   
   - Select Download RDP File. Azure creates a Remote Desktop Protocol (.rdp) file and downloads it to your computer.

   - Open the downloaded.rdp* file. If prompted, select Connect. Enter the username and password you specified when creating the VM.
   
7. Now, lets Access SQL Database Server privately from the VM. We will connect to the SQL Database Server from the VM using the Private Endpoint using the below steps:

   - In the Remote Desktop of VM, open PowerShell.

   - Enter nslookup sqlserver{uniqueid}.database.windows.net. You'll receive a message that shows that it is connected using the Private Endpoint.
  

   


