output "vm_public_ip_address" {
    description = "VM public IP Address"
    value = azurerm_public_ip.labvm_ip
}