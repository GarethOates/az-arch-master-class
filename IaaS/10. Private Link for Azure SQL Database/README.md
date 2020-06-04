# Private link for Azure SQL Database

### Introduction
This template allows you to create private endpoint to Azure SQL Database.

Please refer this [documentation](https://docs.microsoft.com/en-us/azure/private-link/create-private-endpoint-template) for more details.

### Instructions

Below are the step-by-step instructions and an explanation of each step. 

1. Click on the link below to find the template:

   https://github.com/Azure/azure-quickstart-templates/tree/master/101-private-endpoint-sql
   
2. Click **Deploy to Azure** available there to deploy the solution to your subscription. 
   
3. In the Azure portal, provide values for the parameters.

4. Select **Purchase** to deploy the template.

5. The deployment may take a few minutes to complete. After the deployment has succeeded, view your Azure SQL Database.

6. Now, lets connect to the VM from the internet as follows:

   - Go to Virtual Machine which we created using the template.

   - Select the **Connect** button. After selecting the Connect button, Connect to virtual machine opens. 
   
   - Select Download RDP File. Azure creates a Remote Desktop Protocol (.rdp) file and downloads it to your computer.

   - Open the downloaded.rdp* file. If prompted, select Connect. Enter the username and password you specified when creating the VM.
   
7. Now, lets access SQL Database Server privately from the VM. We will connect to the SQL Database Server from the VM using the Private Endpoint using the below steps:

   - In the Remote Desktop of VM, open PowerShell.

   - Enter `nslookup <sqlserver name>.database.windows.net` command. You'll receive a message that shows that it is connected using the Private Endpoint.
   
   - Install SQL Server Management Studio

   - In Connect to server, enter or select this information: 
      
      **Server type**: Select Database Engine.
      
      **Server name**: `<server name>.database.windows.net` 
      
      **Username**: Enter a username provided during creation. 
      
      **Password**: Enter a password provided during creation. Remember password: Select Yes.

   - Select Connect.

   - Browse Databases from left menu.

   - (Optionally) Create or query information from sample-db
