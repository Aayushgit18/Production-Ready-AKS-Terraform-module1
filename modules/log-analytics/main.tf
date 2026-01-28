variable "name" {}
variable "location" {}
variable "rg_name" {}

resource "azurerm_log_analytics_workspace" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.rg_name
  sku                 = "PerGB2018"
}
