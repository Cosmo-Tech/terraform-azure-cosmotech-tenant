locals {
  tls_secret_name = var.tls_certificate_type == "let_s_encrypt" ? "letsencrypt-prod" : "custom-tls-secret"
}

data "azurerm_resource_group" "current" {
  count = var.cloud_provider == "azure" ? 1 : 0
  name  = var.kubernetes_resource_group
}

data "azurerm_kubernetes_cluster" "current" {
  count               = var.cloud_provider == "azure" ? 1 : 0
  name                = var.cluster_name
  resource_group_name = var.kubernetes_resource_group
}

data "azurerm_virtual_network" "current" {
  count               = var.cloud_provider == "azure" ? 1 : 0
  name                = var.network_name
  resource_group_name = var.network_resource_group
}

data "azurerm_resource_group" "tenant_rg" {
  count = var.deployment_type == "ARM" ? 1 : 0
  name  = var.tenant_resource_group
}

resource "azurerm_resource_group" "tenant_rg" {
  count    = var.cloud_provider == "azure" ? 1 : 0
  name     = var.tenant_resource_group
  location = var.location
}

resource "kubernetes_namespace" "main_namespace" {
  metadata {
    name = var.kubernetes_tenant_namespace
  }
}
