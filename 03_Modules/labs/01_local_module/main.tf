terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-module-lab"
  location = "East US"
}

module "network" {
  source = "./modules/vnet"

  vnet_name           = "vnet-from-module"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.10.0.0/16"]
}

output "new_vnet_id" {
  value = module.network.vnet_id
}
