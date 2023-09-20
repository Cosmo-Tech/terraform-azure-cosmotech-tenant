resource "azurerm_container_registry" "acr" {
  name                      = var.container_name
  resource_group_name       = var.resource_group
  location                  = var.location
  sku                       = "Standard"
  admin_enabled             = true
  quarantine_policy_enabled = false
  trust_policy = [{
    enabled = false
  }]
  retention_policy = [{
    days    = 7
    enabled = false
  }]
  data_endpoint_enabled         = false
  public_network_access_enabled = true
  network_rule_bypass_option    = "AzureServices"
  zone_redundancy_enabled       = false
  tags                          = var.tags
}