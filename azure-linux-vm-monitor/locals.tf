locals {
  resource_group_name = "${var.project}-${var.environment}-rg"
  location            = "canadaeast"
  virtual_network = {
    name          = "${var.project}-${var.environment}-vnet"
    address_space = "10.0.0.0/16"
  }

  subnets = [
    {
      name           = "${var.project}-${var.environment}-vm-snet"
      address_prefix = "10.0.0.0/24"
    },
    {
      name           = "${var.project}-${var.environment}-data-snet"
      address_prefix = "10.0.1.0/24"
    }
  ]
  ssh_public_key = file("~/.ssh/id_rsa.pub")
}
