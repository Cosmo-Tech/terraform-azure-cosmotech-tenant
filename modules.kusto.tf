locals {
  kusto_name = substr("kusto${local.cleaned_tenant_name}${random_string.random_storage_id.result}", 0, 21)
}

module "create-kusto" {
  source = "./create-kusto"

  count = var.kusto_deploy ? 1 : 0

  tags                          = var.tags
  kusto_name                    = local.kusto_name
  location                      = var.location
  tenant_resource_group         = var.tenant_resource_group
  kusto_instance_type           = var.kusto_instance_type
  kustonr_instances             = var.kustonr_instances
  trusted_external_tenants      = var.kusto_trusted_external_tenants
  disk_encryption_enabled       = var.kusto_disk_encryption_enabled
  streaming_ingestion_enabled   = var.kusto_streaming_ingestion_enabled
  purge_enabled                 = var.kusto_purge_enabled
  double_encryption_enabled     = var.kusto_double_encryption_enabled
  public_network_access_enabled = var.kusto_public_network_access_enabled
  private_dns_zone_id           = var.network_deploy ? module.create-network-resources.0.out_blob_private_dns_zone_id : ""
  subnet_id                     = var.network_deploy ? module.create-network-resources.0.out_subnet_id : ""
  auto_stop_kusto               = var.kusto_auto_stop
  kubernetes_tenant_namespace   = var.kubernetes_tenant_namespace

  depends_on = [module.create-network-resources]
}
