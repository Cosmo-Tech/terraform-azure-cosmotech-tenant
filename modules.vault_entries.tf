module "create-vault-entries" {
  source = "./create-vault-entries"

  count = var.vault_create_entries ? 1 : 0

  tenant_id                   = var.tenant_id
  kubernetes_tenant_namespace = var.kubernetes_tenant_namespace
  platform_id                 = var.platform_id
  organization_name           = var.organization_name
  vault_addr                  = var.vault_address
  vault_token                 = var.vault_token
  storage_account_name        = var.tf_storage_account_name
  storage_account_key         = var.tf_access_key
  storage_container           = var.tf_container_name
  tf_blob_name_tenant         = var.tf_blob_name_tenant
  vault_namespace             = var.vault_namespace
  vault_sops_namespace        = var.vault_secrets_operator_namespace
  engine_secret               = var.engine_secret
  engine_version              = var.engine_version
  vault_sops_deploy           = var.vault_secrets_operator_deploy
  container_tag               = var.container_tag

  depends_on = [
    module.create-container-registry,
    module.create-eventhub,
    module.create-kusto,
    module.create-storage,
    module.create-network-resources,
  ]
}
