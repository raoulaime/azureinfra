locals {
  resource_group_name = "lab-grp"
  location            = "canadaeast"
  virtual_network = {
    name          = "lab-network"
    address_space = "10.0.0.0/16"
  }

  subnets = [
    {
      name           = "vm_subnet"
      address_prefix = "10.0.0.0/24"
    },
    {
      name           = "data_subnet"
      address_prefix = "10.0.1.0/24"
    }
  ]
}
