module "deploy-persistence-seaweedfs" {
  source = "./persistence-seaweedfs"

  count = var.pv_seaweedfs_deploy ? 1 : 0

  kubernetes_mc_resource_group_name        = var.kubernetes_mc_resource_group_name
  kubernetes_tenant_namespace              = var.kubernetes_tenant_namespace
  location                                 = var.location
  pv_seaweedfs_provider                    = var.pv_seaweedfs_provider
  pv_seaweedfs_storage_account_type        = var.pv_seaweedfs_storage_account_type
  pv_seaweedfs_storage_class_name          = var.pv_seaweedfs_storage_class_name
  pv_seaweedfs_storage_gbi                 = var.pv_seaweedfs_storage_gbi
  pv_seaweedfs_master_disk_source_existing = var.pv_seaweedfs_master_disk_source_existing
  pv_seaweedfs_volume_disk_source_existing = var.pv_seaweedfs_volume_disk_source_existing
  pv_seaweedfs_disk_master_name            = var.pv_seaweedfs_disk_master_name
  pv_seaweedfs_disk_volume_name            = var.pv_seaweedfs_disk_volume_name
}
