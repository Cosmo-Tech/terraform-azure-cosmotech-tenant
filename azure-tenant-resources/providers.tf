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