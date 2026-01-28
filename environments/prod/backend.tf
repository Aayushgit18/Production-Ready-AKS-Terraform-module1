terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "tfstateaksprod"
    container_name       = "tfstate"
    key                  = "prod/aks.tfstate"
  }
}
