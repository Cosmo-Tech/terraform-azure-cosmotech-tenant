output "platform_sp_client_id" {
  value = module.azure-tenant-prerequisites.0.out_platform_clientid
}

output "platform_sp_client_secret" {
  value     = module.azure-tenant-prerequisites.0.out_platform_password
  sensitive = true
}

output "storage_account_name" {
  value = module.azure-tenant-resources.out_storage_account_name
}

output "out_storage_account_key" {
  value     = module.azure-tenant-resources.out_storage_account_key
  sensitive = true
}

output "acr_login_server" {
  value     = module.azure-tenant-resources.out_acr_login_server
  sensitive = true
}

output "out_acr_login_username" {
  value     = module.azure-tenant-resources.out_acr_login_username
  sensitive = true
}

output "out_acr_login_password" {
  value     = module.azure-tenant-resources.out_acr_login_password
  sensitive = true
}

output "managed_disk_id" {
  value = module.azure-tenant-resources.managed_disk_id
}

output "out_subnet_id" {
  value = module.azure-tenant-resources.out_subnet_id
}

output "out_ip_resource_group" {
  value = azurerm_resource_group.tenant_rg.name
}

output "out_networkadt_clientid" {
  value = module.azure-tenant-prerequisites.0.out_networkadt_clientid
}

output "out_network_adt_password" {
  value     = module.azure-tenant-prerequisites.0.out_network_adt_password
  sensitive = true
}

output "out_cosmos_uri" {
  value     = module.azure-tenant-resources.cosmos_uri
  sensitive = true
}

output "out_cosmos_key" {
  value     = module.azure-tenant-resources.cosmos_key
  sensitive = true
}

output "out_eventbus_uri" {
  value     = module.azure-tenant-resources.eventbus_uri
  sensitive = true
}

output "adx_uri" {
  value = module.azure-tenant-resources.adx_uri
}

output "out_adx_ingestion_uri" {
  value = module.azure-tenant-resources.adx_ingestion_uri
}

output "babylon_client_id" {
  value = module.azure-tenant-prerequisites.0.out_babylon_client_id
}

output "babylon_principal_id" {
  value = module.azure-tenant-prerequisites.0.out_babylon_principal_id
}

output "babylon_secret" {
  value     = module.azure-tenant-prerequisites.0.out_babylon_secret
  sensitive = true
}

output "cosmos_api_url" {
  value = module.azure-tenant-prerequisites.0.out_cosmos_api_url
}

output "platform_sp_object_id" {
  value = module.azure-tenant-prerequisites.0.out_platform_sp_object_id
}

output "resource_group_name" {
  value = var.dns_record
}

output "resource_location" {
  value = var.location
}

output "storage_account_secret" {
  value     = module.azure-tenant-resources.out_storage_account_key
  sensitive = true
}

output "subscription_id" {
  sensitive = true
  value     = var.subscription_id
}

output "cluster_name" {
  value = var.cluster_name
}