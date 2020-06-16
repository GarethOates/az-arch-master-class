# Multi-container group

### Introduction

Azure Container Instances supports the deployment of multiple containers onto a single host using a container group. A container group is useful when building an application sidecar for logging, monitoring, or any other configuration where a service needs a second attached process.

Please refer [documentation](https://docs.microsoft.com/en-us/azure/container-instances/container-instances-multi-container-group) for details.

### Instructions

Below are the step-by-step instructions and an explanation of each step.

1. In the Azure portal, Search for the **Deploy a Custom Template**. Click on it and go to **Build your own template in the editor**.

2. Paste the **azuredeploy.json** to editor available there.

3. In the Azure portal, provide values for the parameters. Inputs to this template are following fields: Container group name.

4. After the template is deployed, Go to the **Resource Group** -> **Container Group** which you created using the template.

5. Go to Containers. You will see the 2 Containers present under the container group.

6. Click on **Container 1**. Click on the **Logs** button present there to check the logs of container 1.

7. Click on **Container 2**. Click on the **Logs** button present there to check the logs of container 2.

8. As you can see, the sidecar is periodically making an HTTP request to the main web application via the group's local network to ensure that it is running. This sidecar example could be expanded to trigger an alert if it received an HTTP response code other than 200 OK.

Note: You can also use the Azure CLI to deploy the template and see the logs for the container.

#### Azure CLI commands:

1. Template deployment:

	`az group deployment create --resource-group <resource_group_name> --template-file azuredeploy.json`

2. To view the state of the deployment:

	`az container show --resource-group <resource_group_name> --name <container_group_name> --output table`

3. To view container logs:

	`az container logs --resource-group <resource_group_name> --name <container_group_name> --container-name <container_name>`
