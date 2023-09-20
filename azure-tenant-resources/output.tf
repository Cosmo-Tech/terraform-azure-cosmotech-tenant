output "out_storage_account_name" {
  value = module.create-storage.out_storage_account_name
}

output "out_storage_account_key" {
  value     = module.create-storage.out_storage_account_key
  sensitive = true
}

output "out_acr_login_server" {
  value     = module.create-container-registry.out_acr_login_server
  sensitive = true
}

output "out_acr_login_username" {
  value     = module.create-container-registry.out_acr_login_username
  sensitive = true
}

output "out_acr_login_password" {
  value     = module.create-container-registry.out_acr_login_password
  sensitive = true
}

output "managed_disk_id" {
  value = module.create-disk.managed_disk_id
}

output "cosmos_uri" {
  value     = var.create_cosmosdb ? module.create-cosmosdb[0].endpoint : ""
  sensitive = true
}

output "cosmos_key" {
  value     = var.create_cosmosdb ? module.create-cosmosdb[0].primary_key : ""
  sensitive = true
}

output "eventbus_uri" {
  value     = module.create-eventhub.eventbus_uri
  sensitive = true
}

output "adx_uri" {
  value = var.create_adx ? module.create-kusto.0.adx_uri : ""
}

output "adx_ingestion_uri" {
  value = var.create_adx ? module.create-kusto.0.adx_ingestion_uri : ""
}

output "backup_instance_disk" {
  value = var.create_backup ? module.create-backup.0.backup_instance_disk : null
}