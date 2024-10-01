variable "cluster_name" {
  description = "The name of the AKS cluster"
  type        = string
}

variable "location" {
  description = "The location/region where the AKS cluster will be created"
  type        = string
  default     = "Southeast Asia"
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "dns_prefix" {
  description = "The DNS prefix for the AKS cluster"
  type        = string
}

variable "default_node_pool_name" {
  description = "The name of the default node pool"
  type        = string
}

variable "node_count" {
  description = "The number of nodes in the default node pool"
  type        = number
  default     = 1
}

variable "vm_size" {
  description = "The size of the virtual machines in the default node pool"
  type        = string
  default     = "Standard_DS2_v2"
}

variable "kubernetes_version" {
  description = "The version of Kubernetes to use for the AKS cluster"
  type        = string
}

variable "blob_driver_enabled" {
  description = "Enable or disable the blob driver"
  type        = bool
  default     = false
}

variable "disk_driver_enabled" {
  description = "Enable or disable the disk driver"
  type        = bool
  default     = true
}

variable "file_driver_enabled" {
  description = "Enable or disable the file driver"
  type        = bool
  default     = true
}


variable "create_worker_pool" {
  description = "Create a worker pool"
  type        = bool
  default     = false
}
variable "worker_pool_name" {
  description = "The name of the worker pool"
  type        = string
  default     = "workerpool"
}

variable "worker_pool_vm_size" {
  description = "The size of the virtual machines in the worker pool"
  type        = string
  default     = "Standard_DS2_v2"
}

variable "worker_pool_node_count" {
  description = "The number of nodes in the worker pool"
  type        = number
  default     = 2
}

variable "worker_pool_os_sku" {
  description = "The OS SKU for the worker pool"
  type        = string
  default     = "Ubuntu"
}

variable "worker_pool_mode" {
  description = "The mode for the worker pool"
  type        = string
  default     = "User"
}