terraform {
  required_providers {
    kubectl = {
      source  = "alekc/kubectl"
      version = "2.0.4"
    }
    azapi = {
      source  = "Azure/azapi"
      version = "2.2.0"
    }
  }
}