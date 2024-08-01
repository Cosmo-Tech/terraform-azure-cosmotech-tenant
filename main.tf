locals {
  host                   = local.kube_config.0.host
  client_certificate     = base64decode(local.kube_config.0.client_certificate)
  client_key             = base64decode(local.kube_config.0.client_key)
  cluster_ca_certificate = base64decode(local.kube_config.0.cluster_ca_certificate)
}

locals {
  kube_config     = var.kubernetes_cluster_admin_activate ? data.azurerm_kubernetes_cluster.current.kube_admin_config : data.azurerm_kubernetes_cluster.current.kube_config
  tls_secret_name = var.tls_certificate_type == "let_s_encrypt" ? "letsencrypt-prod" : "custom-tls-secret"
}

data "azurerm_resource_group" "current" {
  name = var.kubernetes_resource_group
}

data "azurerm_kubernetes_cluster" "current" {
  name                = var.cluster_name
  resource_group_name = var.kubernetes_resource_group
}

data "azurerm_virtual_network" "current" {
  name                = var.network_name
  resource_group_name = var.network_resource_group
}

data "azurerm_resource_group" "tenant_rg" {
  count = var.deployment_type != "ARM" ? 0 : 1
  name  = var.tenant_resource_group
}

resource "azurerm_resource_group" "tenant_rg" {
  count    = var.deployment_type != "ARM" ? 1 : 0
  name     = var.tenant_resource_group
  location = var.location
}

data "azurerm_resource_group" "tenant_rg" {
  count = var.deployment_type != "ARM" ? 0 : 1
  name  = var.tenant_resource_group
}
