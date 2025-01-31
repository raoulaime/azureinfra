variable "az_location" {
  description = "Azure Region"
  type        = string
}

variable "subscription_id" {
  description = "subscription_id"
  type        = string
}

variable "az_resource_group_name" {
  description = "Azure Resource Group Name"
  type        = string
}

variable "az_storage_account_name" {
  description = "Azure Storage Account Name"
  type        = string
}

variable "az_storage_account_container_name" {
  description = "Azure Terraform Backend Storage Account Container"
  type        = string
}
