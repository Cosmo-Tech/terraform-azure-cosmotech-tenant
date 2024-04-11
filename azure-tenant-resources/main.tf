locals {
  cleaned_tenant_name       = replace(var.tenant_resource_group.name, "/[[:^alnum:]]/", "")
  cleaned_managed_disk_name = replace(var.managed_disk_name, "/[[:^alnum:]]/", "")
  cosmosdb_name             = "csm${local.cleaned_tenant_name}-${local.cleaned_tenant_name}"
  eventhub_name             = substr("evname-${local.cleaned_tenant_name}", 0, 50)
  kusto_name                = substr("kusto${local.cleaned_tenant_name}${random_string.random_storage_id.result}", 0, 21)
  managed_disk_name         = local.cleaned_managed_disk_name != "" ? local.cleaned_managed_disk_name : substr("cosmotech-database-disk-${local.cleaned_tenant_name}", 0, 80)
  storage_name              = substr("${local.cleaned_tenant_name}${random_string.random_storage_id.result}", 0, 23)
  container_registry_name   = substr("acr${local.cleaned_tenant_name}${random_string.random_storage_id.result}", 0, 50)
  backup_instance_name      = "cosmo-backup-instance-${local.cleaned_tenant_name}"
  backup_policy_name        = "cosmo-backup-policy-${local.cleaned_tenant_name}"
  subnet_name               = "default"
  tags                      = var.tags
}

resource "random_string" "random_storage_id" {
  length  = 6
  special = false
  upper   = false
}

resource "azurerm_role_assignment" "rg_owner" {
  count                = var.deployment_type != "ARM" ? 1 : 0
  scope                = var.tenant_resource_group.id
  role_definition_name = "Owner"
  principal_id         = var.tenant_sp_object_id
}

resource "azurerm_role_assignment" "publicip_contributor" {
  count                = var.deployment_type != "ARM" ? 1 : 0
  scope                = var.tenant_resource_group.id
  role_definition_name = "Contributor"
  principal_id         = var.network_sp_object_id
}

# resource "azurerm_role_assignment" "publicip_owner" {
#   scope                = var.public_ip_id
#   role_definition_name = "Owner"
#   principal_id         = var.network_sp_object_id
# }

resource "azurerm_role_assignment" "tenant_contributor" {
  count                = var.deployment_type != "ARM" ? 1 : 0
  scope                = var.tenant_resource_group.id
  role_definition_name = "Contributor"
  principal_id         = var.common_platform_object_id
}
