variable "name" {}
variable "location" {}

resource "azurerm_resource_group" "this" {
  name     = var.name
  location = var.location
}
