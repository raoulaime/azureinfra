output "vm_public_ip_address" {
    description = "VM public IP Address"
    value = azurerm_linux_virtual_machine.linuxvm.public_ip_addresses
}