resource "azurerm_eventhub_namespace" "eventbus_uri" {
  name                          = var.eventhub_name
  resource_group_name           = var.resource_group
  location                      = var.location
  sku                           = "Standard"
  capacity                      = 2
  public_network_access_enabled = true
  tags                          = var.tags
}

resource "azurerm_private_endpoint" "eventhub_private_endpoint" {
  name                = "eventhub-privateendpoint"
  location            = var.location
  resource_group_name = var.resource_group
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = "privateeventhubconnection"
    private_connection_resource_id = azurerm_eventhub_namespace.eventbus_uri.id
    is_manual_connection           = false
    subresource_names              = ["namespace"]
  }

  private_dns_zone_group {
    name                 = "storage-dns-zone-group"
    private_dns_zone_ids = [var.private_dns_zone_id]
  }
}