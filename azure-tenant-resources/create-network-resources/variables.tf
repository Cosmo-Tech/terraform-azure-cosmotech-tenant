variable "tenant_resource_group" {
  description = "Name of the resource group where the tenant resources will be created"
  type        = string
}

variable "platform_resource_group" {
  description = "Name of the resource group where the platform resources are created"
  type        = string
}

variable "location" {
  description = "Azure region where the resources will be created"
  type        = string
}

variable "vnet_iprange" {
  description = "IP range for the virtual network"
  type        = string
}

variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
  default     = "default"
}

variable "tags" {
  description = "Tags to be applied to the resources"
  type        = map(string)
  default     = {}
}

variable "subscription_id" {
  description = "Azure subscription ID"
  type        = string
}

variable "platform_vnet" {
  description = "The platform virtual network"
  type = object({
    id   = string
    name = string
  })
}

variable "networkadt_sp_object_id" {
  description = "The object ID of the network ADT service principal"
  type        = string
}
variable "vnet_resource_group" {
  type = string
}

variable "blob_privatedns_zonename" {
  type    = string
}
