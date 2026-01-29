# Variables
$ResourceGroupName = "rg-tfstate-backend"
$Location = "EastUS"
$StorageAccountName = "tfstate" + (Get-Random -Minimum 1000 -Maximum 9999)
$ContainerName = "tfstate"

# Create Resource Group
az group create --name $ResourceGroupName --location $Location

# Create Storage Account
az storage account create --resource-group $ResourceGroupName --name $StorageAccountName --sku Standard_LRS --encryption-services blob

# Create Blob Container
az storage container create --name $ContainerName --account-name $StorageAccountName

Write-Host "--------------------------------------------------"
Write-Host "Storage Account Name: $StorageAccountName"
Write-Host "Container Name: $ContainerName"
Write-Host "Access Key:"
az storage account keys list --resource-group $ResourceGroupName --account-name $StorageAccountName --query "[0].value" -o tsv
Write-Host "--------------------------------------------------"
Write-Host "Update your main.tf backend configuration with these values."
