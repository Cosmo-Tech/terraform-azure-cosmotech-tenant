module "azure-tenant-prerequisites" {
  source = "./azure-tenant-prerequisites"

  count                   = var.deployment_type != "ARM" ? 1 : 0
  tenant_id               = var.tenant_id
  client_id               = var.client_id
  client_secret           = var.client_secret
  platform_url            = var.platform_url
  identifier_uri          = var.identifier_uri
  project_stage           = var.project_stage
  project_name            = var.project_name
  owner_list              = var.owner_list
  audience                = var.audience
  webapp_url              = var.webapp_url
  location                = var.location
  tenant_resource_group   = var.tenant_resource_group
  platform_resource_group = var.platform_resource_group
  dns_zone_name           = var.dns_zone_name
  dns_zone_rg             = var.dns_zone_rg
  dns_record              = var.dns_record
  vnet_iprange            = var.vnet_iprange
  api_version_path        = var.api_version_path
  customer_name           = var.customer_name
  user_app_role           = var.user_app_role
  image_path              = var.image_path
  chart_package_version   = var.chart_package_version
}

module "azure-tenant-resources" {
  source = "./azure-tenant-resources"

  location                = var.location
  subscription_id         = var.subscription_id
  platform_public_ip      = data.azurerm_public_ip.current.id
  vnet_iprange            = var.vnet_iprange
  platform_vnet           = data.azurerm_virtual_network.current
  managed_disk_name       = var.managed_disk_name
  cluster_name            = var.cluster_name
  project_stage           = var.project_stage
  project_name            = var.project_name
  customer_name           = var.customer_name
  cost_center             = var.cost_center
  create_cosmosdb         = var.create_cosmosdb
  create_adx              = var.create_adx
  networkadt_sp_object_id = var.deployment_type != "ARM" ? module.azure-tenant-prerequisites.0.out_networkadt_sp_objectid : var.networkadt_sp_object_id
  platform_group_id       = var.deployment_type != "ARM" ? module.azure-tenant-prerequisites.0.out_platform_group_id : var.platform_group_id
  principal_id            = var.deployment_type != "ARM" ? module.azure-tenant-prerequisites.0.out_platform_sp_object_id : var.principal_id
  platform_resource_group = data.azurerm_resource_group.current
  tenant_resource_group   = azurerm_resource_group.tenant_rg
  platform_sp_object_id   = data.azuread_service_principal.platform.object_id
  create_backup           = var.create_backup

  depends_on = [module.azure-tenant-prerequisites]
}

module "platform-tenant-resources" {
  source = "./platform-tenant-resources"

  subscription_id           = var.subscription_id
  tenant_id                 = var.tenant_id
  client_id                 = var.client_id
  client_secret             = var.client_secret
  tls_secret_name           = var.tls_secret_name
  namespace                 = var.namespace
  monitoring_namespace      = var.monitoring_namespace
  chart_package_version     = var.chart_package_version
  resource_group            = var.tenant_resource_group
  api_dns_name              = local.api_dns_name
  managed_disk_id           = module.azure-tenant-resources.managed_disk_id
  storage_account_key       = module.azure-tenant-resources.out_storage_account_key
  storage_account_name      = module.azure-tenant-resources.out_storage_account_name
  acr_login_password        = module.azure-tenant-resources.out_acr_login_password
  acr_login_server          = module.azure-tenant-resources.out_acr_login_server
  acr_login_username        = module.azure-tenant-resources.out_acr_login_username
  adx_ingestion_uri         = var.adx_ingestion_uri
  adx_uri                   = var.adx_uri
  cosmos_uri                = module.azure-tenant-resources.cosmos_uri
  cosmos_key                = module.azure-tenant-resources.cosmos_key
  eventbus_uri              = module.azure-tenant-resources.eventbus_uri
  network_adt_clientid      = module.azure-tenant-prerequisites.0.out_networkadt_clientid
  network_adt_password      = module.azure-tenant-prerequisites.0.out_network_adt_password
  platform_sp_client_id     = module.azure-tenant-prerequisites.0.out_platform_sp_client_id
  platform_sp_client_secret = module.azure-tenant-prerequisites.0.out_platform_sp_client_secret
  kube_config               = data.azurerm_kubernetes_cluster.current.kube_config

  depends_on = [module.azure-tenant-resources]
}

variable "adx_ingestion_uri" {
  type = string
}

variable "adx_uri" {
  type = string
}

module "create-vault-entries" {
  source = "./create-vault-entries"

  count                = var.create_vault_entries ? 1 : 0
  vault_addr           = var.vault_addr
  vault_token          = var.vault_token
  storage_account_name = var.tf_storage_account_name
  storage_account_key  = var.tf_access_key
  storage_container    = var.tf_container_name
  tfstate_blob_name    = var.tf_blob_name
  tenant_id            = var.tenant_id
  organization_name    = var.customer_name
  platform_name        = var.project_name
  namespace            = var.namespace

  depends_on = [module.platform-tenant-resources]
}