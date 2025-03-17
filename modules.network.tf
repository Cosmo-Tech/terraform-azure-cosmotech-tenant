module "create-network-resources" {
  source = "./create-network-resources"

  count = var.network_deploy ? 1 : 0

  tags                                         = var.tags
  subnet_name                                  = var.network_subnet_name
  subscription_id                              = var.subscription_id
  location                                     = var.location
  tenant_virtual_subnet_network_address_prefix = var.network_tenant_subnet_address_prefix
  tenant_virtual_network_address_prefix        = var.network_tenant_address_prefix
  tenant_resource_group                        = var.tenant_resource_group
  kubernetes_resource_group                    = var.kubernetes_resource_group
  platform_vnet                                = data.azurerm_virtual_network.current.0
  networkadt_sp_object_id                      = var.network_sp_object_id
  vnet_resource_group                          = var.network_resource_group
  blob_privatedns_zonename                     = var.blob_private_dns_zonename
  eventhub_privatedns_zonename                 = var.eventhub_private_dns_zonename

  depends_on = [data.azurerm_virtual_network.current]
}
