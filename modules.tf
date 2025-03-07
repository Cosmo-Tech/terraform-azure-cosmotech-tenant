module "azure-tenant-prerequisites" {
  source = "./azure-tenant-prerequisites"

  count = var.deployment_type != "ARM" ? 1 : 0

  tenant_id                      = var.tenant_id
  client_id                      = var.client_id
  client_secret                  = var.client_secret
  location                       = var.location
  platform_url                   = var.platform_url
  identifier_uri                 = var.identifier_uri
  project_stage                  = var.project_stage
  project_name                   = var.project_name
  owner_list                     = var.owner_list
  audience                       = var.audience
  tenant_resource_group          = var.tenant_resource_group
  common_resource_group          = var.kubernetes_resource_group
  dns_record                     = var.network_dns_record
  dns_zone_name                  = var.network_dns_zone_name
  virtual_network_address_prefix = var.network_tenant_address_prefix
  subnet_name                    = var.network_subnet_name
  dns_zone_rg                    = var.dns_zone_rg
  api_version_path               = var.cosmotech_api_version_path
  customer_name                  = var.customer_name
  user_app_role                  = var.user_app_role
  image_path                     = var.image_path
  chart_package_version          = var.cosmotech_api_chart_package_version
  create_restish                 = var.create_restish
  create_powerbi                 = var.create_powerbi
  create_babylon                 = var.create_babylon
  create_platform                = var.create_platform
  create_keycloak                = var.create_keycloak
  cost_center                    = var.cost_center
  kubernetes_tenant_namespace    = var.kubernetes_tenant_namespace
  cluster_name                   = var.cluster_name
  servlet_context_path           = var.servlet_context_path
  api_dns_name                   = var.api_dns_name
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
  vnet_resource_group                          = var.network_resource_group
  create_adx                                   = var.kusto_deploy
  create_eventhub                              = var.create_eventhub
  eventhub_capacity                            = var.eventhub_capacity
  eventhub_public_network_access_enabled       = var.eventhub_public_network_access_enabled

  blob_privatedns_zonename     = var.blob_private_dns_zonename
  queue_privatedns_zonename    = var.queue_private_dns_zonename
  table_privatedns_zonename    = var.table_private_dns_zonename
  eventhub_privatedns_zonename = var.eventhub_private_dns_zonename
  adt_privatedns_zonename      = var.adt_private_dns_zonename

  container_admin_enabled                 = var.container_admin_enabled
  container_quarantine_policy_enabled     = var.container_quarantine_policy_enabled
  container_data_endpoint_enabled         = var.container_data_endpoint_enabled
  container_public_network_access_enabled = var.container_public_network_access_enabled
  container_zone_redundancy_enabled       = var.container_zone_redundancy_enabled
  container_trust_policy                  = var.container_trust_policy
  container_retention_policy              = var.container_retention_policy

  kusto_instance_type                 = var.kusto_instance_type
  kustonr_instances                   = var.kustonr_instances
  kusto_engine                        = var.kusto_engine
  kusto_trusted_external_tenants      = var.kusto_trusted_external_tenants
  kusto_disk_encryption_enabled       = var.kusto_disk_encryption_enabled
  kusto_streaming_ingestion_enabled   = var.kusto_streaming_ingestion_enabled
  kusto_purge_enabled                 = var.kusto_purge_enabled
  kusto_double_encryption_enabled     = var.kusto_double_encryption_enabled
  kusto_public_network_access_enabled = var.kusto_public_network_access_enabled
  auto_stop_kusto                     = var.kusto_auto_stop

  storage_tier                            = split("_", var.storage_class_sku)[0]
  storage_replication_type                = split("_", var.storage_class_sku)[1]
  storage_public_network_access_enabled   = var.storage_public_network_access_enabled
  storage_default_to_oauth_authentication = var.storage_default_to_oauth_authentication
  storage_min_tls_version                 = var.storage_min_tls_version
  storage_shared_access_key_enabled       = var.storage_shared_access_key_enabled
  storage_enable_https_traffic_only       = var.storage_enable_https_traffic_only
  storage_access_tier                     = var.storage_access_tier
  storage_default_action                  = var.storage_default_action

  tenant_sp_object_id   = var.deployment_type != "ARM" ? module.azure-tenant-prerequisites.0.out_platform_sp_object_id : var.tenant_sp_object_id
  tenant_resource_group = var.deployment_type != "ARM" ? azurerm_resource_group.tenant_rg.0 : data.azurerm_resource_group.tenant_rg.0

  common_resource_group   = data.azurerm_resource_group.current
  vnet                    = data.azurerm_virtual_network.current
  subnet_name             = var.network_subnet_name
  services_secrets_create = var.services_secrets_create

  tags = {
    vendor      = "cosmotech"
    stage       = var.project_stage
    customer    = var.customer_name
    project     = var.project_name
    cost_center = var.cost_center
    customertag = var.customertag
  }

  kubernetes_tenant_namespace   = var.kubernetes_tenant_namespace
  cosmotech_api_admin_username  = var.cosmotech_api_admin_username
  cosmotech_api_reader_username = var.cosmotech_api_reader_username
  cosmotech_api_writer_username = var.cosmotech_api_writer_username
  argo_database                 = var.argo_database
  argo_postgresql_user          = var.argo_postgresql_user
  postgresql_initdb_secret_name = var.postgresql_initdb_secret_name
  postgresql_secret_name        = var.postgresql_secret_name
  monitoring_namespace          = var.monitoring_namespace
  create_platform_config        = var.create_platform_config
  allowed_namespace             = var.allowed_namespace
  engine_secret                 = var.engine_secret
  tenant_id                     = var.client_id
  vault_address                 = var.vault_address
  vault_namespace               = var.vault_namespace
  vault_sops_namespace          = var.vault_sops_namespace
  storage_csm_ip                = var.storage_csm_ip
  argo_workflows_s3_username    = var.argo_workflows_s3_username
  rabbitmq_listener_username    = var.rabbitmq_listener_username
  rabbitmq_sender_username      = var.rabbitmq_sender_username
  seaweedfs_database            = var.seaweedfs_database
  seaweedfs_username            = var.seaweedfs_username

  first_tenant_in_cluster = var.first_tenant_in_cluster

  depends_on = [module.azure-tenant-prerequisites]
}

module "create-vault-entries" {
  source = "./create-vault-entries"

  count = var.vault_create_entries ? 1 : 0

  tenant_id                   = var.tenant_id
  kubernetes_tenant_namespace = var.kubernetes_tenant_namespace
  platform_id                 = var.platform_id
  organization_name           = var.organization_name
  vault_addr                  = var.vault_address
  vault_token                 = var.vault_token
  storage_account_name        = var.tf_storage_account_name
  storage_account_key         = var.tf_access_key
  storage_container           = var.tf_container_name
  tf_blob_name_tenant         = var.tf_blob_name_tenant
  vault_namespace             = var.vault_namespace
  vault_sops_namespace        = var.vault_sops_namespace
  engine_secret               = var.engine_secret
  engine_version              = var.engine_version
  vault_sops_deploy           = var.vault_sops_deploy
  container_tag               = var.container_tag

  depends_on = [
    module.azure-tenant-resources
  ]
}

module "deploy-persistence-redis" {
  source = "./persistence-redis"

  count = var.pv_redis_deploy ? 1 : 0

  kubernetes_mc_resource_group_name = var.kubernetes_mc_resource_group_name
  kubernetes_tenant_namespace       = var.kubernetes_tenant_namespace
  location                          = var.location
  pv_redis_provider                 = var.pv_redis_provider
  pv_redis_storage_account_type     = var.pv_redis_storage_account_type
  pv_redis_storage_class_name       = var.pv_redis_storage_class_name
  pv_redis_storage_gbi              = var.pv_redis_storage_gbi
  pv_redis_replicas                 = var.pv_redis_replicas
}

module "deploy-persistence-postgres" {
  source = "./persistence-postgres"

  count = var.pv_postgres_deploy ? 1 : 0

  kubernetes_mc_resource_group_name = var.kubernetes_mc_resource_group_name
  kubernetes_tenant_namespace       = var.kubernetes_tenant_namespace
  location                          = var.location
  pv_postgres_provider              = var.pv_postgres_provider
  pv_postgres_storage_account_type  = var.pv_postgres_storage_account_type
  pv_postgres_storage_class_name    = var.pv_postgres_storage_class_name
  pv_postgres_storage_gbi           = var.pv_postgres_storage_gbi
  pv_postgres_replicas              = var.pv_postgres_replicas
}

module "deploy-persistence-seaweedfs" {
  source = "./persistence-seaweedfs"

  count = var.pv_seaweedfs_deploy ? 1 : 0

  kubernetes_mc_resource_group_name = var.kubernetes_mc_resource_group_name
  kubernetes_tenant_namespace       = var.kubernetes_tenant_namespace
  location                          = var.location
  pv_seaweedfs_provider             = var.pv_seaweedfs_provider
  pv_seaweedfs_storage_account_type = var.pv_seaweedfs_storage_account_type
  pv_seaweedfs_storage_class_name   = var.pv_seaweedfs_storage_class_name
  pv_seaweedfs_storage_gbi          = var.pv_seaweedfs_storage_gbi
}

module "deploy-persistence-minio" {
  source = "./persistence-minio"

  count = var.pv_minio_deploy ? 1 : 0

  kubernetes_mc_resource_group_name = var.kubernetes_mc_resource_group_name
  kubernetes_tenant_namespace       = var.kubernetes_tenant_namespace
  location                          = var.location
  pv_minio_provider                 = var.pv_minio_provider
  pv_minio_storage_account_type     = var.pv_minio_storage_account_type
  pv_minio_storage_class_name       = var.pv_minio_storage_class_name
  pv_minio_storage_gbi              = var.pv_minio_storage_gbi
  pv_minio_replicas                 = var.pv_minio_replicas
  pv_minio_disk_deploy              = var.pv_minio_disk_deploy
  pv_minio_disk_source_existing     = var.pv_minio_disk_source_existing
}
