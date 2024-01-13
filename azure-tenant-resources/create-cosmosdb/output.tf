output "out_cosmos_uri" {
  value     = azurerm_cosmosdb_account.cosmosdb.endpoint
  sensitive = true
}

output "out_cosmos_key" {
  value     = azurerm_cosmosdb_account.cosmosdb.primary_key
  sensitive = true
}