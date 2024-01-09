module "create-network-resources" {
  source = "./create-network-resources"

  location                = var.location
  vnet_iprange            = var.vnet_iprange
  subnet_name             = local.subnet_name
  tenant_resource_group   = var.tenant_resource_group.name
  platform_resource_group = var.platform_resource_group.name
  platform_vnet           = var.platform_vnet
  subscription_id         = var.subscription_id
  networkadt_sp_object_id = var.networkadt_sp_object_id
  tags                    = local.tags
}

module "create-disk" {
  source = "./create-disk"

  location                 = var.location
  resource_group           = var.tenant_resource_group.name
  private_dns_zone_id      = module.create-network-resources.out_private_dns_zone_id
  principal_id             = var.platform_sp_object_id
  disk_size_gb             = var.disk_size_gb
  disk_sku                 = var.disk_sku
  disk_tier                = var.disk_tier
  subnet_id                = module.create-network-resources.out_subnet_id
  tenant_managed_disk_name = local.managed_disk_name
  platform_sp_object_id    = var.platform_sp_object_id
  tags                     = local.tags
}

module "create-storage" {
  source = "./create-storage"

  location            = var.location
  resource_group      = var.tenant_resource_group.name
  storage_name        = local.storage_name
  private_dns_zone_id = module.create-network-resources.out_private_dns_zone_id
  subnet_id           = module.create-network-resources.out_subnet_id
  tags                = local.tags
}

module "create-container-registry" {
  source = "./create-container-registry"

  location       = var.location
  resource_group = var.tenant_resource_group.name
  container_name = local.container_registry_name
  principal_id   = var.platform_sp_object_id
  tags           = local.tags
}

module "create-cosmosdb" {
  source = "./create-cosmosdb"

  count          = var.create_cosmosdb ? 1 : 0
  location       = var.location
  resource_group = var.tenant_resource_group.name
  cosmosdb_name  = local.cosmosdb_name
  tags           = local.tags
}

module "create-eventhub" {
  source = "./create-eventhub"

  location            = var.location
  resource_group      = var.tenant_resource_group.name
  eventhub_name       = local.eventhub_name
  private_dns_zone_id = module.create-network-resources.out_private_dns_zone_id
  subnet_id           = module.create-network-resources.out_subnet_id
  tags                = local.tags
}

module "create-kusto" {
  source = "./create-kusto"

  count               = var.create_adx ? 1 : 0
  location            = var.location
  resource_group      = var.tenant_resource_group.name
  kusto_name          = local.kusto_name
  private_dns_zone_id = module.create-network-resources.out_private_dns_zone_id
  subnet_id           = module.create-network-resources.out_subnet_id
  tags                = local.tags
}

module "create-backup" {
  source = "./create-backup"

  count                = var.create_backup ? 1 : 0
  location             = var.location
  resource_group       = var.tenant_resource_group.name
  resource_group_id    = var.platform_resource_group.id
  managed_disk_id      = module.create-disk.managed_disk_id
  backup_instance_name = local.backup_instance_name
  backup_policy_name   = local.backup_policy_name
  tags                 = local.tags
}