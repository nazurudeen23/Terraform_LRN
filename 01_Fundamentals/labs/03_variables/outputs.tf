output "rg_id" {
  description = "The ID of the Resource Group"
  value       = azurerm_resource_group.rg.id
}

output "vnet_name" {
  description = "The name of the created VNET"
  value       = azurerm_virtual_network.vnet.name
}
