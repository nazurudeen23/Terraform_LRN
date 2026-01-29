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

data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "rg" {
  name     = "rg-kv-lab"
  location = "East US"
}

resource "azurerm_key_vault" "kv" {
  name                        = "kv-tf-lab-${random_id.server.hex}"
  location                    = azurerm_resource_group.rg.location
  resource_group_name         = azurerm_resource_group.rg.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get", "List", "Set", "Delete", "Purge"
    ]

    storage_permissions = [
      "Get",
    ]
  }
}

resource "random_id" "server" {
  keepers = {
    # Generate a new ID only when a new resource group is defined
    resource_group = azurerm_resource_group.rg.name
  }
  byte_length = 8
}

resource "azurerm_key_vault_secret" "db_pass" {
  name         = "db-password"
  value        = "H@rdToGu3ssP4ssw0rd!"
  key_vault_id = azurerm_key_vault.kv.id
}

output "secret_uri" {
  value = azurerm_key_vault_secret.db_pass.id
}
