module "create-container-registry" {
  source = "./create-container-registry"

  tags                = local.tags
  container_name      = local.container_registry_name
  location            = var.location
  resource_group      = var.tenant_resource_group.name
  tenant_sp_object_id = var.tenant_sp_object_id
  deployment_type     = var.deployment_type

  depends_on = [module.create-network-resources]
}

module "create-cosmosdb" {
  source = "./create-cosmosdb"

  count = var.create_cosmosdb ? 1 : 0

  tags                  = local.tags
  cosmosdb_name         = local.cosmosdb_name
  location              = var.location
  tenant_resource_group = var.tenant_resource_group.name

  depends_on = [module.create-network-resources]
}

module "create-eventhub" {
  source = "./create-eventhub"

  count = var.create_eventhub ? 1 : 0

  tags                  = local.tags
  eventhub_name         = local.eventhub_name
  location              = var.location
  tenant_resource_group = var.tenant_resource_group.name
  common_resource_group = var.common_resource_group.name
  private_dns_zone_id   = module.create-network-resources.out_blob_private_dns_zone_id
  subnet_id             = module.create-network-resources.out_subnet_id

  depends_on = [module.create-network-resources]
}

module "create-kusto" {
  source = "./create-kusto"

  count = var.create_adx ? 1 : 0

  tags                  = local.tags
  kusto_name            = local.kusto_name
  location              = var.location
  tenant_resource_group = var.tenant_resource_group.name
  kusto_instance_type   = var.kusto_instance_type
  kustonr_instances     = var.kustonr_instances
  private_dns_zone_id   = module.create-network-resources.out_blob_private_dns_zone_id
  subnet_id             = module.create-network-resources.out_subnet_id
  auto_stop_kusto       = var.auto_stop_kusto

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

  tags                          = local.tags
  storage_name                  = local.storage_name
  location                      = var.location
  resource_group                = var.tenant_resource_group.name
  storage_tier                  = var.storage_tier
  storage_replication_type      = var.storage_replication_type
  storage_kind                  = var.storage_kind
  private_dns_zone_id           = module.create-network-resources.out_blob_private_dns_zone_id
  subnet_id                     = module.create-network-resources.out_subnet_id
  public_network_access_enabled = var.public_network_access_enabled
  depends_on                    = [module.create-network-resources]
}
