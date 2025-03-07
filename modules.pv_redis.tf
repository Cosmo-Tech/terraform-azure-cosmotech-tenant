module "deploy-persistence-redis" {
  source = "./persistence-redis"

  count = var.pv_redis_deploy ? 1 : 0

  kubernetes_mc_resource_group_name    = var.kubernetes_mc_resource_group_name
  kubernetes_tenant_namespace          = var.kubernetes_tenant_namespace
  location                             = var.location
  pv_redis_provider                    = var.pv_redis_provider
  pv_redis_storage_account_type        = var.pv_redis_storage_account_type
  pv_redis_storage_class_name          = var.pv_redis_storage_class_name
  pv_redis_storage_gbi                 = var.pv_redis_storage_gbi
  pv_redis_replicas                    = var.pv_redis_replicas
  pv_redis_master_disk_deploy          = var.pv_redis_master_disk_deploy
  pv_redis_master_disk_source_existing = var.pv_redis_master_disk_source_existing
}