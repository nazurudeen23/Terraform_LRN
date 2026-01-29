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
  name     = "rg-workspace-${terraform.workspace}"
  location = "East US"
}

output "rg_name" {
  value = azurerm_resource_group.rg.name
}
