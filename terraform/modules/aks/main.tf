resource "azurerm_kubernetes_cluster" "aks" {
    name                = var.cluster_name
    location            = var.location
    resource_group_name = var.resource_group_name
    dns_prefix          = var.dns_prefix

    default_node_pool {
        name       = var.default_node_pool_name
        node_count = var.node_count
        vm_size    = var.vm_size
    }
    kubernetes_version = var.kubernetes_version
    storage_profile {
      blob_driver_enabled = var.blob_driver_enabled
      disk_driver_enabled = var.disk_driver_enabled
      file_driver_enabled = var.file_driver_enabled
    }
    identity {
        type = "SystemAssigned"
    }
}


resource "azurerm_kubernetes_cluster_node_pool" "pool" {
  count                 = var.create_worker_pool ? 1 : 0
  name                  = var.worker_pool_name
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks.id
  vm_size               = var.worker_pool_vm_size
  node_count            = var.worker_pool_node_count
  os_sku                = var.worker_pool_os_sku
  mode                  = var.worker_pool_mode
}