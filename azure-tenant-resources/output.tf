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

output "out_managed_disk_id" {
  value = module.create-disk.out_managed_disk_id
}

output "out_cosmos_uri" {
  value     = var.create_cosmosdb ? module.create-cosmosdb[0].endpoint : ""
  sensitive = true
}

output "out_cosmos_key" {
  value     = var.create_cosmosdb ? module.create-cosmosdb[0].primary_key : ""
  sensitive = true
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

output "out_adx_uri" {
  value = var.create_adx ? module.create-kusto.0.out_adx_uri : ""
}

output "out_adx_ingestion_uri" {
  value = var.create_adx ? module.create-kusto.0.out_adx_ingestion_uri : ""
}

output "out_adx_name" {
  value = var.create_adx ? module.create-kusto.0.out_adx_name : ""
}

output "out_adx_principal_id" {
  value = var.create_adx ? module.create-kusto.0.out_adx_principal_id : ""
}
