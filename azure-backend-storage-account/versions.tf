terraform {
  required_version = ">1.9.4"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=4.17.0"
    }
  }
}

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = true
    }
  }
  subscription_id = var.subscription_id
}
