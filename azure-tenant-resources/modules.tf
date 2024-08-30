module "create-backup" {
  source = "./create-backup"

  count = var.create_backup ? 1 : 0

  tags                            = local.tags
  backup_policy_name              = local.backup_policy_name
  backup_instance_name            = local.backup_instance_name
  location                        = var.location
  tenant_resource_group           = var.tenant_resource_group.name
  tenant_resource_group_id        = var.tenant_resource_group.id
  managed_disk_id                 = module.create-disk.out_managed_disk_id
  backup_repeating_time_intervals = var.backup_repeating_time_intervals

  depends_on = [module.create-network-resources, module.create-disk]
}

module "create-container-registry" {
  source = "./create-container-registry"

  tags                          = local.tags
  container_name                = local.container_registry_name
  location                      = var.location
  resource_group                = var.tenant_resource_group.name
  tenant_sp_object_id           = var.tenant_sp_object_id
  deployment_type               = var.deployment_type
  admin_enabled                 = var.container_admin_enabled
  quarantine_policy_enabled     = var.container_quarantine_policy_enabled
  data_endpoint_enabled         = var.container_data_endpoint_enabled
  public_network_access_enabled = var.container_public_network_access_enabled
  zone_redundancy_enabled       = var.container_zone_redundancy_enabled
  trust_policy                  = var.container_trust_policy
  retention_policy              = var.container_retention_policy
  kubernetes_tenant_namespace   = var.kubernetes_tenant_namespace

  depends_on = [module.create-network-resources]
}

module "create-cosmosdb" {
  source = "./create-cosmosdb"

  count = var.create_cosmosdb ? 1 : 0

  tags                                  = local.tags
  cosmosdb_name                         = local.cosmosdb_name
  location                              = var.location
  tenant_resource_group                 = var.tenant_resource_group.name
  failover_priority                     = var.cosmosdb_failover_priority
  public_network_access_enabled         = var.cosmosdb_public_network_access_enabled
  is_virtual_network_filter_enabled     = var.cosmosdb_is_virtual_network_filter_enabled
  access_key_metadata_writes_enabled    = var.cosmosdb_access_key_metadata_writes_enabled
  analytical_storage_enabled            = var.cosmosdb_analytical_storage_enabled
  network_acl_bypass_for_azure_services = var.cosmosdb_network_acl_bypass_for_azure_services
  consistency_level                     = var.cosmosdb_consistency_level
  consistency_interval_in_minutes       = var.cosmosdb_consistency_interval_in_minutes
  consistency_max_staleness_prefix      = var.cosmosdb_consistency_max_staleness_prefix
  backup_type                           = var.cosmosdb_backup_type
  backup_interval_in_minutes            = var.cosmosdb_backup_interval_in_minutes
  backup_retention_in_hours             = var.cosmosdb_backup_retention_in_hours
  backup_storage_redundancy             = var.cosmosdb_backup_storage_redundancy

  depends_on = [module.create-network-resources]
}

module "create-disk" {
  source = "./create-disk"

  tags                     = local.tags
  tenant_managed_disk_name = local.managed_disk_name
  location                 = var.location
  tenant_resource_group    = var.tenant_resource_group.name
  redis_disk_size_gb       = var.redis_disk_size_gb
  redis_disk_sku           = var.redis_disk_sku
  redis_disk_tier          = var.redis_disk_tier
  network_sp_object_id     = var.network_sp_object_id
  tenant_sp_object_id      = var.tenant_sp_object_id
  private_dns_zone_id      = module.create-network-resources.out_blob_private_dns_zone_id
  subnet_id                = module.create-network-resources.out_subnet_id
  deployment_type          = var.deployment_type

  depends_on = [module.create-network-resources]
}

module "create-eventhub" {
  source = "./create-eventhub"

  count = var.create_eventhub ? 1 : 0

  tags                          = local.tags
  eventhub_name                 = local.eventhub_name
  eventhub_capacity             = var.eventhub_capacity
  location                      = var.location
  tenant_resource_group         = var.tenant_resource_group.name
  common_resource_group         = var.common_resource_group.name
  private_dns_zone_id           = module.create-network-resources.out_blob_private_dns_zone_id
  subnet_id                     = module.create-network-resources.out_subnet_id
  public_network_access_enabled = var.eventhub_public_network_access_enabled

  depends_on = [module.create-network-resources]
}

module "create-kusto" {
  source = "./create-kusto"

  count = var.create_adx ? 1 : 0

  tags                          = local.tags
  kusto_name                    = local.kusto_name
  location                      = var.location
  tenant_resource_group         = var.tenant_resource_group.name
  kusto_instance_type           = var.kusto_instance_type
  kustonr_instances             = var.kustonr_instances
  kusto_engine                  = var.kusto_engine
  trusted_external_tenants      = var.kusto_trusted_external_tenants
  disk_encryption_enabled       = var.kusto_disk_encryption_enabled
  streaming_ingestion_enabled   = var.kusto_streaming_ingestion_enabled
  purge_enabled                 = var.kusto_purge_enabled
  double_encryption_enabled     = var.kusto_double_encryption_enabled
  public_network_access_enabled = var.kusto_public_network_access_enabled
  private_dns_zone_id           = module.create-network-resources.out_blob_private_dns_zone_id
  subnet_id                     = module.create-network-resources.out_subnet_id
  auto_stop_kusto               = var.auto_stop_kusto

  depends_on = [module.create-network-resources]
}

module "create-network-resources" {
  source = "./create-network-resources"

  tags                                         = local.tags
  subnet_name                                  = local.subnet_name
  subscription_id                              = var.subscription_id
  location                                     = var.location
  tenant_virtual_subnet_network_address_prefix = var.tenant_virtual_subnet_network_address_prefix
  tenant_virtual_network_address_prefix        = var.tenant_virtual_network_address_prefix
  tenant_resource_group                        = var.tenant_resource_group.name
  common_resource_group                        = var.common_resource_group.name
  platform_vnet                                = var.vnet
  networkadt_sp_object_id                      = var.network_sp_object_id
  vnet_resource_group                          = var.vnet_resource_group
  blob_privatedns_zonename                     = var.blob_privatedns_zonename
  eventhub_privatedns_zonename                 = var.eventhub_privatedns_zonename
}

module "create-storage" {
  source = "./create-storage"

  tags                            = local.tags
  storage_name                    = local.storage_name
  location                        = var.location
  resource_group                  = var.tenant_resource_group.name
  storage_tier                    = var.storage_tier
  storage_replication_type        = var.storage_replication_type
  storage_kind                    = var.storage_kind
  public_network_access_enabled   = var.storage_public_network_access_enabled
  default_to_oauth_authentication = var.storage_default_to_oauth_authentication
  min_tls_version                 = var.storage_min_tls_version
  shared_access_key_enabled       = var.storage_shared_access_key_enabled
  enable_https_traffic_only       = var.storage_enable_https_traffic_only
  access_tier                     = var.storage_access_tier
  private_dns_zone_id             = module.create-network-resources.out_blob_private_dns_zone_id
  subnet_id                       = module.create-network-resources.out_subnet_id
  kubernetes_tenant_namespace     = var.kubernetes_tenant_namespace

  depends_on = [module.create-network-resources]
}
