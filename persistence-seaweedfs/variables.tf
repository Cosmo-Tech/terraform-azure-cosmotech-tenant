variable "kubernetes_tenant_namespace" {
  type = string
}

variable "kubernetes_mc_resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "pv_seaweedfs_storage_gbi" {
  type = number
}
variable "pv_seaweedfs_storage_account_type" {
  type = string
}

variable "pv_seaweedfs_storage_class_name" {
  type = string
}
variable "pv_seaweedfs_provider" {
  type = string
}