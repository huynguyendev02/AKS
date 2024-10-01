terraform {
  backend "azurerm" {}
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.114.0"
    }
  }
}

provider "azurerm" {
  features {}
}

module "aks" {
  source = "./modules/aks"
  location = var.location
  resource_group_name = var.resource_group_name
  cluster_name = "${terraform.workspace}-terraform-aks"
  dns_prefix = "terraformaks"
  default_node_pool_name = "systempool"
  node_count = 1
  vm_size = "Standard_DS2_v2"
  kubernetes_version = "1.30.0"
  blob_driver_enabled = true
  disk_driver_enabled = true
  file_driver_enabled = true

  create_worker_pool = terraform.workspace == "prod" ? true : false
  worker_pool_name = "workerpool"
  worker_pool_vm_size = "Standard_DS2_v2"
  worker_pool_node_count = 1
  worker_pool_os_sku = "Ubuntu"
  worker_pool_mode = "User"
}

