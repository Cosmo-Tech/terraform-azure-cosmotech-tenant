locals {
  tenant_managed_disk_access = "${var.tenant_managed_disk_name}-access"
}

resource "azurerm_disk_access" "cosmotech-disk" {
  name                = local.tenant_managed_disk_access
  resource_group_name = var.resource_group
  location            = var.location
  tags                = var.tags
}

resource "azurerm_managed_disk" "cosmotech-database-disk" {
  name                 = var.tenant_managed_disk_name
  resource_group_name  = var.resource_group
  disk_size_gb         = var.redis_disk_size_gb
  location             = var.location
  storage_account_type = var.redis_disk_sku
  tier                 = var.disk_tier
  create_option        = "Empty"

  public_network_access_enabled = false
  network_access_policy         = "AllowPrivate"
  disk_access_id                = azurerm_disk_access.cosmotech-disk.id

  tags = var.tags
}

resource "azurerm_role_assignment" "managed_disk_role_1" {
  scope                = azurerm_managed_disk.cosmotech-database-disk.id
  role_definition_name = "Owner"
  principal_id         = var.platform_common_sp_object_id
}

resource "azurerm_role_assignment" "managed_disk_role_2" {
  scope                = azurerm_managed_disk.cosmotech-database-disk.id
  role_definition_name = "Owner"
  principal_id         = var.platform_sp_object_id
}

resource "azurerm_private_endpoint" "disk_private_endpoint" {
  name                = "disk-privateendpoint"
  location            = var.location
  resource_group_name = var.resource_group
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = "privatediskconnection"
    private_connection_resource_id = azurerm_disk_access.cosmotech-disk.id # Must point to the disk access resource
    is_manual_connection           = false
    subresource_names              = ["disks"]
  }

  private_dns_zone_group {
    name                 = "storage-dns-zone-group"
    private_dns_zone_ids = [var.private_dns_zone_id]
  }
}