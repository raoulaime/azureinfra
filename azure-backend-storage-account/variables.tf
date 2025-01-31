variable "az_region" {
  default = "canadacentral"
}

variable "az_location" {
  default = "canadacentral"
}

variable "subscription_id" {
  default = "subscription_id"
}

variable "az_resource_group" {
  description = "Azure Resource Group Name"
  default     = "lab-backend-rg"
}

variable "az_storage_account" {
  default = "tfbackendrakit"
}

variable "az_storage_account_container" {
  default = "tfstate"
}
