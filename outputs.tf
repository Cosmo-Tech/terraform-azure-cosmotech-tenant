output "out_acr_login_server" {
  value = module.azure-tenant-resources.out_acr_login_server
}

output "out_acr_login_username" {
  value = module.azure-tenant-resources.out_acr_login_username
}

output "out_acr_login_server_url" {
  value = module.azure-tenant-resources.out_acr_login_server_url
}

output "out_acr_login_password" {
  value     = module.azure-tenant-resources.out_acr_login_password
  sensitive = true
}

output "out_adx_cluster_uri" {
  value = module.azure-tenant-resources.out_adx_cluster_uri
}

output "out_adx_cluster_principal_id" {
  value = module.azure-tenant-resources.out_adx_cluster_principal_id
}

output "out_adx_cluster_name" {
  value = module.azure-tenant-resources.out_adx_cluster_name
}

output "out_api_cosmo_url" {
  value = var.deployment_type != "ARM" ? module.azure-tenant-prerequisites.0.out_cosmo_api_url : "https://${var.network_dns_record}.${var.network_dns_zone_name}/${var.kubernetes_tenant_namespace}/${var.cosmotech_api_version_path}"
}

output "out_api_cosmo_scope" {
  value = "https://${var.network_dns_record}.${var.network_dns_zone_name}/${var.kubernetes_tenant_namespace}/.default"
}

output "out_api_cosmo_version_path" {
  value = var.cosmotech_api_version_path
}

output "out_tenant_resource_group" {
  value = var.tenant_resource_group
}

output "out_tenant_sp_client_id" {
  value = var.deployment_type != "ARM" ? module.azure-tenant-prerequisites.0.out_platform_sp_client_id : var.client_id
}

output "out_tenant_sp_object_id" {
  value = var.deployment_type != "ARM" ? module.azure-tenant-prerequisites.0.out_platform_sp_object_id : var.tenant_sp_object_id
}

output "out_azure_resource_location" {
  value = var.location
}

output "out_azure_storage_account_name" {
  value = module.azure-tenant-resources.out_azure_storage_account_name
}

output "out_azure_storage_account_key" {
  value     = module.azure-tenant-resources.out_azure_storage_account_key
  sensitive = true
}

output "out_babylon_sp_client_id" {
  value = var.deployment_type != "ARM" ? module.azure-tenant-prerequisites.0.out_babylon_sp_client_id : var.babylon_sp_client_id
}

output "out_babylon_sp_object_id" {
  value = var.deployment_type != "ARM" ? module.azure-tenant-prerequisites.0.out_babylon_sp_object_id : var.babylon_sp_object_id
}

output "out_babylon_sp_client_secret" {
  value     = var.deployment_type != "ARM" ? module.azure-tenant-prerequisites.0.out_babylon_sp_client_secret : var.babylon_sp_client_secret
  sensitive = true
}

output "out_subscription_id" {
  value = var.subscription_id
}

output "out_identifier_uri" {
  value = var.identifier_uri
}

output "out_monitoring_namespace" {
  value = var.monitoring_namespace
}

output "out_restish_sp_client_id" {
  value = var.deployment_type != "ARM" ? module.azure-tenant-prerequisites.0.out_restish_sp_client_id : var.restish_sp_client_id
}

output "out_restish_sp_client_secret" {
  value     = var.deployment_type != "ARM" ? module.azure-tenant-prerequisites.0.out_restish_sp_client_secret : var.restish_sp_client_secret
  sensitive = true
}

output "out_swagger_sp_client_id" {
  value = var.deployment_type != "ARM" ? module.azure-tenant-prerequisites.0.out_swagger_sp_client_id : var.swagger_sp_client_id
}

output "out_babylon_sp_name" {
  value = module.azure-tenant-prerequisites.0.out_babylon_sp_name
}

output "out_platform_sp_name" {
  value = module.azure-tenant-prerequisites.0.out_platform_name
}

output "out_swagger_sp_name" {
  value = module.azure-tenant-prerequisites.0.out_swagger_name
}
