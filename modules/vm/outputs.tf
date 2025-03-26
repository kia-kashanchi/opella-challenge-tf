output "vm_id" {
  value = azurerm_virtual_machine.example.id
}

output "private_ip_address" {
  value = azurerm_network_interface.example.private_ip_address
}

output "public_ip_address" {
  value = azurerm_public_ip.example.ip_address
}