data "template_file" "cloudinitdata" {
  template = file("script.sh")
}

resource "azurerm_public_ip" "labvm_ip" {
  name                = "${var.project}-${var.environment}-public-ip"
  resource_group_name = azurerm_resource_group.lab_rg.name
  location            = azurerm_resource_group.lab_rg.location
  allocation_method   = "Static"
  depends_on = [
    azurerm_resource_group.lab_rg
  ]
}
resource "azurerm_network_interface" "vm_nic" {
  name                = "${var.project}-${var.environment}-nic"
  location            = azurerm_resource_group.lab_rg.location
  resource_group_name = azurerm_resource_group.lab_rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnets[0].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.labvm_ip.id
  }

  depends_on = [
    azurerm_subnet.subnets
  ]
}

resource "azurerm_linux_virtual_machine" "linuxvm" {
  name                = "${var.project}-${var.environment}-vm"
  resource_group_name = azurerm_resource_group.lab_rg.name
  location            = azurerm_resource_group.lab_rg.location
  size                = var.vm_size
  admin_username      = var.admin_username
  custom_data         = base64encode(data.template_file.cloudinitdata.rendered)
  network_interface_ids = [
    azurerm_network_interface.vm_nic.id
  ]

  boot_diagnostics {

  }
  admin_ssh_key {
    username   = var.admin_username
    public_key = local.ssh_public_key
  }

  os_disk {
    name                 = "${var.project}-${var.environment}-vm-osdisk"
    caching              = var.os_disk["caching"]
    storage_account_type = var.os_disk["storage_account_type"]
    disk_size_gb         = var.os_disk["disk_size_gb"]
  }

  source_image_reference {
    publisher = var.source_image_reference["publisher"]
    offer     = var.source_image_reference["offer"]
    sku       = var.source_image_reference["sku"]
    version   = var.source_image_reference["version"]
  }
  depends_on = [
    azurerm_network_interface.vm_nic,
    azurerm_resource_group.lab_rg,
  ]
}
