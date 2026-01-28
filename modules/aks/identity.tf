
resource "azurerm_user_assigned_identity" "aks" {
  name                = "${var.aks_name}-identity"
  location            = var.location
  resource_group_name = var.rg_name
}

resource "azurerm_role_assignment" "acr_pull" {
  principal_id         = azurerm_user_assigned_identity.aks.principal_id
  role_definition_name = "AcrPull"
  scope                = var.acr_id
}
