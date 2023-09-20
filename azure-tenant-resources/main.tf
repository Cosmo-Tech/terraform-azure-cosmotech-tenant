locals {
  cosmosdb_name           = "csm${var.cluster_name}-${var.resource_group}"
  eventhub_name           = "evname-${var.cluster_name}-${var.resource_group}"
  kusto_name              = "kusto${random_string.random_storage_id.result}"
  managed_disk_name       = var.managed_disk_name != "" ? var.managed_disk_name : "cosmotech-database-disk-${var.resource_group}"
  storage_name            = "${var.cluster_name}${random_string.random_storage_id.result}"
  container_registry_name = "acr${var.cluster_name}${var.resource_group}"
  backup_instance_name    = "cosmo-backup-instance-${var.resource_group}"
  backup_policy_name      = "cosmo-backup-policy-${var.resource_group}"
  tags = {
    vendor      = "cosmotech"
    stage       = var.project_stage
    customer    = var.customer_name
    project     = var.project_name
    cost_center = var.cost_center
  }
}

resource "random_string" "random_storage_id" {
  length  = 6
  special = false
  upper   = false
}

module "create-disk" {
  source = "./create-disk"

  location                 = var.location
  resource_group           = var.resource_group
  private_dns_zone_id      = var.private_dns_zone_id
  principal_id             = var.principal_id
  disk_size_gb             = var.disk_size_gb
  disk_sku                 = var.disk_sku
  disk_tier                = var.disk_tier
  subnet_id                = var.subnet_id
  tenant_managed_disk_name = local.managed_disk_name
  platform_sp_object_id    = var.platform_sp_object_id
  tags                     = local.tags
}

module "create-storage" {
  source = "./create-storage"

  location            = var.location
  resource_group      = var.resource_group
  storage_name        = local.storage_name
  private_dns_zone_id = var.private_dns_zone_id
  tags                = local.tags
  subnet_id           = var.subnet_id
}

module "create-container-registry" {
  source = "./create-container-registry"

  location       = var.location
  resource_group = var.resource_group
  container_name = local.container_registry_name
  tags           = local.tags
}

module "create-cosmosdb" {
  source = "./create-cosmosdb"

  count          = var.create_cosmosdb ? 1 : 0
  location       = var.location
  resource_group = var.resource_group
  cosmosdb_name  = local.cosmosdb_name
  tags           = local.tags
}

module "create-eventhub" {
  source = "./create-eventhub"

  location            = var.location
  resource_group      = var.resource_group
  eventhub_name       = local.eventhub_name
  private_dns_zone_id = var.private_dns_zone_id
  tags                = local.tags
  subnet_id           = var.subnet_id
}

module "create-kusto" {
  source = "./create-kusto"

  count               = var.create_adx ? 1 : 0
  location            = var.location
  resource_group      = var.resource_group
  kusto_name          = local.kusto_name
  private_dns_zone_id = var.private_dns_zone_id
  tags                = local.tags
  subnet_id           = var.subnet_id
}

module "create-backup" {
  source = "./create-backup"

  count                = var.create_backup ? 1 : 0
  location             = var.location
  resource_group       = var.resource_group
  resource_group_id    = var.platform_resource_group_id
  managed_disk_id      = module.create-disk.managed_disk_id
  backup_instance_name = local.backup_instance_name
  backup_policy_name   = local.backup_policy_name
  tags                 = local.tags
}