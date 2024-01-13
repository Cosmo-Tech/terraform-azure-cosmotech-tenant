output "out_adx_name" {
  value = azurerm_kusto_cluster.kusto.name
}

output "out_adx_uri" {
  value = azurerm_kusto_cluster.kusto.uri
}

output "out_adx_ingestion_uri" {
  value = azurerm_kusto_cluster.kusto.data_ingestion_uri
}

output "out_adx_principal_id" {
  value = azurerm_kusto_cluster.kusto.identity.principalId
}