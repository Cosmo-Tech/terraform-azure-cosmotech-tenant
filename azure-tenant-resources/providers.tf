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