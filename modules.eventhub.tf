locals {
  eventhub_name = substr("evname-${local.cleaned_tenant_name}", 0, 50)
}

module "create-eventhub" {
  source = "./create-eventhub"

  count = var.create_eventhub ? 1 : 0

  tags                          = var.tags
  eventhub_name                 = local.eventhub_name
  eventhub_capacity             = var.eventhub_capacity
  location                      = var.location
  tenant_resource_group         = var.tenant_resource_group
  kubernetes_resource_group     = var.kubernetes_resource_group
  private_dns_zone_id           = module.create-network-resources.0.out_blob_private_dns_zone_id
  subnet_id                     = module.create-network-resources.0.out_subnet_id
  public_network_access_enabled = var.eventhub_public_network_access_enabled

  depends_on = [module.create-network-resources]
}
