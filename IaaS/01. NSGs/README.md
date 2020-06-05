# Multi-tier VNet with NSGs and DMZ

### Introduction
This template creates a VNet with 3 subnets:

* **Frontend** - _FESubnet / 10.0.0.0/24_
* **Application** - _AppSubnet / 10.0.1.0/24_
* **Database** - _DBSubnet / 10.0.2.0/24_

It also creates three Network Security Groups - one per subnet:

* **Frontend** - _FE_NSG_
* **Application** - _App_NSG_
* **Database** - _DB_NSG_

Each NSG is then associated with a subnet:

* _FESubnet_ to _FE_NSG_
* _AppSubnet_ to _App_NSG_
* _DBSubnet_ to _DB_NSG_

It creates DMZ rules for the App subnet to expose endpoints to the Internet. It secures the App subnet and the Database subnet with appropriate rules. It blocks Outbound Internet access to VMs in the App and Database subnets. It opens up the Database Subnet only on port 1433 the App Subnet.

### Instructions

Below are the step-by-step instructions and an explanation of each step. 

1. Click on the link below to find the template:

   https://github.com/Azure/azure-quickstart-templates/tree/master/201-nsg-dmz-in-vnet
   
2. Click **Deploy to Azure** button available there to deploy the solution to your subscription. 
   
3. In the Azure portal, provide values for the parameters.

4. Select **Purchase** to deploy the template.

5. The deployment may take a few minutes to complete. After the deployment has succeeded, view your Virtual Network.

6. You see the 3 subnets are created and if you click on each subnet, a NSG is associated with the Subnet.

7. Now, let's check the connection with help of Virtual Machine. Follow the below steps:

   - Create a Virtual Machine using the Azure CLI command:
   
      `az vm create --resource-group <rgname> 
         --name myVM 
         --image UbuntuLTS 
         --admin-username azureuser 
         --generate-ssh-keys 
         --priority Spot 
         --max-price -1 
         --vnet-name First_ARM_VNet 
         --subnet AppSubnet`
   
  - Using this command we are creating a VM in the VNet which we created using the tempplate and let provide the Subnet name as `AppSubnet`
  
  - As the **AppSubnet** is connected to App_NSG, If you check the NSG Rules for App_NSG i.e. Block_RDP_Internet: It denys the Internet over Port 3389.
  
  - When you go to VM, **Overview** -> **Connect** -> **RDP**. 
   
  - Download the RDP file. Try to connect to VM. 
  
  - You will see a error "Remote computer is not available on the network".
