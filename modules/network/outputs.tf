output "system_subnet_id" { value = azurerm_subnet.system.id }
output "user_subnet_id" { value = azurerm_subnet.user.id }
output "vnet_id" { value = azurerm_virtual_network.this.id }
output "aks_private_dns_zone_id" { value = azurerm_private_dns_zone.aks.id }
