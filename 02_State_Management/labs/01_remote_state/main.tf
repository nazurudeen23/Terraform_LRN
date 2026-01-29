terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
  
  # Backend configuration
  # Update these values after running setup_backend.ps1
  # backend "azurerm" {
  #   resource_group_name  = "rg-tfstate-backend"
  #   storage_account_name = "CHANGE_ME"
  #   container_name       = "tfstate"
  #   key                  = "lab.terraform.tfstate"
  # }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "rg-remote-state-demo"
  location = "East US"
}
