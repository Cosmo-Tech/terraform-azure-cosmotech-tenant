module "azure-tenant-prerequisites" {
  source = "./azure-tenant-prerequisites"

  count = var.deployment_type != "ARM" ? 1 : 0

  tenant_id                      = var.tenant_id
  client_id                      = var.client_id
  client_secret                  = var.client_secret
  platform_url                   = var.platform_url
  identifier_uri                 = var.identifier_uri
  project_stage                  = var.project_stage
  project_name                   = var.project_name
  owner_list                     = var.owner_list
  audience                       = var.audience
  webapp_url                     = var.webapp_url
  location                       = var.location
  tenant_resource_group          = var.tenant_resource_group
  common_resource_group          = var.common_resource_group
  dns_record                     = var.dns_record
  dns_zone_name                  = var.dns_zone_name
  dns_zone_rg                    = var.dns_zone_rg
  virtual_network_address_prefix = var.tenant_virtual_network_address_prefix
  api_version_path               = var.api_version_path
  customer_name                  = var.customer_name
  user_app_role                  = var.user_app_role
  image_path                     = var.image_path
  chart_package_version          = var.chart_package_version
  create_restish                 = var.create_restish
  create_powerbi                 = var.create_powerbi
  create_secrets                 = var.create_secrets
  create_webapp                  = var.create_webapp
  create_babylon                 = var.create_babylon
  cost_center                    = var.cost_center
  kubernetes_tenant_namespace    = var.kubernetes_tenant_namespace
  subnet_name                    = var.subnet_name
}

module "azure-tenant-resources" {
  source = "./azure-tenant-resources"

  deployment_type                              = var.deployment_type
  subscription_id                              = var.subscription_id
  location                                     = var.location
  tenant_virtual_network_address_prefix        = var.tenant_virtual_network_address_prefix
  tenant_virtual_subnet_network_address_prefix = var.tenant_virtual_subnet_network_address_prefix
  cluster_name                                 = var.cluster_name
  project_stage                                = var.project_stage
  project_name                                 = var.project_name
  customer_name                                = var.customer_name
  cost_center                                  = var.cost_center
  network_sp_object_id                         = var.network_sp_object_id
  storage_kind                                 = var.storage_kind
  vnet_resource_group                          = var.vnet_resource_group
  create_cosmosdb                              = var.create_cosmosdb
  create_adx                                   = var.create_adx
  create_eventhub                              = var.create_eventhub
  eventhub_capacity                            = var.eventhub_capacity
  eventhub_public_network_access_enabled       = var.eventhub_public_network_access_enabled

  blob_privatedns_zonename     = var.blob_privatedns_zonename
  queue_privatedns_zonename    = var.queue_privatedns_zonename
  table_privatedns_zonename    = var.table_privatedns_zonename
  eventhub_privatedns_zonename = var.eventhub_privatedns_zonename
  adt_privatedns_zonename      = var.adt_privatedns_zonename

  container_admin_enabled                 = var.container_admin_enabled
  container_quarantine_policy_enabled     = var.container_quarantine_policy_enabled
  container_data_endpoint_enabled         = var.container_data_endpoint_enabled
  container_public_network_access_enabled = var.container_public_network_access_enabled
  container_zone_redundancy_enabled       = var.container_zone_redundancy_enabled
  container_trust_policy                  = var.container_trust_policy
  container_retention_policy              = var.container_retention_policy

  cosmosdb_failover_priority                     = var.cosmosdb_failover_priority
  cosmosdb_public_network_access_enabled         = var.cosmosdb_public_network_access_enabled
  cosmosdb_is_virtual_network_filter_enabled     = var.cosmosdb_is_virtual_network_filter_enabled
  cosmosdb_access_key_metadata_writes_enabled    = var.cosmosdb_access_key_metadata_writes_enabled
  cosmosdb_analytical_storage_enabled            = var.cosmosdb_analytical_storage_enabled
  cosmosdb_network_acl_bypass_for_azure_services = var.cosmosdb_network_acl_bypass_for_azure_services
  cosmosdb_consistency_level                     = var.cosmosdb_consistency_level
  cosmosdb_consistency_interval_in_minutes       = var.cosmosdb_consistency_interval_in_minutes
  cosmosdb_consistency_max_staleness_prefix      = var.cosmosdb_consistency_max_staleness_prefix
  cosmosdb_backup_type                           = var.cosmosdb_backup_type
  cosmosdb_backup_interval_in_minutes            = var.cosmosdb_backup_interval_in_minutes
  cosmosdb_backup_retention_in_hours             = var.cosmosdb_backup_retention_in_hours
  cosmosdb_backup_storage_redundancy             = var.cosmosdb_backup_storage_redundancy

  kusto_instance_type                 = var.kusto_instance_type
  kustonr_instances                   = var.kustonr_instances
  kusto_engine                        = var.kusto_engine
  kusto_trusted_external_tenants      = var.kusto_trusted_external_tenants
  kusto_disk_encryption_enabled       = var.kusto_disk_encryption_enabled
  kusto_streaming_ingestion_enabled   = var.kusto_streaming_ingestion_enabled
  kusto_purge_enabled                 = var.kusto_purge_enabled
  kusto_double_encryption_enabled     = var.kusto_double_encryption_enabled
  kusto_public_network_access_enabled = var.kusto_public_network_access_enabled
  auto_stop_kusto                     = var.auto_stop_kusto

  storage_tier                            = split("_", var.storage_class_sku)[0]
  storage_replication_type                = split("_", var.storage_class_sku)[1]
  storage_public_network_access_enabled   = var.storage_public_network_access_enabled
  storage_default_to_oauth_authentication = var.storage_default_to_oauth_authentication
  storage_min_tls_version                 = var.storage_min_tls_version
  storage_shared_access_key_enabled       = var.storage_shared_access_key_enabled
  storage_enable_https_traffic_only       = var.storage_enable_https_traffic_only
  storage_access_tier                     = var.storage_access_tier

  create_backup                   = var.create_backup
  backup_repeating_time_intervals = var.backup_repeating_time_intervals

  managed_disk_name  = var.managed_disk_name
  redis_disk_size_gb = var.redis_disk_size_gb
  redis_disk_sku     = var.redis_disk_sku
  redis_disk_tier    = var.redis_disk_tier

  tenant_group_id           = var.deployment_type != "ARM" ? module.azure-tenant-prerequisites.0.out_tenant_group_id : var.tenant_group_id
  tenant_sp_object_id       = var.deployment_type != "ARM" ? module.azure-tenant-prerequisites.0.out_platform_sp_object_id : var.tenant_sp_object_id
  tenant_resource_group     = var.deployment_type != "ARM" ? azurerm_resource_group.tenant_rg.0 : data.azurerm_resource_group.tenant_rg.0
  common_platform_object_id = var.common_platform_object_id

  public_ip_id          = data.azurerm_public_ip.current.id
  common_resource_group = data.azurerm_resource_group.current
  vnet                  = data.azurerm_virtual_network.current
  subnet_name           = var.subnet_name

  tags = {
    vendor      = "cosmotech"
    stage       = var.project_stage
    customer    = var.customer_name
    project     = var.project_name
    cost_center = var.cost_center
    customertag = var.customertag
  }

  depends_on = [module.azure-tenant-prerequisites]
}

module "create-vault-entries" {
  source = "./create-vault-entries"

  count = var.create_vault_entries ? 1 : 0

  tenant_id                   = var.tenant_id
  kubernetes_tenant_namespace = var.kubernetes_tenant_namespace
  platform_name               = var.platform_name
  organization_name           = var.organization_name
  vault_addr                  = var.vault_addr
  vault_token                 = var.vault_token
  storage_account_name        = var.tf_storage_account_name
  storage_account_key         = var.tf_access_key
  storage_container           = var.tf_container_name
  tfstate_blob_name           = var.tf_blob_name_tenant

  depends_on = [module.platform-tenant-resources]
}

module "platform-tenant-resources" {
  source  = "Cosmo-Tech/cosmotech-tenant/kubernetes"
  version = "0.1.6"

  api_dns_name                            = var.api_dns_name
  api_replicas                            = var.api_replicas
  subscription_id                         = var.subscription_id
  tenant_id                               = var.tenant_id
  client_id                               = var.client_id
  client_secret                           = var.client_secret
  tls_secret_name                         = local.tls_secret_name
  tls_certificate_type                    = var.tls_certificate_type
  tls_certificate_custom_certificate      = var.tls_certificate_custom_certificate
  tls_certificate_custom_key              = var.tls_certificate_custom_key
  kubernetes_tenant_namespace             = var.kubernetes_tenant_namespace
  monitoring_enabled                      = var.monitoring_enabled == "true" ? true : false
  monitoring_namespace                    = var.monitoring_namespace
  tenant_resource_group                   = var.tenant_resource_group
  redis_port                              = var.redis_port
  argo_minio_persistence_size             = var.argo_minio_persistence_size
  argo_minio_requests_memory              = var.argo_minio_requests_memory
  archive_ttl                             = var.archive_ttl
  cluster_issuer_name                     = var.cluster_issuer_name
  cosmotech_api_version                   = var.cosmotech_api_version
  cosmotech_api_version_path              = var.api_version_path
  cosmotech_api_ingress_enabled           = var.cosmotech_api_ingress_enabled
  cosmotech_api_persistence_size          = var.cosmotech_api_persistence_size
  cosmotech_api_persistence_storage_class = var.cosmotech_api_persistence_storage_class
  network_client_id                       = var.deployment_type != "ARM" ? module.azure-tenant-prerequisites.0.out_network_adt_clientid : var.network_client_id
  network_client_secret                   = var.deployment_type != "ARM" ? module.azure-tenant-prerequisites.0.out_network_adt_password : var.network_client_secret
  tenant_client_id                        = var.deployment_type != "ARM" ? module.azure-tenant-prerequisites.0.out_platform_sp_client_id : var.tenant_client_id
  tenant_client_secret                    = var.deployment_type != "ARM" ? module.azure-tenant-prerequisites.0.out_platform_sp_client_secret : var.tenant_client_secret
  storage_account_key                     = module.azure-tenant-resources.out_storage_account_key
  storage_account_name                    = module.azure-tenant-resources.out_storage_account_name
  acr_login_password                      = module.azure-tenant-resources.out_acr_login_password
  acr_login_server                        = module.azure-tenant-resources.out_acr_login_server
  acr_login_username                      = module.azure-tenant-resources.out_acr_login_username
  acr_registry_url                        = module.azure-tenant-resources.out_acr_login_server_url
  adx_ingestion_uri                       = module.azure-tenant-resources.out_adx_ingestion_uri
  adx_uri                                 = module.azure-tenant-resources.out_adx_uri
  cosmos_uri                              = module.azure-tenant-resources.out_cosmos_uri
  cosmos_key                              = module.azure-tenant-resources.out_cosmos_key
  eventbus_uri                            = module.azure-tenant-resources.out_eventbus_uri
  identifier_uri                          = var.identifier_uri
  create_rabbitmq                         = var.create_rabbitmq
  list_apikey_allowed                     = var.list_apikey_allowed
  identity_authorization_url              = var.identity_authorization_url
  identity_token_url                      = var.identity_token_url
  deploy_api                              = var.deploy_api
  create_platform_config                  = var.create_platform_config
  cosmotech_api_chart_package_version     = var.cosmotech_api_chart_package_version

  # Create-platform-config
  create_platform_config                  = var.create_platform_config

  depends_on = [module.azure-tenant-resources]
}
