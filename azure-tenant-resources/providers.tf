terraform {
  required_providers {
    kubectl = {
      source  = "alekc/kubectl"
      version = "2.1.3"
    }
    # For ai search index deployment
    restapi = {
      source  = "Mastercard/restapi"
      version = "1.20.0"
    }
  }
}

provider "restapi" {
  uri                  = "https://${azurerm_search_service.search_service[0].name}.search.windows.net"
  write_returns_object = true
  headers = {
    "api-key"      = "${azurerm_search_service.search_service[0].primary_key}",
    "Content-Type" = "application/json"
  }
}