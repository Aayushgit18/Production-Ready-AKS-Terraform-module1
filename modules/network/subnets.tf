
resource "azurerm_subnet" "system" {
  name                 = "aks-system-subnet"
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = [var.system_subnet_cidr]
}

resource "azurerm_subnet" "user" {
  name                 = "aks-user-subnet"
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = [var.user_subnet_cidr]
}
