locals {
  host                   = local.kube_config.0.host
  client_certificate     = base64decode(local.kube_config.0.client_certificate)
  client_key             = base64decode(local.kube_config.0.client_key)
  cluster_ca_certificate = base64decode(local.kube_config.0.cluster_ca_certificate)
}

provider "kubernetes" {
  host                   = local.host
  client_certificate     = local.client_certificate
  client_key             = local.client_key
  cluster_ca_certificate = local.cluster_ca_certificate
}

provider "helm" {
  kubernetes {
    host                   = local.host
    client_certificate     = local.client_certificate
    client_key             = local.client_key
    cluster_ca_certificate = local.cluster_ca_certificate
  }
}

provider "kubectl" {
  host                   = local.host
  client_certificate     = local.client_certificate
  client_key             = local.client_key
  cluster_ca_certificate = local.cluster_ca_certificate

  load_config_file = false
}

locals {
  api_dns_name = "${data.azurerm_dns_a_record.current.name}.${var.dns_zone_name}"
  kube_config  = data.azurerm_kubernetes_cluster.current.kube_config
}

data "azurerm_kubernetes_cluster" "current" {
  name                = var.cluster_name
  resource_group_name = var.platform_resource_group
}

data "azurerm_dns_a_record" "current" {
  name                = var.dns_record
  zone_name           = var.dns_zone_name
  resource_group_name = "phoenix"
}

data "azurerm_public_ip" "current" {
  name                = var.platform_public_ip
  resource_group_name = var.platform_resource_group
}

data "azurerm_virtual_network" "current" {
  name                = var.platform_vnet
  resource_group_name = var.platform_resource_group
}

data "azurerm_resource_group" "current" {
  name = var.platform_resource_group
}

data "azuread_service_principal" "platform" {
  display_name = var.platform_sp_name
}

resource "azurerm_resource_group" "tenant_rg" {
  name     = var.tenant_resource_group
  location = var.location
}