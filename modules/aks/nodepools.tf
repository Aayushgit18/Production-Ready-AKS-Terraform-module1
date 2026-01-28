
resource "azurerm_kubernetes_cluster_node_pool" "user" {
  name                  = "usernp"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.this.id
  vm_size               = var.user_vm_size
  min_count             = 1
  max_count             = 5
  enable_auto_scaling   = true
  vnet_subnet_id        = var.user_subnet_id
}
