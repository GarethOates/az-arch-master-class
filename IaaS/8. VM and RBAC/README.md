# RBAC - Existing VM

### Introduction

This template assigns Owner, Reader, Contributor, Virtual Machine Contributor access to an existing VM in a resource group. 

### Pre-requisites

Use following powershell command to get Principal ID associated with a user using their email id. Please note, principal id maps to the id inside the directory and can point to a user, service principal, or security group. The ObjectId is the principal ID.

PS C:\> Get-AzureADUser -Filter "userPrincipalName eq '<email id>'"
  
ObjectId                             DisplayName   UserPrincipalName          UserType
--------                             -----------   -----------------          --------
xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx <name>        <email id>                         

Please refer this [documentation](https://docs.microsoft.com/en-us/azure/role-based-access-control/built-in-roles) for more details on Built-in Roles.

### Instructions

Below are the step-by-step instructions and an explanation of each step. 

1. Click on the link below to find the template:

   https://github.com/Azure/azure-quickstart-templates/tree/master/101-rbac-builtinrole-virtualmachine
   
2. Click **Deploy to Azure** available there to deploy the solution to your subscription. 
   
3. In the Azure portal, provide values for the parameters.Inputs to this template are following fields: Principal ID, Virtual Machine Name, Built-in Role Type, GUID.

4. Select **Purchase** to deploy the template.

5. The deployment may take a few minutes to complete. After the deployment has succeeded, view your Virtual Machine.

6. Go to **Access control (IAM)** -> **Role assignments**. Search for the email id to which you assigned the role.

7. You will see that **User** is assigned that role and has permissions available for that role.
