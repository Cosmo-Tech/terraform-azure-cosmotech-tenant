locals {
  cleaned_cluster_name        = replace(var.cluster_name, "/[[:^alnum:]]/", "")
  cleaned_resource_group_name = replace(var.tenant_resource_group.name, "/[[:^alnum:]]/", "")
  cleaned_managed_disk_name   = replace(var.managed_disk_name, "/[[:^alnum:]]/", "")
  cosmosdb_name               = "csm${local.cleaned_cluster_name}-${local.cleaned_resource_group_name}"
  eventhub_name               = substr("evname-${local.cleaned_cluster_name}-${local.cleaned_resource_group_name}", 0, 50)
  kusto_name                  = substr("kusto${local.cleaned_resource_group_name}${random_string.random_storage_id.result}", 0, 21)
  managed_disk_name           = local.cleaned_managed_disk_name != "" ? local.cleaned_managed_disk_name : substr("cosmotech-database-disk-${local.cleaned_resource_group_name}", 0, 80)
  storage_name                = substr("${local.cleaned_cluster_name}${random_string.random_storage_id.result}", 0, 23)
  container_registry_name     = substr("acr${local.cleaned_resource_group_name}${random_string.random_storage_id.result}", 0, 50)
  backup_instance_name        = "cosmo-backup-instance-${local.cleaned_resource_group_name}"
  backup_policy_name          = "cosmo-backup-policy-${local.cleaned_resource_group_name}"
  subnet_name                 = "default"
  vnet_iprange                = var.vnet_iprange != "" ? var.vnet_iprange : "10.10.0.0/16"
  tags = {
    vendor      = "cosmotech"
    stage       = var.project_stage
    customer    = var.customer_name
    project     = var.project_name
    cost_center = var.cost_center
  }
}

resource "random_string" "random_storage_id" {
  length  = 6
  special = false
  upper   = false
}

resource "azurerm_role_assignment" "rg_owner" {
  scope                = var.tenant_resource_group.id
  role_definition_name = "Owner"
  principal_id         = var.platform_group_id
}

resource "azurerm_role_assignment" "publicip_contributor" {
  scope                = var.tenant_resource_group.id
  role_definition_name = "Contributor"
  principal_id         = var.networkadt_sp_object_id
}

resource "azurerm_role_assignment" "publicip_owner" {
  scope                = var.platform_public_ip
  role_definition_name = "Owner"
  principal_id         = var.principal_id
}