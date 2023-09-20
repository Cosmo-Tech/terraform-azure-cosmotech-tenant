output "cosmos_uri" {
  value     = azurerm_cosmosdb_account.cosmosdb.endpoint
  sensitive = true
}

output "cosmos_key" {
  value     = azurerm_cosmosdb_account.cosmosdb.primary_key
  sensitive = true
}