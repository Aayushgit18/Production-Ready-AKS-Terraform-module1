module "rg" {
  source   = "../../modules/resource-group"
  name     = var.rg_name
  location = var.location
}

module "network" {
  source     = "../../modules/network"
  depends_on = [module.rg]   

  vnet_name          = var.vnet_name
  vnet_cidr          = var.vnet_cidr
  location           = var.location
  rg_name            = var.rg_name
  system_subnet_cidr = var.system_subnet_cidr
  user_subnet_cidr   = var.user_subnet_cidr
}

module "log" {
  source     = "../../modules/log-analytics"
  depends_on = [module.rg]  

  name     = var.log_name
  location = var.location
  rg_name  = var.rg_name
}

module "acr" {
  source     = "../../modules/acr"
  depends_on = [module.rg]   

  name     = var.acr_name
  location = var.location
  rg_name  = var.rg_name
}

module "aks" {
  source     = "../../modules/aks"
  depends_on = [module.network, module.log, module.acr] # ✅ FIX

  aks_name              = var.aks_name
  location              = var.location
  rg_name               = var.rg_name
  system_subnet_id      = module.network.system_subnet_id
  user_subnet_id        = module.network.user_subnet_id
  log_analytics_id      = module.log.workspace_id
  user_vm_size          = var.user_vm_size
  acr_id                = module.acr.id
  admin_group_object_id = var.admin_group_object_id
}
