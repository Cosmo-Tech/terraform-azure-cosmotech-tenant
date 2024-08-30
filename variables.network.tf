variable "network_sp_client_id" {
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

variable "network_name" {
  description = "The virtual network of the platform common resources"
  type        = string
}

variable "network_resource_group" {
  type = string
}

variable "network_tenant_address_prefix" {
  description = "The Virtual Network IP range. Minimum /26 NetMaskLength"
  type        = string
  default     = "10.40.0.0/16"
}

variable "network_tenant_subnet_address_prefix" {
  type    = string
  default = "10.40.0.0/24"
}

variable "network_subnet_name" {
  description = "Name of the subnet"
  type        = string
  default     = "default"
}

variable "network_dns_record_create" {
  description = "Create the DNS record"
  type        = bool
  default     = false
}

variable "blob_private_dns_zonename" {
  type    = string
  default = "privatelink.blob.core.windows.net"
}

variable "queue_private_dns_zonename" {
  type    = string
  default = "privatelink.queue.core.windows.net"
}

variable "table_private_dns_zonename" {
  type    = string
  default = "privatelink.table.core.windows.net"
}

variable "eventhub_private_dns_zonename" {
  type    = string
  default = "privatelink.servicebus.windows.net"
}

variable "adt_private_dns_zonename" {
  type    = string
  default = "privatelink.digitaltwins.azure.net"
}

variable "network_dns_record" {
  description = "The DNS zone name to create platform subdomain. Example: myplatform"
  type        = string
}

variable "network_dns_zone_name" {
  description = "The DNS zone name to create platform subdomain. Example: api.cosmotech.com"
  type        = string
  default     = "api.cosmotech.com"
}