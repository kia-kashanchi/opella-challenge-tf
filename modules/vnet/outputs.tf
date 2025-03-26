output "vnet_id" {
  value = azurerm_virtual_network.example.id
}

output "subnet_ids" {
  value = { for s in azurerm_virtual_network.example.subnet : s.name => s.id }
}