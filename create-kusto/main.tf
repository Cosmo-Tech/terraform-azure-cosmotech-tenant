resource "azurerm_kusto_cluster" "kusto" {
  name                = var.kusto_name
  location            = var.location
  resource_group_name = var.tenant_resource_group
  sku {
    name     = var.kusto_instance_type
    capacity = var.kustonr_instances
  }
  identity {
    type = "SystemAssigned"
  }
  trusted_external_tenants      = var.trusted_external_tenants
  disk_encryption_enabled       = var.disk_encryption_enabled
  streaming_ingestion_enabled   = var.streaming_ingestion_enabled
  purge_enabled                 = var.purge_enabled
  double_encryption_enabled     = var.double_encryption_enabled
  public_network_access_enabled = var.public_network_access_enabled
  auto_stop_enabled             = var.auto_stop_kusto
  tags                          = var.tags
}

resource "azurerm_private_endpoint" "kusto_private_endpoint" {
  name                = "kusto-privateendpoint"
  location            = var.location
  resource_group_name = var.tenant_resource_group
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = "privatekustoconnection"
    private_connection_resource_id = azurerm_kusto_cluster.kusto.id
    is_manual_connection           = false
    subresource_names              = ["cluster"]
  }

  private_dns_zone_group {
    name                 = "storage-dns-zone-group"
    private_dns_zone_ids = [var.private_dns_zone_id]
  }
}