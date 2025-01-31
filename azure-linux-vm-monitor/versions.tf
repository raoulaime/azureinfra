terraform {
  required_version = ">=1.2"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=4.17.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "tfbackend-rg"
    storage_account_name = "tfbackendrakit"
    container_name       = "tfstate"
    key                  = "vmlinuxmonitor.tfstate"
  }
}

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
   subscription_id = var.subscription_id
}
