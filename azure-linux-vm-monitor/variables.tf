variable "subscription_id" {
  description = "subscription_id"
}

variable "project" {
  type    = string
  default = "lab"
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "vm_size" {
  type        = string
  description = "Virtual machine sku"
  default     = "Standard_DS1_v2"
}

variable "admin_username" {
  type        = string
  description = "Azure VM Admin"
  default     = "azureadmin"
}


variable "source_image_reference" {
  type = map(string)
  default = {
    publisher = "RedHat"
    offer     = "RHEL"
    sku       = "93-gen2"
    version   = "latest"
  }
}

variable "os_disk" {
  type = map(string)
  default = {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    disk_size_gb         = "80"
  }
}
