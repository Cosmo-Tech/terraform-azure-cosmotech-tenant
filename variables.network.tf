variable "vnet_name" {
  description = "The virtual network of the platform common resources"
  type        = string
}

variable "vnet_resource_group" {
  type = string
}

variable "tenant_virtual_network_address_prefix" {
  description = "The Virtual Network IP range. Minimum /26 NetMaskLength"
  type        = string
  default     = "10.40.0.0/16"
}

variable "tenant_virtual_subnet_network_address_prefix" {
  type    = string
  default = "10.40.0.0/24"
}

variable "create_publicip" {
  description = "Create the public IP for the platform"
  type        = bool
  default     = false
}

variable "public_ip_name" {
  description = "The public IP resource of the platform"
  type        = string
}

variable "publicip_resource_group" {
  type = string
}

variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
  default     = "default"
}

variable "create_dnsrecord" {
  description = "Create the DNS record"
  type        = bool
  default     = false
}

variable "api_dns_name" {
  type = string
}

variable "blob_privatedns_zonename" {
  type    = string
  default = "privatelink.blob.core.windows.net"
}

variable "queue_privatedns_zonename" {
  type    = string
  default = "privatelink.queue.core.windows.net"
}

variable "table_privatedns_zonename" {
  type    = string
  default = "privatelink.table.core.windows.net"
}

variable "kusto_privatedns_zonename" {
  type    = string
  default = "privatelink.kusto.core.windows.net"
}

variable "eventhub_privatedns_zonename" {
  type    = string
  default = "privatelink.servicebus.windows.net"
}

variable "adt_privatedns_zonename" {
  type    = string
  default = "privatelink.digitaltwins.azure.net"
}

variable "network_client_id" {
  type = string
}

variable "network_client_secret" {
  type    = string
  default = ""
}

variable "network_sp_object_id" {
  description = "The object id of the network service principal"
  type        = string
  default     = ""
}