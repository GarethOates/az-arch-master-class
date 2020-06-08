<#
 .SYNOPSIS
    Deploys the Serverless Map Reduce template to Azure

 .DESCRIPTION
    Deploys an Azure Resource Manager template for 2 Azure Functions + related Storage and Application Insights instances
#>

param(
    # The subscription id where the template will be deployed.
    [Parameter(Mandatory = $True)]
    [string]$subscriptionId,
    [Parameter(Mandatory = $True)]
    [string]$resourceGroupName,
    # The base name of all resources deployed. eg: <baseName>rg, <baseName>storage, etc.
    [Parameter(Mandatory = $True)]
    [string]$baseName,
    # Optional, Azure region to which to deploy all resources. Defaults to West US 2
    [string]$region = "westus2"   
)

if ($baseName.Length -gt 18 -or [System.String]::IsNullOrWhiteSpace($baseName)) {
    Write-Error "baseName must be between 1 and 18 characters in length" -RecommendedAction "Reduce length of baseName parameter" -Category InvalidArgument
    return
}

$templateFilePath = "template.json"

# sign in
$currentSubscription = Get-AzSubscription -SubscriptionID $subscriptionId -ErrorAction SilentlyContinue
if (!$currentSubscription) {
    Write-Host "Logging in..."
    Login-AzAccount >$null
}

$ErrorActionPreference = "Stop"

# select subscription
Select-AzSubscription -SubscriptionID $subscriptionId >$null

# Register required RPs
foreach ($resourceProvider in @("microsoft.insights", "microsoft.storage", "microsoft.web")) {
    Register-AzResourceProvider -ProviderNamespace $resourceProvider >$null
}

#Create or check for existing resource group
$resourceGroup = Get-AzResourceGroup -Name $resourceGroupName -ErrorAction SilentlyContinue
if (!$resourceGroup) {
    if (!$region) {
        Write-Host "Resource group '$resourceGroupName' does not exist. To create a new resource group, please enter a location."
        $region = Read-Host "region"
    }
    Write-Host "Creating resource group '$resourceGroupName' in location '$region'"
    New-AzResourceGroup -Name $resourceGroupName -Location $region >$null
}
else {
    Write-Host "Using existing resource group '$resourceGroupName'"
}

# Start the deployment
Write-Host "Deploying Azure resources..."
New-AzResourceGroupDeployment -ResourceGroupName $resourceGroupName -TemplateFile $templateFilePath -base_name $baseName -region $region >$null

Write-Host "Done!" -ForegroundColor Green