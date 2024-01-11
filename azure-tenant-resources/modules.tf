module "create-network-resources" {
  source = "./create-network-resources"

  tags                     = local.tags
  subnet_name              = local.subnet_name
  subscription_id          = var.subscription_id
  location                 = var.location
  vnet_iprange             = var.vnet_iprange
  tenant_resource_group    = var.tenant_resource_group.name
  platform_resource_group  = var.platform_resource_group.name
  platform_vnet            = var.platform_vnet
  networkadt_sp_object_id  = var.networkadt_sp_object_id
  vnet_resource_group      = var.vnet_resource_group
  blob_privatedns_zonename = var.blob_privatedns_zonename
}

module "create-disk" {
  source = "./create-disk"

  tags                         = local.tags
  tenant_managed_disk_name     = local.managed_disk_name
  location                     = var.location
  resource_group               = var.tenant_resource_group.name
  platform_common_sp_object_id = var.platform_common_sp_object_id
  redis_disk_size_gb           = var.redis_disk_size_gb
  redis_disk_sku               = var.redis_disk_sku
  disk_tier                    = var.disk_tier
  platform_sp_object_id        = var.platform_sp_object_id
  private_dns_zone_id          = var.blob_privatedns_zonename
  subnet_id                    = module.create-network-resources.out_subnet_id

  depends_on = [module.create-network-resources]
}

module "create-storage" {
  source = "./create-storage"

  tags                     = local.tags
  storage_name             = local.storage_name
  location                 = var.location
  resource_group           = var.tenant_resource_group.name
  storage_tier             = var.storage_tier
  storage_replication_type = var.storage_replication_type
  storage_kind             = var.storage_kind
  private_dns_zone_id      = var.blob_privatedns_zonename
  subnet_id                = module.create-network-resources.out_subnet_id

  depends_on = [module.create-network-resources]
}

module "create-container-registry" {
  source = "./create-container-registry"

  tags           = local.tags
  container_name = local.container_registry_name
  location       = var.location
  resource_group = var.tenant_resource_group.name
  principal_id   = var.platform_sp_object_id

  depends_on = [module.create-network-resources]
}

module "create-cosmosdb" {
  source = "./create-cosmosdb"

  count = var.create_cosmosdb ? 1 : 0

  tags           = local.tags
  cosmosdb_name  = local.cosmosdb_name
  location       = var.location
  resource_group = var.tenant_resource_group.name

  depends_on = [module.create-network-resources]
}

module "create-eventhub" {
  source = "./create-eventhub"

  tags                = local.tags
  eventhub_name       = local.eventhub_name
  location            = var.location
  resource_group      = var.tenant_resource_group.name
  private_dns_zone_id = var.eventhub_privatedns_zonename
  subnet_id           = module.create-network-resources.out_subnet_id

  depends_on = [module.create-network-resources]
}

module "create-kusto" {
  source = "./create-kusto"

  count = var.create_adx ? 1 : 0

  tags                = local.tags
  kusto_name          = local.kusto_name
  location            = var.location
  resource_group      = var.tenant_resource_group.name
  kusto_instance_type = var.kusto_instance_type
  kustonr_instances   = var.kustonr_instances
  private_dns_zone_id = var.kusto_privatedns_zonename
  subnet_id           = module.create-network-resources.out_subnet_id

  depends_on = [module.create-network-resources]
}

module "create-backup" {
  source = "./create-backup"

  count = var.create_backup ? 1 : 0

  tags                 = local.tags
  backup_policy_name   = local.backup_policy_name
  backup_instance_name = local.backup_instance_name
  location             = var.location
  resource_group       = var.tenant_resource_group.name
  resource_group_id    = var.platform_resource_group.id
  managed_disk_id      = module.create-disk.managed_disk_id

  depends_on = [module.create-network-resources, module.create-disk]
}
