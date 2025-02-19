module "create-backup" {
  source = "./create-backup"

  count = var.create_backup ? 1 : 0

  tags                            = local.tags
  backup_policy_name              = local.backup_policy_name
  backup_instance_name            = local.backup_instance_name
  location                        = var.location
  tenant_resource_group           = var.tenant_resource_group.name
  tenant_resource_group_id        = var.tenant_resource_group.id
  managed_disk_id                 = module.create-disk.0.out_managed_disk_id
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
  retention_policy_days         = var.container_retention_policy
  kubernetes_tenant_namespace   = var.kubernetes_tenant_namespace

  depends_on = [module.create-network-resources]
}

module "create-disk" {
  source = "./create-disk"

  count = var.disk_deploy ? 1 : 0

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
  trusted_external_tenants      = var.kusto_trusted_external_tenants
  disk_encryption_enabled       = var.kusto_disk_encryption_enabled
  streaming_ingestion_enabled   = var.kusto_streaming_ingestion_enabled
  purge_enabled                 = var.kusto_purge_enabled
  double_encryption_enabled     = var.kusto_double_encryption_enabled
  public_network_access_enabled = var.kusto_public_network_access_enabled
  private_dns_zone_id           = module.create-network-resources.out_blob_private_dns_zone_id
  subnet_id                     = module.create-network-resources.out_subnet_id
  auto_stop_kusto               = var.auto_stop_kusto
  kubernetes_tenant_namespace   = var.kubernetes_tenant_namespace

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
  storage_default_action          = var.storage_default_action
  storage_csm_ip                  = var.storage_csm_ip

  depends_on = [module.create-network-resources]
}

module "config_vault" {
  source = "./create-vault-config"

  count = var.create_platform_config ? 1 : 0

  allowed_namespace    = var.allowed_namespace
  cluster_name         = var.cluster_name
  tenant_id            = var.tenant_id
  vault_address        = var.vault_address
  vault_namespace      = var.vault_namespace
  vault_sops_namespace = var.vault_sops_namespace
  engine_secret        = var.engine_secret

}

module "services-secrets" {
  source = "./create-services-secrets"

  count = var.services_secrets_create ? 1 : 0

  argo_database                 = var.argo_database
  postgresql_initdb_secret_name = var.postgresql_initdb_secret_name
  postgresql_secret_name        = var.postgresql_secret_name
  argo_postgresql_user          = var.argo_postgresql_user
  cosmotech_api_admin_username  = var.cosmotech_api_admin_username
  cosmotech_api_reader_username = var.cosmotech_api_reader_username
  cosmotech_api_writer_username = var.cosmotech_api_writer_username
  monitoring_namespace          = var.monitoring_namespace
  kubernetes_namespace          = var.kubernetes_tenant_namespace
  first_tenant_in_cluster       = var.first_tenant_in_cluster
}

module "create-copilot" {
  source = "./create-copilot"

  count = var.create_copilot ? 1 : 0

  acr_url      = module.create-container-registry.out_acr_login_server_url
  acr_username = module.create-container-registry.out_acr_login_username
  acr_password = module.create-container-registry.out_acr_login_password

  azure_function_docker_image = var.copilot_azure_function_docker_image
  azure_function_docker_tag   = var.copilot_azure_function_docker_tag
  azure_webapp_docker_image   = var.copilot_azure_webapp_docker_image
  azure_webapp_docker_tag     = var.copilot_azure_webapp_docker_tag

  tenant_resource_group       = var.tenant_resource_group.name
  location                    = var.location
  kubernetes_tenant_namespace = var.kubernetes_tenant_namespace

  bot_sku          = var.copilot_bot_sku
  microsoft_app_id = var.copilot_microsoft_app_id

  openai_kind = var.copilot_openai_kind
  openai_sku  = var.copilot_openai_sku

  search_sku             = var.copilot_search_sku
  search_replica_count   = var.copilot_search_replica_count
  search_partition_count = var.copilot_search_partition_count
  search_index_name      = var.copilot_search_index_name

  blob_container_name = var.copilot_blob_container_name

  ada_deployment_name  = var.copilot_ada_deployment_name
  ada_model_name       = var.copilot_ada_model_name
  ada_model_version    = var.copilot_ada_model_version
  gpt4_deployment_name = var.copilot_gpt4_deployment_name
  gpt4_model_name      = var.copilot_gpt4_model_name
  gpt4_model_version   = var.copilot_gpt4_model_version

  depends_on = [module.create-storage, module.create-container-registry]
}
