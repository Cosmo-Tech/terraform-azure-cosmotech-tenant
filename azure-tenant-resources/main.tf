locals {
  cleaned_tenant_name       = replace(var.tenant_resource_group.name, "/[[:^alnum:]]/", "")
  cosmosdb_name             = "csm${local.cleaned_tenant_name}-${local.cleaned_tenant_name}"
  eventhub_name             = substr("evname-${local.cleaned_tenant_name}", 0, 50)
  kusto_name                = substr("kusto${local.cleaned_tenant_name}${random_string.random_storage_id.result}", 0, 21)
  storage_name              = substr("${local.cleaned_tenant_name}${random_string.random_storage_id.result}", 0, 23)
  container_registry_name   = substr("acr${local.cleaned_tenant_name}${random_string.random_storage_id.result}", 0, 50)
  backup_instance_name      = "cosmo-backup-instance-${local.cleaned_tenant_name}"
  backup_policy_name        = "cosmo-backup-policy-${local.cleaned_tenant_name}"
  subnet_name               = var.subnet_name
  tags                      = var.tags
  local_deployer = {
    "NAMESPACE" = var.allowed_namespace
  }
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
  timeouts {
    create = "3m"
  }
}

resource "azurerm_role_assignment" "rg_network_owner" {
  count                = var.deployment_type != "ARM" ? 1 : 0
  scope                = var.tenant_resource_group.id
  role_definition_name = "Owner"
  principal_id         = var.network_sp_object_id
  timeouts {
    create = "3m"
  }
}

resource "kubectl_manifest" "deployer_sacc" {
  validate_schema = false
  yaml_body       = templatefile("${path.module}/manifests/sacc.yaml", local.local_deployer)
}

resource "kubectl_manifest" "deployer_role" {
  validate_schema = false
  yaml_body       = templatefile("${path.module}/manifests/role.yaml", local.local_deployer)
  depends_on = [
    kubectl_manifest.deployer_sacc
  ]
}

resource "kubectl_manifest" "deployer_rolb" {
  validate_schema = false
  yaml_body       = templatefile("${path.module}/manifests/rolb.yaml", local.local_deployer)

  depends_on = [
    kubectl_manifest.deployer_role
  ]
}