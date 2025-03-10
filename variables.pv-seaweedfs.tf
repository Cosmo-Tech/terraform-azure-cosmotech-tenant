variable "pv_seaweedfs_deploy" {
  type = bool
}
variable "pv_seaweedfs_storage_gbi" {
  type = number
}
variable "pv_seaweedfs_storage_account_type" {
  type = string
}
variable "pv_seaweedfs_replicas" {
  type = number
}
variable "pv_seaweedfs_storage_class_name" {
  type = string
}
variable "pv_seaweedfs_provider" {
  type = string
}
variable "pv_seaweedfs_master_disk_deploy" {
  type = bool
}
variable "pv_seaweedfs_volume_disk_deploy" {
  type = bool
}
variable "pv_seaweedfs_master_disk_source_existing" {
  type = bool
}
variable "pv_seaweedfs_volume_disk_source_existing" {
  type = bool
}
variable "pv_seaweedfs_disk_master_name" {
  type = string
}
variable "pv_seaweedfs_disk_volume_name" {
  type = string
}