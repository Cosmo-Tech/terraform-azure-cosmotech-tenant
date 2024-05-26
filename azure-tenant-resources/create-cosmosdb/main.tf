
resource "azurerm_cosmosdb_account" "cosmosdb" {
  name                = var.cosmosdb_name
  location            = var.location
  kind                = "GlobalDocumentDB"
  resource_group_name = var.tenant_resource_group
  tags                = var.tags

  geo_location {
    location          = var.location
    failover_priority = 0
  }
  identity {
    type = "SystemAssigned"
  }
  public_network_access_enabled         = true
  # enable_automatic_failover             = false
  # enable_multiple_write_locations       = false
  is_virtual_network_filter_enabled     = false
  access_key_metadata_writes_enabled    = true # Important to give 'write' (aka POST) rights !!!
  # enable_free_tier                      = false
  analytical_storage_enabled            = false
  offer_type                            = "Standard"
  network_acl_bypass_for_azure_services = false
  consistency_policy {
    consistency_level       = "Session"
    max_interval_in_seconds = 5
    max_staleness_prefix    = 100
  }
  backup {
    type                = "Periodic"
    interval_in_minutes = 240
    retention_in_hours  = 8
    storage_redundancy  = "Geo"
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