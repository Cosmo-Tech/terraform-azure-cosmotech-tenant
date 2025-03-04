terraform {
  required_providers {
    kubectl = {
      source  = "alekc/kubectl"
      version = "2.0.4"
    }
    # For ai search index deployment
    restapi = {
      source  = "Mastercard/restapi"
      version = "1.20.0"
    }
  }
}

data "azurerm_search_service_keys" "search_keys" {
  name                = azurerm_search_service.search_service.name
  resource_group_name = var.tenant_resource_group
  depends_on          = [azurerm_search_service.search_service]
}

provider "restapi" {
  uri                  = "https://${azurerm_search_service.search_service.name}.search.windows.net"
  write_returns_object = true
  headers = {
    "api-key"      = data.azurerm_search_service_keys.search_keys.primary_key,
    "Content-Type" = "application/json"
  }
}