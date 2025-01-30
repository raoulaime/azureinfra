variable "location" {
  type    = string
  default = "canadaeast"
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
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}

variable "os_disk" {
  type = map(string)
  default = {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    disk_size_gb         = "30"
  }
}
