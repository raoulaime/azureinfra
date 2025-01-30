locals {
  resource_group_name = "azuremonitor-lab-rg"
  location            = "canadaeast"
  virtual_network = {
    name          = "lab-vnet"
    address_space = "10.0.0.0/16"
  }

  subnets = [
    {
      name           = "vm_snet"
      address_prefix = "10.0.0.0/24"
    },
    {
      name           = "data_snet"
      address_prefix = "10.0.1.0/24"
    }
  ]
}
