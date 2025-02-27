output "out_azure_storage_account_name" {
  value = module.create-storage.out_storage_account_name
}

output "out_azure_storage_account_key" {
  value     = module.create-storage.out_storage_account_key
  sensitive = true
}

output "out_acr_login_server" {
  value     = module.create-container-registry.out_acr_login_server
  sensitive = true
}

output "out_acr_login_server_url" {
  value     = module.create-container-registry.out_acr_login_server_url
}

output "out_acr_login_username" {
  value     = module.create-container-registry.out_acr_login_username
  sensitive = true
}

output "out_acr_login_password" {
  value     = module.create-container-registry.out_acr_login_password
  sensitive = true
}

output "out_managed_disk_id" {
  value = module.create-disk.out_managed_disk_id
}

output "out_eventbus_uri" {
  value     = var.create_eventhub ? module.create-eventhub.0.out_eventbus_uri : ""
  sensitive = true
}

output "out_backup_instance_disk" {
  value = var.create_backup ? module.create-backup.0.out_backup_instance_disk : null
}

output "out_vnet" {
  value = module.create-network-resources.out_vnet
}

output "out_subnet_name" {
  value = module.create-network-resources.out_subnet_name
}

output "out_subnet_id" {
  value = module.create-network-resources.out_subnet_id
}

output "out_private_dns_zone_id" {
  value = module.create-network-resources.out_blob_private_dns_zone_id
}

output "out_adx_cluster_uri" {
  value = var.create_adx ? module.create-kusto.0.out_adx_uri : ""
}

output "out_adx_ingestion_uri" {
  value = var.create_adx ? module.create-kusto.0.out_adx_ingestion_uri : ""
}

output "out_adx_cluster_name" {
  value = var.create_adx ? module.create-kusto.0.out_adx_name : ""
}

output "out_adx_cluster_principal_id" {
  value = var.create_adx ? module.create-kusto.0.out_adx_principal_id : ""
}

output "out_copilot_bot_name" {
  value       = var.create_copilot ? module.create-copilot.0.out_copilot_bot_name : ""
}

output "out_copilot_bot_endpoint" {
  value       = var.create_copilot ? module.create-copilot.0.out_copilot_bot_endpoint : ""
}

output "out_copilot_microsoft_app_id" {
  value       = var.create_copilot ? module.create-copilot.0.out_copilot_microsoft_app_id : ""
}

output "out_copilot_openai_endpoint" {
  value       = var.create_copilot ? module.create-copilot.0.out_copilot_openai_endpoint : ""
}

output "out_copilot_search_endpoint" {
  value       = var.create_copilot ? module.create-copilot.0.out_copilot_search_endpoint : ""
}

output "out_copilot_search_index_name" {
  value       = var.create_copilot ? module.create-copilot.0.out_copilot_search_index_name : ""
}

output "out_copilot_function_app_url" {
  value       = var.create_copilot ? module.create-copilot.0.out_copilot_function_app_url : ""
}

output "out_copilot_web_app_url" {
  value       = var.create_copilot ? module.create-copilot.0.out_copilot_web_app_url : ""
}

output "out_copilot_ada_deployment_name" {
  value       = var.create_copilot ? module.create-copilot.0.out_copilot_ada_deployment_name : ""
}

output "out_copilot_gpt4_deployment_name" {
  value       = var.create_copilot ? module.create-copilot.0.out_copilot_gpt4_deployment_name : ""
}

output "out_copilot_bot_directline_secret" {
  value       = var.create_copilot ? module.create-copilot.0.out_copilot_bot_directline_secret : ""
  sensitive   = true
}

output "out_copilot_openai_api_key" {
  value       = var.create_copilot ? module.create-copilot.0.out_copilot_openai_api_key : ""
  sensitive   = true
}

output "out_copilot_search_api_key" {
  value       = var.create_copilot ? module.create-copilot.0.out_copilot_search_api_key : ""
  sensitive   = true
}