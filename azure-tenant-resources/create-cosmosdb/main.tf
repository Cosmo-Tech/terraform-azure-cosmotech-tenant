
resource "azurerm_cosmosdb_account" "cosmosdb" {
  name                = var.cosmosdb_name
  location            = var.location
  kind                = "GlobalDocumentDB"
  resource_group_name = var.tenant_resource_group
  tags                = var.tags

  geo_location {
    location          = var.location
    failover_priority = var.failover_priority
  }
  identity {
    type = "SystemAssigned"
  }
  public_network_access_enabled = var.public_network_access_enabled
  # enable_automatic_failover             = false
  # enable_multiple_write_locations       = false
  is_virtual_network_filter_enabled  = var.is_virtual_network_filter_enabled
  access_key_metadata_writes_enabled = var.access_key_metadata_writes_enabled # Important to give 'write' (aka POST) rights !!!
  # enable_free_tier                      = false
  analytical_storage_enabled            = var.analytical_storage_enabled
  offer_type                            = "Standard"
  network_acl_bypass_for_azure_services = var.network_acl_bypass_for_azure_services
  consistency_policy {
    consistency_level       = var.consistency_level
    max_interval_in_seconds = var.consistency_interval_in_minutes
    max_staleness_prefix    = var.consistency_max_staleness_prefix
  }
  backup {
    type                = var.backup_type
    interval_in_minutes = var.backup_interval_in_minutes
    retention_in_hours  = var.backup_retention_in_hours
    storage_redundancy  = var.backup_storage_redundancy
  }
  capabilities {
    name = "EnableServerless"
  }
  lifecycle {
    ignore_changes = [
      identity,
    ]
  }
}

resource "azurerm_cosmosdb_sql_database" "cosmosdb_sql" {
  name                = "phoenix-core"
  resource_group_name = azurerm_cosmosdb_account.cosmosdb.resource_group_name
  account_name        = azurerm_cosmosdb_account.cosmosdb.name
}