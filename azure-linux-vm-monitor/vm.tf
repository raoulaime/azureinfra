resource "tls_private_key" "sshkey" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "linuxpemkey" {
  filename        = "sshkey.pem"
  content         = tls_private_key.sshkey.private_key_pem
  file_permission = "0400"
  depends_on = [
    tls_private_key.sshkey
  ]
}


data "template_file" "cloudinitdata" {
  template = file("script.sh")
}

resource "azurerm_linux_virtual_machine" "linuxvm" {
  name                = "${var.project}-${var.environment}-vm"
  resource_group_name = azurerm_resource_group.lab.name
  location            = var.location
  size                = var.vm_size
  admin_username      = var.admin_username
  custom_data         = base64encode(data.template_file.cloudinitdata.rendered)
  network_interface_ids = [
    azurerm_network_interface.vm_nic.id
  ]

  admin_ssh_key {
    username   = var.admin_username
    public_key = tls_private_key.sshkey.public_key_openssh
  }

  os_disk {
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
    azurerm_resource_group.lab,
    tls_private_key.sshkey

  ]
}
