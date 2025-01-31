resource "azurerm_resource_group" "lab_rg" {
  name     = local.resource_group_name
  location = local.location
}

resource "azurerm_virtual_network" "lab_vnet" {
  name                = local.virtual_network.name
  location            = azurerm_resource_group.lab_rg.location
  resource_group_name = azurerm_resource_group.lab_rg.name
  address_space       = [local.virtual_network.address_space]

  depends_on = [
    azurerm_resource_group.lab_rg
  ]
}

resource "azurerm_subnet" "subnets" {
  count                = length(local.subnets)
  name                 = local.subnets[count.index].name
  resource_group_name  = azurerm_resource_group.lab_rg.name
  virtual_network_name = azurerm_virtual_network.lab_vnet.name
  address_prefixes     = [local.subnets[count.index].address_prefix]

  depends_on = [
    azurerm_virtual_network.lab_vnet
  ]
}

resource "azurerm_network_security_group" "vm_snet_nsg" {
  name                = "${var.project}-${var.environment}-vm-snet-nsg"
  location            = local.location
  resource_group_name = local.resource_group_name

  security_rule {
    name                       = "AllowSSH"
    priority                   = 300
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "AllowHTTP"
    priority                   = 400
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  depends_on = [
    azurerm_resource_group.lab_rg
  ]
}

resource "azurerm_subnet_network_security_group_association" "vm_snet_nsg_link" {
  subnet_id                 = azurerm_subnet.subnets[0].id
  network_security_group_id = azurerm_network_security_group.vm_snet_nsg.id
}
