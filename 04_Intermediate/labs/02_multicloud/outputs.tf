output "azure_resource_group_id" {
  description = "The ID of the Azure Resource Group."
  value       = azurerm_resource_group.rg.id
}

output "azure_storage_account_name" {
  description = "The name of the Azure Storage Account."
  value       = azurerm_storage_account.st.name
}

output "azure_storage_account_id" {
  description = "The ID of the Azure Storage Account."
  value       = azurerm_storage_account.st.id
}
