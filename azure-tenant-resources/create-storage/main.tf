resource "azurerm_storage_account" "storage_account" {
  name                            = var.storage_name
  resource_group_name             = var.resource_group
  location                        = var.location
  account_tier                    = var.storage_tier
  account_replication_type        = var.storage_replication_type
  account_kind                    = var.storage_kind
  default_to_oauth_authentication = var.default_to_oauth_authentication
  min_tls_version                 = var.min_tls_version
  shared_access_key_enabled       = var.shared_access_key_enabled
  https_traffic_only_enabled      = var.enable_https_traffic_only
  access_tier                     = var.access_tier
  public_network_access_enabled   = var.public_network_access_enabled # Must be false with private endpoints
  tags                            = var.tags
  network_rules {
    bypass                     = ["AzureServices"]
    default_action             = var.storage_default_action # Same as for public_network_access
    ip_rules                   = [var.storage_csm_ip]
    virtual_network_subnet_ids = [var.subnet_id]
  }
}

resource "azurerm_private_endpoint" "storage_private_endpoint" {
  name                = "storage-privateendpoint"
  location            = var.location
  resource_group_name = var.resource_group
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = "privatestorageconnection"
    private_connection_resource_id = azurerm_storage_account.storage_account.id
    is_manual_connection           = false
    subresource_names              = ["blob"]
  }

  private_dns_zone_group {
    name                 = "storage-dns-zone-group"
    private_dns_zone_ids = [var.private_dns_zone_id]
  }
}

resource "kubernetes_secret" "storage_account_password" {
  metadata {
    name      = "storage-account-secret"
    namespace = var.kubernetes_tenant_namespace
  }

  data = {
    "name"     = azurerm_storage_account.storage_account.name
    "password" = azurerm_storage_account.storage_account.primary_access_key
  }

  type = "Opaque"

  depends_on = [azurerm_storage_account.storage_account]
}
