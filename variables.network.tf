variable "network_sp_client_id" {
  type = string
}

variable "network_client_secret" {
  type = string
}

variable "network_sp_object_id" {
  description = "The object id of the network service principal"
  type        = string
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
}

variable "network_tenant_subnet_address_prefix" {
  type = string
}

variable "network_subnet_name" {
  description = "Name of the subnet"
  type        = string
}

variable "network_dns_record_create" {
  description = "Create the DNS record"
  type        = bool
}

variable "blob_private_dns_zonename" {
  type = string
}

variable "queue_private_dns_zonename" {
  type = string
}

variable "table_private_dns_zonename" {
  type = string
}

variable "eventhub_private_dns_zonename" {
  type = string
}

variable "adt_private_dns_zonename" {
  type = string
}

variable "network_dns_record" {
  description = "The DNS zone name to create platform subdomain. Example: myplatform"
  type        = string
}

variable "network_dns_zone_name" {
  description = "The DNS zone name to create platform subdomain. Example: api.cosmotech.com"
  type        = string
}

variable "publicip_create" {
  description = "Create the public IP for the platform"
  type        = bool
}

variable "publicip_name" {
  description = "The public IP resource of the platform"
  type        = string
}

variable "publicip_resource_group" {
  type = string
}

