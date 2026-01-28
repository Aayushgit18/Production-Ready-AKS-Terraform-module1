variable "name" {}
variable "location" {}
variable "rg_name" {}

resource "azurerm_container_registry" "this" {
  name                = var.name
  resource_group_name = var.rg_name
  location            = var.location
  sku                 = "Premium"
  admin_enabled       = false
}

output "id" {
  value = azurerm_container_registry.this.id
}
