output "frontend_nsg_id" {
  value = azurerm_network_security_group.frontend_nsg.id
}

output "backend_nsg_id" {
  value = azurerm_network_security_group.backend_nsg.id
}

output "db_nsg_id" {
  value = azurerm_network_security_group.db_nsg.id
}
