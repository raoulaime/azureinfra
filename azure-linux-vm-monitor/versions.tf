terraform {
  required_version = ">=1.2"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.11.0, <4.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.3.2"
    }
  }
  backend "azurerm" {
    resource_group_name  = "tf-demo-lab"
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
}

provider "random" {}